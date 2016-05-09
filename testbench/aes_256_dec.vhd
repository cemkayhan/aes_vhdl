LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use work.aes_lib.all;
 
ENTITY aes_256_dec IS
END aes_256_dec;
 
ARCHITECTURE behavior OF aes_256_dec IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aes
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         i : IN  STATE;
         k : IN  WORD_ARRAY(0 to 7);
         o : OUT STATE
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal i : STATE;
   signal k : WORD_ARRAY (0 to 7);

 	--Outputs
   signal o : STATE;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aes PORT MAP (
          clk => clk,
          reset => reset,
          i => i,
          k => k,
          o => o
        );

  reset <= '1', '0' after 2 ns;
  clk <= '0', '1' after 5 ns,
			'0' after 10 ns, '1' after 15 ns,
			'0' after 20 ns, '1' after 25 ns,
			'0' after 30 ns, '1' after 35 ns,
			'0' after 40 ns, '1' after 45 ns,
			'0' after 50 ns, '1' after 55 ns,
			'0' after 60 ns, '1' after 65 ns,
			'0' after 70 ns, '1' after 75 ns,
			'0' after 80 ns, '1' after 85 ns,
			'0' after 90 ns, '1' after 95 ns,
			'0' after 100 ns, '1' after 105 ns,
			'0' after 110 ns, '1' after 115 ns,
			'0' after 120 ns, '1' after 125 ns,
			'0' after 130 ns, '1' after 135 ns,
			'0' after 140 ns, '1' after 150 ns;
			
  i <= ((x"8e", x"a2", x"b7", x"ca"), 
		  (x"51", x"67", x"45", x"bf"), 
		  (x"ea", x"fc", x"49", x"90"), 
		  (x"4b", x"49", x"60", x"89"));
  
  k <= ((x"00", x"01", x"02", x"03"), 
		  (x"04", x"05", x"06", x"07"), 
		  (x"08", x"09", x"0a", x"0b"), 
		  (x"0c", x"0d", x"0e", x"0f"), 
		  (x"10", x"11", x"12", x"13"), 
		  (x"14", x"15", x"16", x"17"), 
		  (x"18", x"19", x"1a", x"1b"), 
		  (x"1c", x"1d", x"1e", x"1f"));	

END;
