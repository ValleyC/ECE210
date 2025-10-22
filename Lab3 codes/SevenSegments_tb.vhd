----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/05/2018 12:53:34 PM
-- Design Name: 
-- Module Name: SevenSegments_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: Antonio Andara Lara (28-10-2024)
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SevenSegments_tb IS
    --  Port ( );
END SevenSegments_tb;

ARCHITECTURE Behavioral OF SevenSegments_tb IS
    COMPONENT SevenSegments IS
        PORT (
            sw       : IN STD_LOGIC_VECTOR(3 DOWNTO 0);    -- Input switches
            CC       : OUT STD_LOGIC;                      --Common cathode input to select respective 7-segment. 0=> first, 1=> second
            out_7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)); -- Output for 7-Segment display
    END COMPONENT;

    SIGNAL CC       : STD_LOGIC;
    SIGNAL sw       : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL out_7seg : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    -- Component Instantiation
    Seven_Segment : SevenSegments PORT MAP
    (
        sw       => sw,
        CC       => CC,
        out_7seg => out_7seg
    ); -- Output for 7-Segment display
    Simulation : PROCESS
    BEGIN

        sw <= "0000";
        WAIT FOR 1 ns;
        sw <= "0001";
        WAIT FOR 1 ns;
        sw <= "0010";
        WAIT FOR 1 ns;
        sw <= "0011";
        WAIT FOR 1 ns;
        sw <= "0100";
        WAIT FOR 1 ns;
        sw <= "0101";
        WAIT FOR 1 ns;
        sw <= "0110";
        WAIT FOR 1 ns;
        sw <= "0111";
        WAIT FOR 1 ns;
        sw <= "1000";
        WAIT FOR 1 ns;
        sw <= "1001";
        WAIT FOR 1 ns;
        sw <= "1010";
        WAIT FOR 1 ns;
        sw <= "1011";
        WAIT FOR 1 ns;
        sw <= "1100";
        WAIT FOR 1 ns;
        sw <= "1101";
        WAIT FOR 1 ns;
        sw <= "1110";
        WAIT FOR 1 ns;
        sw <= "1111";
        WAIT FOR 1 ns;

    END PROCESS;
END Behavioral;
