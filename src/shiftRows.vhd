library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.aes_lib.STATE;

entity shiftRows is
	port (i : in STATE;
			o : out STATE
			);
			
end shiftRows;

architecture Behavioral of shiftRows is

begin
	o <= ((i (0)(0), i (1)(1), i (2)(2), i (3)(3)),
			(i (1)(0), i (2)(1), i (3)(2), i (0)(3)),
			(i (2)(0), i (3)(1), i (0)(2), i (1)(3)),
			(i (3)(0), i (0)(1), i (1)(2), i (2)(3)));
	
end Behavioral;

