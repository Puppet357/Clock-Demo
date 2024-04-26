----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:10 10/21/2023 
-- Design Name: 
-- Module Name:    CLOCK - Behavioral 
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

entity CLOCK is 
PORT(CLK0,RST0,EN0:IN STD_LOGIC:='0'; 
     DOUT0:OUT STD_LOGIC_VECTOR(0 TO 6);
	  SG0: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end CLOCK;

architecture CLOCK of CLOCK is

COMPONENT COUNT60   --60���Ƽ�����
PORT (CLK,CLK_C,RST,EN:IN STD_LOGIC:='0';  
      DOUTL,DOUTH : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT COUNT60;

COMPONENT SEG7   --�����
  PORT (INDATA_L: IN STD_LOGIC_VECTOR(3 DOWNTO 0); --���룬4λ������ʾ0-9
		  INDATA_H: IN STD_LOGIC_VECTOR(3 DOWNTO 0); --���룬4λ������ʾ0-9
		  ODATA: OUT STD_LOGIC_VECTOR(0 TO 6);
		  SGI: IN STD_LOGIC; 
        SGO: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));--�������λ����Ӧ������ϰ˶�
END COMPONENT SEG7;

COMPONENT div   --60���Ƽ�����
port
(
clk_in:in std_logic;
clk_out:out std_logic;
clk_in2:in std_logic;
clk_out200:out std_logic;
scan:out std_logic
);
END COMPONENT div;

SIGNAL IKUN0:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL IKUN1:STD_LOGIC_VECTOR(3 DOWNTO 0); --IKUN? �����ź�
SIGNAL KUNKUN:STD_LOGIC;

SIGNAL CLK_1Hz:STD_LOGIC;
SIGNAL CLK_200KHz:STD_LOGIC;

BEGIN

U1:COUNT60 PORT MAP(CLK=>CLK0,CLK_C=>CLK_1Hz,RST=>RST0,EN=>EN0,DOUTL=>IKUN0,DOUTH=>IKUN1);

U2:SEG7 PORT MAP(INDATA_L=>IKUN0,INDATA_H=>IKUN1,ODATA=>DOUT0,SGI=>KUNKUN,SGO=>SG0);

U3:div PORT MAP(CLK_IN=>CLK0,CLK_OUT=>CLK_1Hz,CLK_IN2=>CLK0,CLK_OUT200=>CLK_200KHz,SCAN=>KUNKUN);

END ARCHITECTURE CLOCK;
