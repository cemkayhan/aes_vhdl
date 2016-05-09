library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.STATE;

entity mixColumns is
	port (i : in STATE;
			o : out STATE
			);
			
end mixColumns;

architecture Behavioral of mixColumns is
	signal mult_2 : STATE;
	signal mult_3 : STATE;
	
begin
	loopWords_mult2:
	for j in 0 to 3 generate
		
		loopBytes_mult2:
		for k in 0 to 3 generate
			multx_2: entity work.multiply_2 port map (i (j)(k), mult_2 (j)(k));
						
		end generate;
		
	end generate;
		
	loopWords_mult3:
	for j in 0 to 3 generate
		
		loopBytes_mult3:
		for k in 0 to 3 generate
			multx_3: entity work.multiply_3 port map (i (j)(k), mult_3 (j)(k));
					
		end generate;
				
	end generate;
		
	mixColumns:
	for j in 0 to 3 generate
		o (j) <= (i (j)(2) xor i (j)(3) xor mult_2 (j)(0) xor mult_3 (j)(1),
				    i (j)(0) xor i (j)(3) xor mult_2 (j)(1) xor mult_3 (j)(2),
					 i (j)(0) xor i (j)(1) xor mult_2 (j)(2) xor mult_3 (j)(3),
					 i (j)(1) xor i (j)(2) xor mult_2 (j)(3) xor mult_3 (j)(0));
									  
	end generate;
		
end Behavioral;

