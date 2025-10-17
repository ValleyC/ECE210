---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/03/2018 12:26:06 PM
-- Design Name: 
-- Module Name: lab2_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lab2_tb is
--  Port ( );
end lab2_tb;

architecture Behavioral of lab2_tb is

component lab2_part2 is
    Port ( 
            C : in STD_LOGIC_VECTOR (1 downto 0);
            K : in STD_LOGIC_VECTOR (2 downto 0);
            Alarm : out STD_LOGIC:='0';
            Lab0_Unlock : out STD_LOGIC:='0';
            Lab1_Unlock : out STD_LOGIC:='0'
          );
end component;

signal C: STD_LOGIC_VECTOR(1 downto 0):="00";
signal K: STD_LOGIC_VECTOR(2 downto 0):="000";
signal Alarm, Lab0_Unlock, Lab1_Unlock: STD_LOGIC:='0';

begin

-- Instantiate components.

Labs_Access: lab2_part2 port map
        ( 
            C=>C,
            K=>K,
            Alarm=>Alarm,
            Lab0_Unlock=>Lab0_Unlock,
            Lab1_Unlock=> Lab1_Unlock
        );

Simulation: process 
begin
    -- Test outputs when C0=0, C1=0 and K0=0, K1=0, K2=0
    C <= "00" ;
    K <= "000" ;
    wait for 10 ns;

    -- Test outputs when C0=0, C1=1 and K0=0, K1=0, K2=0 
    C <= "10" ;
    K <= "000" ;
    wait for 10 ns;

    -- Test outputs when C0=0, C1=1 and K0=1, K1=0, K2=0 
    C <= "10" ;
    K <= "001" ;
    wait for 10 ns;
    
   -- Test outputs when C0=0, C1=1 and K0=1, K1=0, K2=0 
    C <= "10" ;
    K <= "111" ;
    wait for 10 ns;

    -- Test outputs when C0=0, C1=1 and K0=1, K1=1, K2=0 
    C <= "10" ;
    K <= "011" ;
    wait for 10 ns;

    -- Test outputs when C0=1, C1=0 and K0=1, K1=0, K2=0 
    C <= "01" ;
    K <= "001" ;
    wait for 10 ns;

    -- Test outputs when C0=1, C1=0 and K0=0, K1=1, K2=1 
    C <= "01" ;
    K <= "110" ;
    wait for 10 ns;

    -- Test outputs when C0=1, C1=0 and K0=1, K1=1, K2=1 
    C <= "01" ;
    K <= "111" ;
    wait for 10 ns;

    -- Test outputs when C0=1, C1=0 and K0=0, K1=0, K2=1 
    C <= "01" ;
    K <= "100" ;
    wait for 10 ns;

    -- Test outputs when C0=1, C1=1 and K0=0, K1=0, K2=1 
    C <= "11" ;
    K <= "100" ;
    wait for 10 ns;
    
    -- Test outputs when C0=1, C1=1 and K0=0, K1=1, K2=1 
    C <= "11" ;
    K <= "110" ;
    wait for 10 ns;

end process;


end Behavioral;
