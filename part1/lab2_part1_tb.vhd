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

entity lab2_part1_tb is
--  Port ( );
end lab2_part1_tb;

architecture Behavioral of lab2_part1_tb is

component lab2_part1 is
    Port ( 
            I: in STD_LOGIC_VECTOR (2 downto 0);
             S : in STD_LOGIC_VECTOR (1 downto 0);
              DS : in STD_LOGIC_VECTOR (1 downto 0);
              EI: out STD_LOGIC_VECTOR (2 downto 0):="000";
              O: out STD_LOGIC_VECTOR (2 downto 0):="000"
          );
end component;

signal I: STD_LOGIC_VECTOR(2 downto 0):="000";
signal S: STD_LOGIC_VECTOR(1 downto 0):="00";
signal DS: STD_LOGIC_VECTOR(1 downto 0):="00";
signal EI: STD_LOGIC_VECTOR(2 downto 0):="000";
signal O: STD_LOGIC_VECTOR(2 downto 0):="000";
begin

-- Instantiate components.

Labs_Access: lab2_part1 port map
        ( 
            I=>I,
            S=>S,
            DS=>DS,
            O=>O,
            EI=> EI
        );
       

Simulation: process 
begin
    -- Test outputs when s1s0=00, ds1ds0=00 and  I0=1
      S <= "00" ;
      DS<= "00";
      I<= "001" ;
      wait for 10 ns;

     -- Test outputs when s1s0=10, ds1ds0=10 and  I1=1
       S <= "10" ;
       DS<= "10";
       I<= "010" ;
       wait for 10 ns;

    -- Test outputs when s1s0=01, ds1ds0=01 and  I2=1
       S <= "01" ;
       DS<= "01";
       I<= "100" ;
       wait for 10 ns;

   -- Test outputs when s1s0=01, ds1ds0=00 and  I2=1
        S <= "01" ;
        DS<= "00";
        I<= "100" ;
        wait for 10 ns;
        
        
        
        S <= "11" ;
        DS<= "11";
        I<= "111" ;
        wait for 10 ns;



end process;


end Behavioral;
