--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:25:40 10/21/2023
-- Design Name:   
-- Module Name:   E:/Xilinx ISE Projects/CLOCK/SEG7_TEST.vhd
-- Project Name:  CLOCK
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SEG7
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
 
ENTITY SEG7_TEST IS
END SEG7_TEST;
 
ARCHITECTURE behavior OF SEG7_TEST IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEG7
    PORT(
         INDATA_L : IN  std_logic_vector(3 downto 0);
         ODATA_L : OUT  std_logic_vector(0 to 6);
         INDATA_H : IN  std_logic_vector(3 downto 0);
         ODATA_H : OUT  std_logic_vector(0 to 6);
         SGI : IN  std_logic;
         SGO : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal INDATA_L : std_logic_vector(3 downto 0) := (others => '0');
   signal INDATA_H : std_logic_vector(3 downto 0) := (others => '0');
   signal SGI : std_logic := '0';

 	--Outputs
   signal ODATA_L : std_logic_vector(0 to 6);
   signal ODATA_H : std_logic_vector(0 to 6);
   signal SGO : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEG7 PORT MAP (
          INDATA_L => INDATA_L,
          ODATA_L => ODATA_L,
          INDATA_H => INDATA_H,
          ODATA_H => ODATA_H,
          SGI => SGI,
          SGO => SGO
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clock_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
