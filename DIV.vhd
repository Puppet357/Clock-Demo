----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:08 10/18/2023 
-- Design Name: 
-- Module Name:    DIV - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_ARITH.all;
use ieee.NUMERIC_STD.all;

entity div is
port
(
clk_in:in std_logic;
clk_out:out std_logic;
clk_in2:in std_logic;
clk_out200:out std_logic;
scan:out std_logic
);
end div;

architecture behave of div is
signal clk_cnt: std_logic_vector(27 downto 0):="0000000000000000000000000000";
signal clk_cnt2: std_logic_vector(15 downto 0):="0000000000000000";
constant div_num: integer:=50;
constant div_num2: integer:=25;
signal clk_out1:std_logic:='0';
signal clk_out2:std_logic:='0';
signal scan1:std_logic:='0';

begin

process(clk_in)
begin
  if clk_in 'event and clk_in='1' then
     clk_cnt<=clk_cnt+'1';
	 if clk_cnt="0010111110101111000010000000" then 
	   clk_out1<=not clk_out1;
		  clk_cnt<=(others=>'0');
	end if;
end if;
end process;
clk_out<=clk_out1;

process(clk_in2)
begin
  if clk_in2 'event and clk_in2='1' then
     clk_cnt2<=clk_cnt2+'1';
	 if clk_cnt2="0110000110101000" then 
	   clk_out2<=not clk_out2;
		  clk_cnt2<=(others=>'0');
	end if;
end if;
end process;
clk_out200<=clk_out2;

process(clk_out2)
begin
  if clk_out2 'event and clk_out2='1' then
     scan1<=not scan1;
  end if;
end process;
scan<=scan1;

end behave;


