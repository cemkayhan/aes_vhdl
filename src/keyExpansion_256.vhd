library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.all;

entity keyExpansion_256 is
	generic (mode : AES_MODE := DECRYPTION);
	
	port (k : in  WORD_ARRAY  (0 to  7);
			o : out STATE_ARRAY (0 to 14)
			);
			
end keyExpansion_256;

architecture Behavioral of keyExpansion_256 is
	signal tmp : WORD_ARRAY (0 to 59);
	
begin
	tmp (0 to 7) <= k;
	

	xorWord01: entity work.xorWord port map (i1 => tmp ( 1), i2 => tmp ( 8), o => tmp ( 9));
	xorWord02: entity work.xorWord port map (i1 => tmp ( 2), i2 => tmp ( 9), o => tmp (10));
	xorWord03: entity work.xorWord port map (i1 => tmp ( 3), i2 => tmp (10), o => tmp (11));
	
	xorWord04: entity work.xorWord port map (i1 => tmp ( 5), i2 => tmp (12), o => tmp (13));
	xorWord05: entity work.xorWord port map (i1 => tmp ( 6), i2 => tmp (13), o => tmp (14));
	xorWord06: entity work.xorWord port map (i1 => tmp ( 7), i2 => tmp (14), o => tmp (15));
	
	xorWord07: entity work.xorWord port map (i1 => tmp ( 9), i2 => tmp (16), o => tmp (17));
	xorWord08: entity work.xorWord port map (i1 => tmp (10), i2 => tmp (17), o => tmp (18));
	xorWord09: entity work.xorWord port map (i1 => tmp (11), i2 => tmp (18), o => tmp (19));	
	
	xorWord10: entity work.xorWord port map (i1 => tmp (13), i2 => tmp (20), o => tmp (21));
	xorWord11: entity work.xorWord port map (i1 => tmp (14), i2 => tmp (21), o => tmp (22));
	xorWord12: entity work.xorWord port map (i1 => tmp (15), i2 => tmp (22), o => tmp (23));	
	
	xorWord13: entity work.xorWord port map (i1 => tmp (17), i2 => tmp (24), o => tmp (25));
	xorWord14: entity work.xorWord port map (i1 => tmp (18), i2 => tmp (25), o => tmp (26));
	xorWord15: entity work.xorWord port map (i1 => tmp (19), i2 => tmp (26), o => tmp (27));	
	
	xorWord16: entity work.xorWord port map (i1 => tmp (21), i2 => tmp (28), o => tmp (29));
	xorWord17: entity work.xorWord port map (i1 => tmp (22), i2 => tmp (29), o => tmp (30));
	xorWord18: entity work.xorWord port map (i1 => tmp (23), i2 => tmp (30), o => tmp (31));	
	
	xorWord19: entity work.xorWord port map (i1 => tmp (25), i2 => tmp (32), o => tmp (33));
	xorWord20: entity work.xorWord port map (i1 => tmp (26), i2 => tmp (33), o => tmp (34));
	xorWord21: entity work.xorWord port map (i1 => tmp (27), i2 => tmp (34), o => tmp (35));	
	
	xorWord22: entity work.xorWord port map (i1 => tmp (29), i2 => tmp (36), o => tmp (37));
	xorWord23: entity work.xorWord port map (i1 => tmp (30), i2 => tmp (37), o => tmp (38));
	xorWord24: entity work.xorWord port map (i1 => tmp (31), i2 => tmp (38), o => tmp (39));	
	
	xorWord25: entity work.xorWord port map (i1 => tmp (33), i2 => tmp (40), o => tmp (41));
	xorWord26: entity work.xorWord port map (i1 => tmp (34), i2 => tmp (41), o => tmp (42));
	xorWord27: entity work.xorWord port map (i1 => tmp (35), i2 => tmp (42), o => tmp (43));	
	
	xorWord28: entity work.xorWord port map (i1 => tmp (37), i2 => tmp (44), o => tmp (45));
	xorWord29: entity work.xorWord port map (i1 => tmp (38), i2 => tmp (45), o => tmp (46));
	xorWord30: entity work.xorWord port map (i1 => tmp (39), i2 => tmp (46), o => tmp (47));	
	
	xorWord31: entity work.xorWord port map (i1 => tmp (41), i2 => tmp (48), o => tmp (49));
	xorWord32: entity work.xorWord port map (i1 => tmp (42), i2 => tmp (49), o => tmp (50));
	xorWord33: entity work.xorWord port map (i1 => tmp (43), i2 => tmp (50), o => tmp (51));	
	
	xorWord34: entity work.xorWord port map (i1 => tmp (45), i2 => tmp (52), o => tmp (53));
	xorWord35: entity work.xorWord port map (i1 => tmp (46), i2 => tmp (53), o => tmp (54));
	xorWord36: entity work.xorWord port map (i1 => tmp (47), i2 => tmp (54), o => tmp (55));	
	
	xorWord37: entity work.xorWord port map (i1 => tmp (49), i2 => tmp (56), o => tmp (57));
	xorWord38: entity work.xorWord port map (i1 => tmp (50), i2 => tmp (57), o => tmp (58));
	xorWord39: entity work.xorWord port map (i1 => tmp (51), i2 => tmp (58), o => tmp (59));
	
	subRotRcon1 : entity work.subRotRcon port map (i1 => tmp ( 0), i2 => tmp ( 7), r => RCON ( 1), o => tmp ( 8));
	subRotRcon2 : entity work.subRotRcon port map (i1 => tmp ( 8), i2 => tmp (15), r => RCON ( 2), o => tmp (16));
	subRotRcon3 : entity work.subRotRcon port map (i1 => tmp (16), i2 => tmp (23), r => RCON ( 3), o => tmp (24));
	subRotRcon4 : entity work.subRotRcon port map (i1 => tmp (24), i2 => tmp (31), r => RCON ( 4), o => tmp (32));
	subRotRcon5 : entity work.subRotRcon port map (i1 => tmp (32), i2 => tmp (39), r => RCON ( 5), o => tmp (40));
	subRotRcon6 : entity work.subRotRcon port map (i1 => tmp (40), i2 => tmp (47), r => RCON ( 6), o => tmp (48));
	subRotRcon7 : entity work.subRotRcon port map (i1 => tmp (48), i2 => tmp (55), r => RCON ( 7), o => tmp (56));	
	
	subWord1: entity work.subWord port map (i1 => tmp ( 4), i2 => tmp (11), o => tmp (12));
	subWord2: entity work.subWord port map (i1 => tmp (12), i2 => tmp (19), o => tmp (20));
	subWord3: entity work.subWord port map (i1 => tmp (20), i2 => tmp (27), o => tmp (28));
	subWord4: entity work.subWord port map (i1 => tmp (28), i2 => tmp (35), o => tmp (36));
	subWord5: entity work.subWord port map (i1 => tmp (36), i2 => tmp (43), o => tmp (44));
	subWord6: entity work.subWord port map (i1 => tmp (44), i2 => tmp (51), o => tmp (52));
	
	AES_ENC:
	if mode = ENCRYPTION generate	
		
		loopOutput:
		for j in 0 to 14 generate
			o (j) <= (tmp (j * 4), tmp (j * 4 + 1), tmp (j * 4 + 2), tmp (j * 4 + 3));
			
		end generate;
		
	end generate;
	
	AES_DEC:
	if mode = DECRYPTION generate
		
		loopOutput:
		for j in 0 to 14 generate
			o (14 - j) <= (tmp (j * 4), tmp (j * 4 + 1), tmp (j * 4 + 2), tmp (j * 4 + 3));

		end generate;
		
	end generate;		

end Behavioral;

