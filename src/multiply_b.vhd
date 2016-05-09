library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.BYTE;

entity multiply_b is
	port (i : in BYTE;
			o : out BYTE
			);
			
end multiply_b;

architecture Behavioral of multiply_b is

begin
	with i select o <=
		x"00" when x"00",
		x"0B" when x"01",
		x"16" when x"02",
		x"1D" when x"03",
		x"2C" when x"04",
		x"27" when x"05",
		x"3A" when x"06",
		x"31" when x"07",
		x"58" when x"08",
		x"53" when x"09",
		x"4E" when x"0A",
		x"45" when x"0B",
		x"74" when x"0C",
		x"7F" when x"0D",
		x"62" when x"0E",
		x"69" when x"0F",
		x"B0" when x"10",
		x"BB" when x"11",
		x"A6" when x"12",
		x"AD" when x"13",
		x"9C" when x"14",
		x"97" when x"15",
		x"8A" when x"16",
		x"81" when x"17",
		x"E8" when x"18",
		x"E3" when x"19",
		x"FE" when x"1A",
		x"F5" when x"1B",
		x"C4" when x"1C",
		x"CF" when x"1D",
		x"D2" when x"1E",
		x"D9" when x"1F",
		x"7B" when x"20",
		x"70" when x"21",
		x"6D" when x"22",
		x"66" when x"23",
		x"57" when x"24",
		x"5C" when x"25",
		x"41" when x"26",
		x"4A" when x"27",
		x"23" when x"28",
		x"28" when x"29",
		x"35" when x"2A",
		x"3E" when x"2B",
		x"0F" when x"2C",
		x"04" when x"2D",
		x"19" when x"2E",
		x"12" when x"2F",
		x"CB" when x"30",
		x"C0" when x"31",
		x"DD" when x"32",
		x"D6" when x"33",
		x"E7" when x"34",
		x"EC" when x"35",
		x"F1" when x"36",
		x"FA" when x"37",
		x"93" when x"38",
		x"98" when x"39",
		x"85" when x"3A",
		x"8E" when x"3B",
		x"BF" when x"3C",
		x"B4" when x"3D",
		x"A9" when x"3E",
		x"A2" when x"3F",
		x"F6" when x"40",
		x"FD" when x"41",
		x"E0" when x"42",
		x"EB" when x"43",
		x"DA" when x"44",
		x"D1" when x"45",
		x"CC" when x"46",
		x"C7" when x"47",
		x"AE" when x"48",
		x"A5" when x"49",
		x"B8" when x"4A",
		x"B3" when x"4B",
		x"82" when x"4C",
		x"89" when x"4D",
		x"94" when x"4E",
		x"9F" when x"4F",
		x"46" when x"50",
		x"4D" when x"51",
		x"50" when x"52",
		x"5B" when x"53",
		x"6A" when x"54",
		x"61" when x"55",
		x"7C" when x"56",
		x"77" when x"57",
		x"1E" when x"58",
		x"15" when x"59",
		x"08" when x"5A",
		x"03" when x"5B",
		x"32" when x"5C",
		x"39" when x"5D",
		x"24" when x"5E",
		x"2F" when x"5F",
		x"8D" when x"60",
		x"86" when x"61",
		x"9B" when x"62",
		x"90" when x"63",
		x"A1" when x"64",
		x"AA" when x"65",
		x"B7" when x"66",
		x"BC" when x"67",
		x"D5" when x"68",
		x"DE" when x"69",
		x"C3" when x"6A",
		x"C8" when x"6B",
		x"F9" when x"6C",
		x"F2" when x"6D",
		x"EF" when x"6E",
		x"E4" when x"6F",
		x"3D" when x"70",
		x"36" when x"71",
		x"2B" when x"72",
		x"20" when x"73",
		x"11" when x"74",
		x"1A" when x"75",
		x"07" when x"76",
		x"0C" when x"77",
		x"65" when x"78",
		x"6E" when x"79",
		x"73" when x"7A",
		x"78" when x"7B",
		x"49" when x"7C",
		x"42" when x"7D",
		x"5F" when x"7E",
		x"54" when x"7F",
		x"F7" when x"80",
		x"FC" when x"81",
		x"E1" when x"82",
		x"EA" when x"83",
		x"DB" when x"84",
		x"D0" when x"85",
		x"CD" when x"86",
		x"C6" when x"87",
		x"AF" when x"88",
		x"A4" when x"89",
		x"B9" when x"8A",
		x"B2" when x"8B",
		x"83" when x"8C",
		x"88" when x"8D",
		x"95" when x"8E",
		x"9E" when x"8F",
		x"47" when x"90",
		x"4C" when x"91",
		x"51" when x"92",
		x"5A" when x"93",
		x"6B" when x"94",
		x"60" when x"95",
		x"7D" when x"96",
		x"76" when x"97",
		x"1F" when x"98",
		x"14" when x"99",
		x"09" when x"9A",
		x"02" when x"9B",
		x"33" when x"9C",
		x"38" when x"9D",
		x"25" when x"9E",
		x"2E" when x"9F",
		x"8C" when x"A0",
		x"87" when x"A1",
		x"9A" when x"A2",
		x"91" when x"A3",
		x"A0" when x"A4",
		x"AB" when x"A5",
		x"B6" when x"A6",
		x"BD" when x"A7",
		x"D4" when x"A8",
		x"DF" when x"A9",
		x"C2" when x"AA",
		x"C9" when x"AB",
		x"F8" when x"AC",
		x"F3" when x"AD",
		x"EE" when x"AE",
		x"E5" when x"AF",
		x"3C" when x"B0",
		x"37" when x"B1",
		x"2A" when x"B2",
		x"21" when x"B3",
		x"10" when x"B4",
		x"1B" when x"B5",
		x"06" when x"B6",
		x"0D" when x"B7",
		x"64" when x"B8",
		x"6F" when x"B9",
		x"72" when x"BA",
		x"79" when x"BB",
		x"48" when x"BC",
		x"43" when x"BD",
		x"5E" when x"BE",
		x"55" when x"BF",
		x"01" when x"C0",
		x"0A" when x"C1",
		x"17" when x"C2",
		x"1C" when x"C3",
		x"2D" when x"C4",
		x"26" when x"C5",
		x"3B" when x"C6",
		x"30" when x"C7",
		x"59" when x"C8",
		x"52" when x"C9",
		x"4F" when x"CA",
		x"44" when x"CB",
		x"75" when x"CC",
		x"7E" when x"CD",
		x"63" when x"CE",
		x"68" when x"CF",
		x"B1" when x"D0",
		x"BA" when x"D1",
		x"A7" when x"D2",
		x"AC" when x"D3",
		x"9D" when x"D4",
		x"96" when x"D5",
		x"8B" when x"D6",
		x"80" when x"D7",
		x"E9" when x"D8",
		x"E2" when x"D9",
		x"FF" when x"DA",
		x"F4" when x"DB",
		x"C5" when x"DC",
		x"CE" when x"DD",
		x"D3" when x"DE",
		x"D8" when x"DF",
		x"7A" when x"E0",
		x"71" when x"E1",
		x"6C" when x"E2",
		x"67" when x"E3",
		x"56" when x"E4",
		x"5D" when x"E5",
		x"40" when x"E6",
		x"4B" when x"E7",
		x"22" when x"E8",
		x"29" when x"E9",
		x"34" when x"EA",
		x"3F" when x"EB",
		x"0E" when x"EC",
		x"05" when x"ED",
		x"18" when x"EE",
		x"13" when x"EF",
		x"CA" when x"F0",
		x"C1" when x"F1",
		x"DC" when x"F2",
		x"D7" when x"F3",
		x"E6" when x"F4",
		x"ED" when x"F5",
		x"F0" when x"F6",
		x"FB" when x"F7",
		x"92" when x"F8",
		x"99" when x"F9",
		x"84" when x"FA",
		x"8F" when x"FB",
		x"BE" when x"FC",
		x"B5" when x"FD",
		x"A8" when x"FE",
		x"A3" when x"FF",
		x"00" when others;

end Behavioral;

