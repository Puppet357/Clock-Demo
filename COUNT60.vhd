----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:37 10/18/2023 
-- Design Name: 
-- Module Name:    COUNT60 - Behavioral 
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity COUNT60 is
PORT (CLK,CLK_C,RST,EN:IN STD_LOGIC:='0';  
      DOUTL,DOUTH : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end COUNT60;

architecture Behavioral of COUNT60 is

signal cnt_Ten,cnt_One:integer range 0 to 9 :=0;--数码管计数的十位和个位
signal Q:STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
signal QQ:STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
signal QL,QH:STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";

SIGNAL ST: integer range 0 to 9 :=0;   --定义敏感信号并赋初值s0

begin

CNT : process(clk_C,RST,EN) 
	begin
IF RST='0' THEN 
	             cnt_Ten<=0;
					 cnt_One<=0;
   ELSIF EN='1' THEN 
		if(clk_C'event and clk_C='1')then						
			 if(cnt_One=9)then
					   if(cnt_Ten=5)then
									   cnt_Ten<=0;
									   cnt_One<=0;
						else
							cnt_Ten<=cnt_Ten+1;
							cnt_One<=0;
						end if;
			else
					cnt_One<=cnt_One+1;
			end if;	
		end if;
	END IF;
end process CNT;

COML: process(cnt_One,QL)
	begin
		case cnt_One is
			when 0 => QL <="0000";--数字0
			when 1 => QL <="0001";--数字1
			when 2 => QL <="0010";--数字2
			when 3 => QL <="0011";--数字3
			when 4 => QL <="0100";--数字4
			when 5 => QL <="0101";--数字5
			when 6 => QL <="0110";--数字6
			when 7 => QL <="0111";--数字7
			when 8 => QL <="1000";--数字8
			when 9 => QL <="1001";--数字9
			when others => QL <="0000";
		end case;
DOUTL<=QL;
end process COML;
	
COMH: process(cnt_Ten,QH)
	begin
		case cnt_Ten is
			when 0 => QH <="0000";--数字0
			when 1 => QH <="0001";--数字1
			when 2 => QH <="0010";--数字2
			when 3 => QH <="0011";--数字3
			when 4 => QH <="0100";--数字4
			when 5 => QH <="0101";--数字5
			when others => QH <="0000";
		end case;
end process COMH;
DOUTH<=QH;
end Behavioral;

