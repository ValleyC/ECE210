----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2021 12:53:34 PM
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

ENTITY Seven_Segments_tb IS
    --  Port ( );
END Seven_Segments_tb;

ARCHITECTURE Behavioral OF Seven_Segments_tb IS
    COMPONENT SevenSegments2digits IS
        PORT (
            clk      : IN STD_LOGIC;
            CC       : OUT STD_LOGIC; --Common cathode input to select respective 7-segment digit.
            out_7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
    END COMPONENT;

    SIGNAL CC       : STD_LOGIC;
    SIGNAL clk      : STD_LOGIC := '0';
    SIGNAL out_7seg : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    -- Component Instantiation
    Seven_Segment : SevenSegments2digits PORT MAP
    (
        clk      => clk,
        CC       => CC,
        out_7seg => out_7seg
    );

    PROCESS
    BEGIN
        clk <= NOT clk;
        WAIT FOR 125 ps;
    END PROCESS;

END Behavioral;
