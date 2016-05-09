library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.all;

entity lastState is
	generic (mode : AES_MODE := DECRYPTION);
	
	port (i : in  STATE;
			k : in  STATE;
			o : out STATE
			);
			
end lastState;

architecture Behavioral of lastState is
	signal tmp : STATE_ARRAY (0 to 1);

begin
	
	AES_ENC:
	if mode = ENCRYPTION generate
		subBytes   : entity work.subBytes    port map (i => i, o => tmp (0));
		shiftRows  : entity work.shiftRows   port map (i => tmp (0), o => tmp (1));
		addRoundKey: entity work.addRoundKey port map (i1 => tmp (1), i2 => k, o => o);     
	
	end generate;
	
	AES_DEC:
	if mode = DECRYPTION generate
		invShiftRows : entity work.invShiftRows port map (i => i, o => tmp (0));
		invSubBytes  : entity work.invSubBytes  port map (i => tmp (0), o => tmp (1));
		addRoundKey  : entity work.addRoundKey  port map (i1 => tmp (1), i2 => k, o => o);
		
	end generate;
 
end Behavioral;

