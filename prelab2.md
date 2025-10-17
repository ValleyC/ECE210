# ECE210 Lab 2 Pre-Lab Solutions

## Part I – Multiplexer (MUXs) and Demultiplexer (DEMUXs)

### a) Algebraic Expressions

#### i) MUX Output (M)

Based on the MUX selection table from the manual, the MUX output M is determined by select signals S(1) and S(0):

**Truth Table:**
| S(1) | S(0) | MUX Output (M) |
|------|------|----------------|
| 0    | 0    | I(0)           |
| 0    | 1    | I(1)           |
| 1    | 0    | I(2)           |

**Algebraic Expression:**
```
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
```

### b) VHDL Implementation for Part I

```vhdl
-- Part I: MUX and DEMUX Implementation
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

---

## Part II – Lab Access Control

### a) Completed Truth Table

| C0 | C1 | K0 | K1 | K2 | Alarm | Lab0_Unlock | Lab1_Unlock |
|----|----|----|----|----|-------|-------------|-------------|
| 0  | 0  | 0  | 0  | 0  | 0     | 0           | 0           |
| 0  | 0  | 0  | 0  | 1  | 0     | 0           | 0           |
| 0  | 0  | 0  | 1  | 0  | 0     | 0           | 0           |
| 0  | 0  | 0  | 1  | 1  | 0     | 0           | 0           |
| 0  | 0  | 1  | 0  | 0  | 0     | 0           | 0           |
| 0  | 0  | 1  | 0  | 1  | 0     | 0           | 0           |
| 0  | 0  | 1  | 1  | 0  | 0     | 0           | 0           |
| 0  | 0  | 1  | 1  | 1  | 0     | 0           | 0           |
| 0  | 1  | 0  | 0  | 0  | 1     | 0           | 0           |
| 0  | 1  | 0  | 0  | 1  | 1     | 0           | 0           |
| 0  | 1  | 0  | 1  | 0  | 1     | 0           | 0           |
| 0  | 1  | 0  | 1  | 1  | 1     | 0           | 0           |
| 0  | 1  | 1  | 0  | 0  | 0     | 1           | 0           |
| 0  | 1  | 1  | 0  | 1  | 1     | 0           | 0           |
| 0  | 1  | 1  | 1  | 0  | 0     | 1           | 0           |
| 0  | 1  | 1  | 1  | 1  | 1     | 0           | 0           |
| 1  | 0  | 0  | 0  | 0  | 1     | 0           | 0           |
| 1  | 0  | 0  | 0  | 1  | 0     | 0           | 1           |
| 1  | 0  | 0  | 1  | 0  | 1     | 0           | 0           |
| 1  | 0  | 0  | 1  | 1  | 0     | 0           | 1           |
| 1  | 0  | 1  | 0  | 0  | 1     | 0           | 0           |
| 1  | 0  | 1  | 0  | 1  | 1     | 0           | 0           |
| 1  | 0  | 1  | 1  | 0  | 1     | 0           | 0           |
| 1  | 0  | 1  | 1  | 1  | 1     | 0           | 0           |
| 1  | 1  | 0  | 0  | 0  | 1     | 0           | 0           |
| 1  | 1  | 0  | 0  | 1  | 1     | 0           | 0           |
| 1  | 1  | 0  | 1  | 0  | 1     | 0           | 0           |
| 1  | 1  | 0  | 1  | 1  | 1     | 0           | 0           |
| 1  | 1  | 1  | 0  | 0  | 1     | 0           | 0           |
| 1  | 1  | 1  | 0  | 1  | 1     | 0           | 0           |
| 1  | 1  | 1  | 1  | 0  | 1     | 0           | 0           |
| 1  | 1  | 1  | 1  | 1  | 1     | 0           | 0           |

### b) Algebraic Expressions and Logic Circuits

#### 1. Lab0_Unlock

Lab0 unlocks when:
- Card code C(0)C(1) = "01" → C0=0, C1=1
- Keypad code K0 K1 K2 = "100" → K0=1, K1=0, K2=0 OR
- Keypad code K0 K1 K2 = "110" → K0=1, K1=1, K2=0

**Expression:**
```
Lab0_Unlock = C0' · C1 · K0 · K2'
```

#### 2. Lab1_Unlock

Lab1 unlocks when:
- Card code C(0)C(1) = "10" → C0=1, C1=0
- Keypad code K0 K1 K2 = "001" → K0=0, K1=0, K2=1 OR
- Keypad code K0 K1 K2 = "011" → K0=0, K1=1, K2=1

**Expression:**
```
Lab1_Unlock = C0 · C1' · K0' · K2
```

#### 3. Alarm

Alarm activates when card is present BUT combination is wrong.

**Expression (Sum of Products form):**
```
Alarm = C1·K0' + C0·K0 + C0·K2' + C1·K2
```

### Logic Circuit Diagrams

#### Lab0_Unlock Circuit
```
C0 ──[NOT]──┐
            │
C1 ─────────┼──[AND]──┐
            │         │
K0 ─────────┤         ├──[AND]── Lab0_Unlock
            │         │
K2 ──[NOT]──┘         │
```

#### Lab1_Unlock Circuit
```
C0 ─────────┐
            │
C1 ──[NOT]──┼──[AND]──┐
            │         │
K0 ──[NOT]──┤         ├──[AND]── Lab1_Unlock
            │         │
K2 ─────────┘         │
```

#### Alarm Circuit (Using SOP form)
```
C1 ─────────┬──────────┐
            │          │
K0 ──[NOT]──┼──[AND]───┤
            │          │
            │          │
C0 ─────────┼──────┬───┤
            │      │   │
K0 ─────────┼──[AND]   │
            │      │   ├──[OR]── Alarm
            │      │   │
C0 ─────────┼──────┼───┤
            │      │   │
K2 ──[NOT]──┼──[AND]   │
            │      │   │
            │      │   │
C1 ─────────┼──────┼───┤
            │      │   │
K2 ─────────┴──[AND]───┘
```

### Complete Logic Schematic

```
Inputs: C0, C1, K0, K1, K2

         ┌─[NOT]─┐
    C0 ──┤       ├──┐
         └───────┘  │
    C1 ─────────────┼──[AND]──┐
                    │         │
    K0 ─────────────┤         ├──[AND]── Lab0_Unlock
                    │         │
         ┌─[NOT]─┐  │         │
    K2 ──┤       ├──┘         │
         └───────┘             │
                               │
    C0 ─────────────┐          │
                    │          │
         ┌─[NOT]─┐  │          │
    C1 ──┤       ├──┼──[AND]──┐│
         └───────┘  │         ││
         ┌─[NOT]─┐  │         ││
    K0 ──┤       ├──┤         ├┼──[AND]── Lab1_Unlock
         └───────┘  │         ││
    K2 ─────────────┘         ││
                               ││
                               ││
    C1 ─────────┬──────────────┤│
                │              ││
         ┌─[NOT]┐              ││
    K0 ──┤     ├┼──[AND]───┐   ││
         └─────┘│          │   ││
                │          │   ││
    C0 ─────────┼──────┬───┤   ││
                │      │   │   ││
    K0 ─────────┼──[AND]   │   ││
                │      │   │   ││
                │      │   ├[OR]┴┴─ Alarm
    C0 ─────────┼──────┼───┤
                │      │   │
         ┌─[NOT]┐      │   │
    K2 ──┤     ├┼──[AND]   │
         └─────┘│      │   │
                │      │   │
    C1 ─────────┼──────┼───┤
                │      │   │
    K2 ─────────┴──[AND]───┘
```

---
