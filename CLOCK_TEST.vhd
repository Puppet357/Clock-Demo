--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:18:50 10/23/2023
-- Design Name:   
-- Module Name:   E:/Xilinx ISE Projects/CLOCK/CLOCK_TEST.vhd
-- Project Name:  CLOCK
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CLOCK
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CLOCK_TEST IS
END CLOCK_TEST;
 
ARCHITECTURE behavior OF CLOCK_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CLOCK
    PORT(
         CLK0 : IN  std_logic;
         RST0 : IN  std_logic;
         EN0 : IN  std_logic;
         DOUT0 : OUT  std_logic_vector(0 to 6);
         SG0 : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK0 : std_logic := '0';
   signal RST0 : std_logic := '0';
   signal EN0 : std_logic := '0';

 	--Outputs
   signal DOUT0 : std_logic_vector(0 to 6);
   signal SG0 : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 	constant EN_period : time := 1500 ns;
	constant RST_period : time := 200000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CLOCK PORT MAP (
          CLK0 => CLK0,
          RST0 => RST0,
          EN0 => EN0,
          DOUT0 => DOUT0,
          SG0 => SG0
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK0 <= '0';
		wait for CLK_period/2;
		CLK0 <= '1';
		wait for CLK_period/2;
   end process;
	
	EN_process :process
   begin
		EN0 <= '0';
		wait for EN_period/2;
		EN0 <= '1';
		wait for EN_period/2;
   end process;
 
	RST_process :process
   begin
		RST0 <= '0';
		wait for RST_period/2;
		RST0 <= '1';
		wait for RST_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
