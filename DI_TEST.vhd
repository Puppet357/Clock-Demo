--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:02:34 10/21/2023
-- Design Name:   
-- Module Name:   E:/Xilinx ISE Projects/CLOCK/DI_TEST.vhd
-- Project Name:  CLOCK
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: div
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
 
ENTITY DI_TEST IS
END DI_TEST;
 
ARCHITECTURE behavior OF DI_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT div
    PORT(
         clk_in : IN  std_logic;
         clk_out : OUT  std_logic;
         clk_in2 : IN  std_logic;
         clk_out200 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal clk_in2 : std_logic := '0';

 	--Outputs
   signal clk_out : std_logic;
   signal clk_out200 : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
--   constant clk_out_period : time := 10 ns;
   constant clk_in2_period : time := 10 ns;
--   constant clk_out200_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: div PORT MAP (
          clk_in => clk_in,
          clk_out => clk_out,
          clk_in2 => clk_in2,
          clk_out200 => clk_out200
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 
--   clk_out_process :process
--   begin
--		clk_out <= '0';
--		wait for clk_out_period/2;
--		clk_out <= '1';
--		wait for clk_out_period/2;
--   end process;
 
   clk_in2_process :process
   begin
		clk_in2 <= '0';
		wait for clk_in2_period/2;
		clk_in2 <= '1';
		wait for clk_in2_period/2;
   end process;
 
--   clk_out200_process :process
--   begin
--		clk_out200 <= '0';
--		wait for clk_out200_period/2;
--		clk_out200 <= '1';
--		wait for clk_out200_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_in_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
