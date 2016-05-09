library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.all;

entity keyExpansion_192 is
	generic (mode : AES_MODE := DECRYPTION);
	
	port (k : in  WORD_ARRAY  (0 to  5);
			o : out STATE_ARRAY (0 to 12)
			);
			
end keyExpansion_192;

architecture Behavioral of keyExpansion_192 is
	signal tmp : WORD_ARRAY (0 to 51);

begin
	tmp (0 to 5) <= k;
	
	xorWord01: entity work.xorWord port map (i1 => tmp ( 1), i2 => tmp ( 6), o => tmp ( 7));
	xorWord02: entity work.xorWord port map (i1 => tmp ( 2), i2 => tmp ( 7), o => tmp ( 8));
	xorWord03: entity work.xorWord port map (i1 => tmp ( 3), i2 => tmp ( 8), o => tmp ( 9));	
	xorWord04: entity work.xorWord port map (i1 => tmp ( 4), i2 => tmp ( 9), o => tmp (10));
	xorWord05: entity work.xorWord port map (i1 => tmp ( 5), i2 => tmp (10), o => tmp (11));
	
	xorWord06: entity work.xorWord port map (i1 => tmp ( 7), i2 => tmp (12), o => tmp (13));
	xorWord07: entity work.xorWord port map (i1 => tmp ( 8), i2 => tmp (13), o => tmp (14));
	xorWord08: entity work.xorWord port map (i1 => tmp ( 9), i2 => tmp (14), o => tmp (15));	
	xorWord09: entity work.xorWord port map (i1 => tmp (10), i2 => tmp (15), o => tmp (16));
	xorWord10: entity work.xorWord port map (i1 => tmp (11), i2 => tmp (16), o => tmp (17));
	
	xorWord11: entity work.xorWord port map (i1 => tmp (13), i2 => tmp (18), o => tmp (19));
	xorWord12: entity work.xorWord port map (i1 => tmp (14), i2 => tmp (19), o => tmp (20));
	xorWord13: entity work.xorWord port map (i1 => tmp (15), i2 => tmp (20), o => tmp (21));	
	xorWord14: entity work.xorWord port map (i1 => tmp (16), i2 => tmp (21), o => tmp (22));
	xorWord15: entity work.xorWord port map (i1 => tmp (17), i2 => tmp (22), o => tmp (23));

	xorWord16: entity work.xorWord port map (i1 => tmp (19), i2 => tmp (24), o => tmp (25));
	xorWord17: entity work.xorWord port map (i1 => tmp (20), i2 => tmp (25), o => tmp (26));
	xorWord18: entity work.xorWord port map (i1 => tmp (21), i2 => tmp (26), o => tmp (27));	
	xorWord19: entity work.xorWord port map (i1 => tmp (22), i2 => tmp (27), o => tmp (28));
	xorWord20: entity work.xorWord port map (i1 => tmp (23), i2 => tmp (28), o => tmp (29));

	xorWord21: entity work.xorWord port map (i1 => tmp (25), i2 => tmp (30), o => tmp (31));
	xorWord22: entity work.xorWord port map (i1 => tmp (26), i2 => tmp (31), o => tmp (32));
	xorWord23: entity work.xorWord port map (i1 => tmp (27), i2 => tmp (32), o => tmp (33));	
	xorWord24: entity work.xorWord port map (i1 => tmp (28), i2 => tmp (33), o => tmp (34));
	xorWord25: entity work.xorWord port map (i1 => tmp (29), i2 => tmp (34), o => tmp (35));	
	
	xorWord26: entity work.xorWord port map (i1 => tmp (31), i2 => tmp (36), o => tmp (37));
	xorWord27: entity work.xorWord port map (i1 => tmp (32), i2 => tmp (37), o => tmp (38));
	xorWord28: entity work.xorWord port map (i1 => tmp (33), i2 => tmp (38), o => tmp (39));	
	xorWord29: entity work.xorWord port map (i1 => tmp (34), i2 => tmp (39), o => tmp (40));
	xorWord30: entity work.xorWord port map (i1 => tmp (35), i2 => tmp (40), o => tmp (41));	
	
	xorWord31: entity work.xorWord port map (i1 => tmp (37), i2 => tmp (42), o => tmp (43));
	xorWord32: entity work.xorWord port map (i1 => tmp (38), i2 => tmp (43), o => tmp (44));
	xorWord33: entity work.xorWord port map (i1 => tmp (39), i2 => tmp (44), o => tmp (45));	
	xorWord34: entity work.xorWord port map (i1 => tmp (40), i2 => tmp (45), o => tmp (46));
	xorWord35: entity work.xorWord port map (i1 => tmp (41), i2 => tmp (46), o => tmp (47));	
	
	xorWord36: entity work.xorWord port map (i1 => tmp (43), i2 => tmp (48), o => tmp (49));
	xorWord37: entity work.xorWord port map (i1 => tmp (44), i2 => tmp (49), o => tmp (50));
	xorWord38: entity work.xorWord port map (i1 => tmp (45), i2 => tmp (50), o => tmp (51));	
	
	subRotRcon1 : entity work.subRotRcon port map (i1 => tmp ( 0), i2 => tmp ( 5), r => RCON ( 1), o => tmp ( 6));
	subRotRcon2 : entity work.subRotRcon port map (i1 => tmp ( 6), i2 => tmp (11), r => RCON ( 2), o => tmp (12));
	subRotRcon3 : entity work.subRotRcon port map (i1 => tmp (12), i2 => tmp (17), r => RCON ( 3), o => tmp (18));
	subRotRcon4 : entity work.subRotRcon port map (i1 => tmp (18), i2 => tmp (23), r => RCON ( 4), o => tmp (24));
	subRotRcon5 : entity work.subRotRcon port map (i1 => tmp (24), i2 => tmp (29), r => RCON ( 5), o => tmp (30));
	subRotRcon6 : entity work.subRotRcon port map (i1 => tmp (30), i2 => tmp (35), r => RCON ( 6), o => tmp (36));
	subRotRcon7 : entity work.subRotRcon port map (i1 => tmp (36), i2 => tmp (41), r => RCON ( 7), o => tmp (42));
	subRotRcon8 : entity work.subRotRcon port map (i1 => tmp (42), i2 => tmp (47), r => RCON ( 8), o => tmp (48));
	
	AES_ENC:
	if mode = ENCRYPTION generate	
		
		loopOutput:
		for j in 0 to 12 generate
			o (j) <= (tmp (j * 4), tmp (j * 4 + 1), tmp (j * 4 + 2), tmp (j * 4 + 3));
			
		end generate;
		
	end generate;
	
	AES_DEC:
	if mode = DECRYPTION generate
		
		loopOutput:
		for j in 0 to 12 generate
			o (12 - j) <= (tmp (j * 4), tmp (j * 4 + 1), tmp (j * 4 + 2), tmp (j * 4 + 3));

		end generate;
		
	end generate;

end Behavioral;

