--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:56:53 10/21/2023
-- Design Name:   
-- Module Name:   E:/Xilinx ISE Projects/CLOCK/COUNT60_TEST.vhd
-- Project Name:  CLOCK
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: COUNT60
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
 
ENTITY COUNT60_TEST IS
END COUNT60_TEST;
 
ARCHITECTURE behavior OF COUNT60_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT COUNT60
    PORT(
         CLK : IN  std_logic;
         CLK_C : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         DOUTL : OUT  std_logic_vector(3 downto 0);
         DOUTH : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal CLK_C : std_logic := '0';
   signal RST : std_logic := '0';
   signal EN : std_logic := '0';

 	--Outputs
   signal DOUTL : std_logic_vector(3 downto 0);
   signal DOUTH : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
   constant CLK_C_period : time := 500 ns;
	constant EN_period : time := 1500 ns;
	constant RST_period : time := 200000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: COUNT60 PORT MAP (
          CLK => CLK,
          CLK_C => CLK_C,
          RST => RST,
          EN => EN,
          DOUTL => DOUTL,
          DOUTH => DOUTH
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   CLK_C_process :process
   begin
		CLK_C <= '0';
		wait for CLK_C_period/2;
		CLK_C <= '1';
		wait for CLK_C_period/2;
   end process;
	
	EN_process :process
   begin
		EN <= '0';
		wait for EN_period/2;
		EN <= '1';
		wait for EN_period/2;
   end process;
 
	RST_process :process
   begin
		RST <= '0';
		wait for RST_period/2;
		RST <= '1';
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
