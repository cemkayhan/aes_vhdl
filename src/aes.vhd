library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.all;

entity aes is
	generic (key_len : positive := 256;
				mode    : AES_MODE := ENCRYPTION);
	
	port (clk   : in  std_logic;
			reset : in  std_logic;
			i     : in  STATE;
			k     : in  WORD_ARRAY (0 to key_len / 32 - 1);
			o     : out STATE
			);
			
end aes;

architecture Behavioral of aes is
	type ROUND_TYPE is (round0, round1, round2, round3, round4, round5, round6, round7, 
							  round8, round9, round10, round11, round12, round13, round14);
							  
	signal round : ROUND_TYPE;	
	signal key_schedule : STATE_ARRAY (0 to key_len / 32 + 6);
	signal curr_key : STATE;
	signal curr_state : STATE;
	signal next_state : STATE;
	signal first_state : STATE;
	
begin
	key_len_128:
	if key_len = 128 generate
		
		generate_key_schedule:
		entity work.keyExpansion_128 generic map (mode => mode)
											  port map (k => k, o => key_schedule);
	
	end generate;
	
	key_len_192:
	if key_len = 192 generate
		
		generate_key_schedule:
		entity work.keyExpansion_192 generic map (mode => mode) 
											  port map (k => k, o => key_schedule);
		
	end generate;
	
	key_len_256:
	if key_len = 256 generate
		
		generate_key_schedule:
		entity work.keyExpansion_256 generic map (mode => mode)
											  port map (k => k, o => key_schedule);
		
	end generate;
	
	generate_first_state:
	entity work.addRoundKey port map (i1 => i, i2 => key_schedule (0), o => first_state);
	
	generate_next_state:
	entity work.nextState generic map (mode => mode)
								 port map (i => curr_state, k => curr_key, o => next_state);

	generate_last_state:  
	entity work.lastState generic map (mode => mode)
								 port map (i => curr_state, k => curr_key, o => o);
	
	process (clk, reset) begin
		if reset = '1' then
			round <= round0;
			
		elsif clk'event and clk = '1' then
			case round is
				when round0  => round <= round1;
									 curr_key <= key_schedule (1);
									 curr_state <= first_state;
									 
				when round1  => round <= round2;
									 curr_key <= key_schedule (2);
									 curr_state <= next_state;
									 
				when round2  => round <= round3;
									 curr_key <= key_schedule (3);
									 curr_state <= next_state;
									 
				when round3  => round <= round4;
									 curr_key <= key_schedule (4);
									 curr_state <= next_state;
									 
				when round4  => round <= round5;
									 curr_key <= key_schedule (5);
									 curr_state <= next_state;
									 
				when round5  => round <= round6;
									 curr_key <= key_schedule (6);
									 curr_state <= next_state;
									 
				when round6  => round <= round7;
									 curr_key <= key_schedule (7);
									 curr_state <= next_state;
									 
				when round7  => round <= round8;
									 curr_key <= key_schedule (8);
									 curr_state <= next_state;
									 
				when round8  => round <= round9;
									 curr_key <= key_schedule (9);
									 curr_state <= next_state;
									 
				when round9  => round <= round10;
									 curr_key <= key_schedule (10);
									 curr_state <= next_state;
									 
				when round10 => if key_len = 128 then
										round <= round10;
										curr_key <= key_schedule (10);
										curr_state <= curr_state;
									
									else
										round <= round11;
										curr_key <= key_schedule (11);
										curr_state <= next_state;
									 
									end if;	
				
				when round11 => if key_len /= 128 then
										round <= round12;
										curr_key <= key_schedule (12);
										curr_state <= next_state;
										
									 end if;
									 
				when round12 => if key_len = 192 then
										round <= round12;
										curr_key <= key_schedule (12);
										curr_state <= curr_state;
										
									 elsif key_len = 256 then
										round <= round13;
										curr_key <= key_schedule (13);
										curr_state <= next_state;
										
									 end if;
									 
				when round13 => if key_len = 256 then
										round <= round14;
										curr_key <= key_schedule (14);
										curr_state <= next_state;
								
									 end if;
									 
				when round14 => if key_len = 256 then
										round <= round14;
										curr_key <= key_schedule (14);
										curr_state <= curr_state;
										
									 end if;
									 
				when others  => round <= round0;
									 curr_key <= key_schedule (0);
									 curr_state <= curr_state;
				
			end case;
			
		end if;
		
	end process;

end Behavioral;

