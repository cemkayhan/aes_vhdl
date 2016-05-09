library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.all;

entity subWord is
	port (i1 : in  WORD;
			i2 : in  WORD;
			o  : out WORD
			);
			
end subWord;

architecture Behavioral of subWord is
	signal tmp : WORD;
	
begin
	sBox1: entity work.sBox port map (i => i2 (0), o => tmp (0));
	sBox2: entity work.sBox port map (i => i2 (1), o => tmp (1));
	sBox3: entity work.sBox port map (i => i2 (2), o => tmp (2));
	sBox4: entity work.sBox port map (i => i2 (3), O => tmp (3));
	
	o <= (i1 (0) xor tmp (0), i1 (1) xor tmp (1), 
			i1 (2) xor tmp (2), i1 (3) xor tmp (3));

end Behavioral;

