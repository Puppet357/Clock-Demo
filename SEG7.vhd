----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:48:21 10/18/2023 
-- Design Name: 
-- Module Name:    SEG7 - Behavioral 
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

entity SEG7 is
  PORT (INDATA_L: IN STD_LOGIC_VECTOR(3 DOWNTO 0); --输入，4位数，表示0-9
		  INDATA_H: IN STD_LOGIC_VECTOR(3 DOWNTO 0); --输入，4位数，表示0-9
		  ODATA: OUT STD_LOGIC_VECTOR(0 TO 6);
		  SGI: IN STD_LOGIC; 
        SGO: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));--输出，八位，对应数码管上八段		  
end SEG7;
 
ARCHITECTURE SEG7 OF SEG7 IS

SIGNAL ODATA_L:  STD_LOGIC_VECTOR(0 TO 6);
SIGNAL ODATA_H:  STD_LOGIC_VECTOR(0 TO 6);

	BEGIN
	
	PROCESS (INDATA_L)
	BEGIN
		CASE (INDATA_L) IS
			WHEN "0000" => ODATA_L<= "1000000" ; --数字0的低电平点亮(公共端共阳极)二进制表示方法	（最低位小数点省略）
			WHEN "0001" => ODATA_L<= "1111001" ; --1
			WHEN "0010" => ODATA_L<= "0100100" ; --2
			WHEN "0011" => ODATA_L<= "0110000" ; --3
			WHEN "0100" => ODATA_L<= "0011001" ; --4
			WHEN "0101" => ODATA_L<= "0010010" ; --5
			WHEN "0110" => ODATA_L<= "0000010" ; --6
			WHEN "0111" => ODATA_L<= "1111000" ; --7
			WHEN "1000" => ODATA_L<= "0000000" ; --8
			WHEN "1001" => ODATA_L<= "0010000" ; --9
			WHEN OTHERS => NULL;  --其他情况，输出为空
		END CASE; --结束case
	END PROCESS;

	PROCESS (INDATA_H)
	BEGIN
		CASE (INDATA_H) IS
			WHEN "0000" => ODATA_H<= "1000000" ; --数字0的低电平点亮(公共端共阳极)二进制表示方法	（最低位小数点省略）
			WHEN "0001" => ODATA_H<= "1111001" ; --1
			WHEN "0010" => ODATA_H<= "0100100" ; --2
			WHEN "0011" => ODATA_H<= "0110000" ; --3
			WHEN "0100" => ODATA_H<= "0011001" ; --4
			WHEN "0101" => ODATA_H<= "0010010" ; --5
			WHEN "0110" => ODATA_H<= "0000010" ; --6
			WHEN "0111" => ODATA_H<= "1111000" ; --7
			WHEN "1000" => ODATA_H<= "0000000" ; --8
			WHEN "1001" => ODATA_H<= "0010000" ; --9
			WHEN OTHERS => NULL;  --其他情况，输出为空
		END CASE; --结束case
	END PROCESS;

	PROCESS (SGI)
	BEGIN
		CASE (SGI) IS
			WHEN '0' => SGO<= "1110" ; ODATA<=ODATA_L;
			WHEN '1' => SGO<= "1101" ; ODATA<=ODATA_H;
			WHEN OTHERS => NULL;  --其他情况，输出为空
		END CASE; --结束case
	END PROCESS;
	
END ARCHITECTURE SEG7;

