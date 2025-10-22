------------------------------------------------------------------------------------
---- Company: University of Alberta
---- Design Name: 7segment - gate level
---- Module Name: lab3_part1 - Behavioral
---- Project Name: ECE210 - lab3_part1
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision: Antonio Andara Lara (28-10-2024)
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------
--LIBRARY IEEE;
--USE IEEE.STD_LOGIC_1164.ALL;

--ENTITY SevenSegments IS
--    PORT (
--        sw       : IN STD_LOGIC_VECTOR(3 DOWNTO 0);    -- Input switches
--        CC       : OUT STD_LOGIC;                      -- Common cathode input to select respective 7-segment. 0=> first, 1=> second
--        out_7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)); -- Output for 7-Segment display
--END SevenSegments;

--ARCHITECTURE Behavioral OF SevenSegments IS
--    -- Signal aliases for clarity
--    signal a : STD_LOGIC;  -- a = sw(3)
--    signal b : STD_LOGIC;  -- b = sw(2)
--    signal c : STD_LOGIC;  -- c = sw(1)
--    signal d : STD_LOGIC;  -- d = sw(0)
--BEGIN
--    -- Map input switches to local signals
--    a <= sw(3);
--    b <= sw(2);
--    c <= sw(1);
--    d <= sw(0);
    
--    -- Part I: Gate-level implementation using minimized Boolean expressions
    
--    -- Segment A (out_7seg(6))
--    -- A = ac' + a'b'd' + b'cd + bc'd + bcd'
--    out_7seg(6) <= (a and (not c)) or 
--                   ((not a) and (not b) and (not d)) or 
--                   ((not b) and c and d) or 
--                   (b and (not c) and d) or 
--                   (b and c and (not d));
    
--    -- Segment B (out_7seg(5))
--    -- B = b'd' + cd' + ac + ab
--    out_7seg(5) <= ((not b) and (not d)) or 
--                   (c and (not d)) or 
--                   (a and c) or 
--                   (a and b);
    
--    -- Segment C (out_7seg(4))
--    -- C = c'd' + bd' + ab' + ac + a'bc'
--    out_7seg(4) <= ((not c) and (not d)) or 
--                   (b and (not d)) or 
--                   (a and (not b)) or 
--                   (a and c) or 
--                   ((not a) and b and (not c));
    
--    -- Segment D (out_7seg(3))
--    -- D = b'd' + a'c + bc + ad' + a'bd + ab'c'
--    out_7seg(3) <= ((not b) and (not d)) or 
--                   ((not a) and c) or 
--                   (b and c) or 
--                   (a and (not d)) or 
--                   ((not a) and b and d) or 
--                   (a and (not b) and (not c));
    
--    -- Segment E (out_7seg(2))
--    -- E = a'b' + b'd' + a'c'd' + a'cd + ac'd
--    out_7seg(2) <= ((not a) and (not b)) or 
--                   ((not b) and (not d)) or 
--                   ((not a) and (not c) and (not d)) or 
--                   ((not a) and c and d) or 
--                   (a and (not c) and d);
    
--    -- Segment F (out_7seg(1))
--    -- F = a'c' + a'd + c'd + a'b + ab'
--    out_7seg(1) <= ((not a) and (not c)) or 
--                   ((not a) and d) or 
--                   ((not c) and d) or 
--                   ((not a) and b) or 
--                   (a and (not b));
    
--    -- Segment G (out_7seg(0))
--    -- G = b'c + cd' + ab' + ad + a'bc'
--    out_7seg(0) <= ((not b) and c) or 
--                   (c and (not d)) or 
--                   (a and (not b)) or 
--                   (a and d) or 
--                   ((not a) and b and (not c));
    
--    -- Common Cathode control - set to '0' to enable first 7-segment display
--    CC <= '0';
    
--END Behavioral;

----------------------------------------------------------------------------------
-- Company: University of Alberta
-- Design Name: 7segment - case statement
-- Module Name: lab3_part2 - Behavioral
-- Project Name: ECE210 - lab3_part2
-- Target Devices: 
-- Tool Versions: 
-- Description: Part II - 7-Segment Decoder using CASE statement
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

ENTITY SevenSegments IS
    PORT (
        sw       : IN STD_LOGIC_VECTOR(3 DOWNTO 0);    -- Input switches
        CC       : OUT STD_LOGIC;                      -- Common cathode input to select respective 7-segment. 0=> first, 1=> second
        out_7seg : OUT STD_LOGIC_VECTOR (6 DOWNTO 0)); -- Output for 7-Segment display
END SevenSegments;

ARCHITECTURE Behavioral OF SevenSegments IS
BEGIN
    -- Part II: Implementation using CASE statement
    process(sw)
    begin
        Case sw is
            WHEN "0000" => out_7seg <= "1111110";  -- 0
            WHEN "0001" => out_7seg <= "0000110";  -- 1
            WHEN "0010" => out_7seg <= "1101101";  -- 2
            WHEN "0011" => out_7seg <= "1001111";  -- 3
            WHEN "0100" => out_7seg <= "0010111";  -- 4
            WHEN "0101" => out_7seg <= "1011011";  -- 5
            WHEN "0110" => out_7seg <= "1111011";  -- 6
            WHEN "0111" => out_7seg <= "0001110";  -- 7
            WHEN "1000" => out_7seg <= "1111111";  -- 8
            WHEN "1001" => out_7seg <= "1011111";  -- 9
            when "1010" => out_7seg <= "0111111";  -- A: Display A
            when "1011" => out_7seg <= "1110011";  -- b: Display b
            when "1100" => out_7seg <= "1110001";  -- C: Display C
            when "1101" => out_7seg <= "1100111";  -- d: Display d
            when "1110" => out_7seg <= "1111001";  -- E: Display E
            when "1111" => out_7seg <= "0111001";  -- F: Display F
            when others => out_7seg <= "0000000";  -- Default: all segments off
        end case;
    end process;
    
    CC <= '0';  -- Enable first 7-segment display
    
END Behavioral;