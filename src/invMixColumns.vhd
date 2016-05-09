library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.all;

entity invMixColumns is
	port (i : in  STATE;
			o : out STATE
			);
			
end invMixColumns;

architecture Behavioral of invMixColumns is
	signal mult_9 : STATE;
	signal mult_b : STATE;
	signal mult_d : STATE;
	signal mult_e : STATE;
	
begin
	loopWords_mult9:
	for j in 0 to 3 generate
		
		loopBytes_mult9:
		for k in 0 to 3 generate
			mult_9x: entity work.multiply_9 port map (i => i (j)(k), o => mult_9 (j)(k));
			
		end generate;
		
	end generate;
	
	loopWords_multb:
	for j in 0 to 3 generate
		
		loopBytes_multb:
		for k in 0 to 3 generate
			mult_bx: entity work.multiply_b port map (i => i (j)(k), o => mult_b (j)(k));
			
		end generate;
		
	end generate;
	
	loopWords_multd:
	for j in 0 to 3 generate
		
		loopBytes_multd:
		for k in 0 to 3 generate
			mult_dx: entity work.multiply_d port map (i => i (j)(k), o => mult_d (j)(k));
			
		end generate;
		
	end generate;
	
	loopWords_multe:
	for j in 0 to 3 generate
		
		loopBytes_multe:
		for k in 0 to 3 generate
			mult_ex: entity work.multiply_e port map (i => i (j)(k), o => mult_e (j)(k));
			
		end generate;
		
	end generate;
	
	loopMixColumns:
	for j in 0 to 3 generate
		o (j) <= (mult_b (j)(1) xor mult_d (j)(2) xor mult_9 (j)(3) xor mult_e (j)(0),
					 mult_b (j)(2) xor mult_d (j)(3) xor mult_9 (j)(0) xor mult_e (j)(1),
					 mult_b (j)(3) xor mult_d (j)(0) xor mult_9 (j)(1) xor mult_e (j)(2),
					 mult_b (j)(0) xor mult_d (j)(1) xor mult_9 (j)(2) xor mult_e (j)(3));
					 
	end generate;

end Behavioral;

