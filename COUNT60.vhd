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

signal cnt_Ten,cnt_One:integer range 0 to 9 :=0;--����ܼ�����ʮλ�͸�λ
signal Q:STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
signal QQ:STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
signal QL,QH:STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";

SIGNAL ST: integer range 0 to 9 :=0;   --���������źŲ�����ֵs0

begin

--COM:PROCESS(Q)
--BEGIN
--	CASE Q IS
--	WHEN "00" =>   QQ<="00";
--	WHEN "01" =>   QQ<="01"; 
--	WHEN "10" =>   QQ<="10";
--	WHEN others=>QQ<="00"; --�Ժ�����������
--END CASE;
--END PROCESS COM;
--
--process(clk,rst,en) 
--	begin
--	if (rst'event and rst='1') then 
--	                              Q<="00" ; 
--	elsif (clk'event and clk ='1')  then
--            if Q="01" then		
--               if (en'event and en ='1')  then 
--						                          Q<="10"; 
--					end if;									  
--				elsif  Q="00" then	                   
--					     if (en'event and en ='1')  then 
--						                          Q<="01";
--						  end if;
--				elsif  Q="10" then	
--					     if (en'event and en ='1')  then 
--						                          Q<="01";
--						  end if;
--				else 	Q<="10";	  						  
--            end if;
--	end if;
--end process;


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
			when 0 => QL <="0000";--����0
			when 1 => QL <="0001";--����1
			when 2 => QL <="0010";--����2
			when 3 => QL <="0011";--����3
			when 4 => QL <="0100";--����4
			when 5 => QL <="0101";--����5
			when 6 => QL <="0110";--����6
			when 7 => QL <="0111";--����7
			when 8 => QL <="1000";--����8
			when 9 => QL <="1001";--����9
			when others => QL <="0000";
		end case;
DOUTL<=QL;
end process COML;
 

--COML:PROCESS(ST,QQ,QL,QH,clk,clk_c,rst,en) 
--BEGIN
--IF QQ="00" THEN 
--	             ST<=0; QL<="0000"; QH<="0000"; 
--ELSIF QQ="01" THEN 
--	CASE ST IS
--	WHEN 0 => QL <="0000";  
--	WHEN 1 => QL <="0001";  
--	WHEN 2 => QL <="0010";  
--	WHEN 3 => QL <="0011";  
--	WHEN 4 => QL <="0100";  
--	WHEN 5 => QL <="0101";  
--	WHEN 6 => QL <="0110";  
--	WHEN 7 => QL <="0111";  
--	WHEN 8 => QL <="1000";  
--	WHEN 9 => QL <="1001";  
--	WHEN others=>QL <="0000";  --�Ժ�����������
--END CASE;
--   if (clk_c'event and clk_c ='1')  then
--	   if (ST=9) then
--		               ST <=0;
--		else 
--	        ST<=ST+1;
--	   end if;
--	end if;
--END IF;
--if (clk'event and clk ='1')  then
--	                               DOUTL <=QL;
--end if;
--END PROCESS COML;
--
--COMH1:PROCESS(ST,cnt_Ten)
--BEGIN
--   IF (ST=0) THEN
--	   IF ( cnt_Ten=5 ) THEN
--		                      cnt_Ten<=0;
--		ELSE
--	        cnt_Ten<=cnt_Ten+1;
--	   END IF;
--	END IF;	
--END PROCESS COMH1;
	
COMH: process(cnt_Ten,QH)
	begin
		case cnt_Ten is
			when 0 => QH <="0000";--����0
			when 1 => QH <="0001";--����1
			when 2 => QH <="0010";--����2
			when 3 => QH <="0011";--����3
			when 4 => QH <="0100";--����4
			when 5 => QH <="0101";--����5
			when others => QH <="0000";
		end case;
end process COMH;
DOUTH<=QH;
end Behavioral;

