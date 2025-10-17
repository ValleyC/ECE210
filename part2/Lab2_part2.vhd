----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/29/2020 09:35:08 PM
-- Design Name: 
-- Module Name: lab2_part2 - Behavioral
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

entity lab2_part2 is
    Port (  --clk : in STD_LOGIC;
            C : in STD_LOGIC_VECTOR (1 downto 0);
            K : in STD_LOGIC_VECTOR (2 downto 0);
            Alarm : out STD_LOGIC:='0';
            Lab0_Unlock : out STD_LOGIC:='0';
            Lab1_Unlock : out STD_LOGIC:='0'
          );
end lab2_part2;

architecture Behavioral of lab2_part2 is

--you may have to define some signals for lab0_unlock and lab1_unlock

begin

    -- Lab0_Unlock = C(0)' · C(1) · K(0) · K(2)'
    Lab0_Unlock <= (not C(0)) and C(1) and K(0) and (not K(2));
    
    -- Lab1_Unlock = C(0) · C(1)' · K(0)' · K(2)
    Lab1_Unlock <= C(0) and (not C(1)) and (not K(0)) and K(2);
    
    -- Alarm = C(1)·K(0)' + C(0)·K(0) + C(0)·K(2)' + C(1)·K(2)
    Alarm <= (C(1) and not K(0)) or 
             (C(0) and K(0)) or 
             (C(0) and not K(2)) or 
             (C(1) and K(2));

end Behavioral;
