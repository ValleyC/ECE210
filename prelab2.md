Part I – Multiplexer (MUXs) and Demultiplexer (DEMUXs)
a) Algebraic Expressions
i) MUX Output (M)
Based on the MUX selection table from the manual, the MUX output M is determined by select signals S(1) and S(0):
Truth Table:
S(1)S(0)MUX Output (M)00I(0)01I(1)10I(2)
Algebraic Expression:
M = S(1)' · S(0)' · I(0) + S(1)' · S(0) · I(1) + S(1) · S(0)' · I(2)
```

#### ii) DEMUX Outputs (O)

The DEMUX takes input M and routes it to outputs O(0), O(1), or O(2) based on demux-select signals DS(1) and DS(0).

**Truth Tables:**

**O(0) - First Engineer:**
| DS(1) | DS(0) | O(0) |
|-------|-------|------|
| 0     | 0     | M    |
| 0     | 1     | 0    |
| 1     | 0     | 0    |
| 1     | 1     | 0    |

**O(1) - Second Engineer:**
| DS(1) | DS(0) | O(1) |
|-------|-------|------|
| 0     | 0     | 0    |
| 0     | 1     | M    |
| 1     | 0     | 0    |
| 1     | 1     | 0    |

**O(2) - Third Engineer:**
| DS(1) | DS(0) | O(2) |
|-------|-------|------|
| 0     | 0     | 0    |
| 0     | 1     | 0    |
| 1     | 0     | M    |
| 1     | 1     | 0    |

**Algebraic Expressions:**
```
O(0) = DS(1)' · DS(0)' · M
O(1) = DS(1)' · DS(0) · M
O(2) = DS(1) · DS(0)' · M
```

#### iii) ENGINEER INDICATORS (EI)

The engineer indicators show which engineer is receiving data (independent of the data value).

**Algebraic Expressions:**
```
EI(0) = DS(1)' · DS(0)'    (Red LED)
EI(1) = DS(1)' · DS(0)     (Green LED)
EI(2) = DS(1) · DS(0)'     (Blue LED)
b) VHDL Implementation for Part I
vhdl-- Part I: MUX and DEMUX Implementation
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lab2_part1 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC_VECTOR (1 downto 0);
           DS : in STD_LOGIC_VECTOR (1 downto 0);
           O : out STD_LOGIC_VECTOR (2 downto 0);
           EI : out STD_LOGIC_VECTOR (2 downto 0));
end lab2_part1;

architecture Behavioral of lab2_part1 is
    signal M : STD_LOGIC;
begin
    -- MUX Logic
    M <= (not S(1) and not S(0) and I(0)) or 
         (not S(1) and S(0) and I(1)) or 
         (S(1) and not S(0) and I(2));
    
    -- DEMUX Output Logic
    O(0) <= not DS(1) and not DS(0) and M;
    O(1) <= not DS(1) and DS(0) and M;
    O(2) <= DS(1) and not DS(0) and M;
    
    -- Engineer Indicators Logic
    EI(0) <= not DS(1) and not DS(0);  -- Red
    EI(1) <= not DS(1) and DS(0);      -- Green
    EI(2) <= DS(1) and not DS(0);      -- Blue
    
end Behavioral;
```
