----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 09:58:41 AM
-- Design Name: 
-- Module Name: TP4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TP4 is
  Port ( A : in std_logic_vector (7 downto 0);       -- valor A ingresado
         B : in std_logic_vector (7 downto 0);       -- valor B ingresado
         BTN1 : in std_logic;                        -- boton 1
         BTN2 : in std_logic;                        -- boton 2
         RESULT : in std_logic_vector (7 downto 0);  -- resultado (tiene un bit mas para el) 
         CARRY : out std_logic                       -- bit de carry
         --SIGN : out std_logic                      -- bit de signo: SACAR
        );
end TP4;

architecture Behavioral of TP4 is

signal A_A: std_logic_vector (8 downto 0);   -- cable transporte 8 bits + signo para valor A
signal B_B: std_logic_vector (8 downto 0);   -- cable transporte 8 bits + signo para valor B

signal R_SUM: std_logic_vector (8 downto 0); -- variable resultado suma: 8 bits + 1 bit de signo
signal R_DIF: std_logic_vector (8 downto 0); -- variable resultado resta: 8 bits + 1 bit de signo
signal R_XOR: std_logic_vector (8 downto 0); -- variable resultado suma exclusiva: 8 bits + 1 bit de signo
signal R_AND: std_logic_vector (8 downto 0); -- variable resultado multiplicacion: 8 bits + 1 bit de signo

signal R_RES: std_logic_vector (8 downto 0); -- cable transporte 8 bits + signo para el resultado
-- hacer el signo una señal
begin
    A_A <='0' & std_logic_vector (A);
    B_B <='0' & std_logic_vector (B);
    
    process (A_A, B_B)
    
    begin        
       R_SUM <= A_A + B_B;
       --SIGN <= '0';
    end process;
    
    process (A_A, B_B)
   
    begin
       R_DIF <= A_A - B_B;
       --SIGN <= '1';
    end process;
   
    process (A_A, B_B)
   
    begin
      R_AND <= A_A and B_B;
      --SIGN <= '0';
    end process;
   
    process (A_A, B_B)
   
    begin
      R_XOR <= A_A xor B_B;
      --SIGN <= '0';    
    end process;
    
    process(BTN1, BTN2)
        
    begin
       
       if(BTN1='0' and BTN2='0') then
            R_RES <= R_SUM;
            CARRY <= R_SUM(8);
       elsif(BTN1='1' and BTN2='0') then
            R_RES <= R_DIF;
            CARRY <= R_DIF(8);
       elsif(BTN1='0' and BTN2='1') then
            R_RES <= R_AND;
       elsif(BTN1='1' and BTN2='1') then
            R_RES <= R_XOR;
       end if;   
    
    end process;
    

end Behavioral;
