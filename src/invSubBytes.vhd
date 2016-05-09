library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.STATE;

entity invSubBytes is
	port (i : in STATE;
			o : out STATE
			);
			
end invSubBytes;

architecture Behavioral of invSubBytes is

begin
	loopWords:
	for j in 0 to 3 generate
		
		loopBytes:
		for k in 0 to 3 generate
			invSBoxx: entity work.invSBox port map (i (j)(k), o (j)(k));
			
		end generate;
		
	end generate;
	
end Behavioral;

