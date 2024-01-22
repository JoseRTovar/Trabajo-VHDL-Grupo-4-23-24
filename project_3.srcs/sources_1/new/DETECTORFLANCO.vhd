library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DETECTOR_FLANCO is
 port (
    CLK      : in std_logic;
    
    SYNC_IN1 : in std_logic;
    EDGE1    : out std_logic;
    
    SYNC_IN2 : in std_logic;
    EDGE2    : out std_logic;
    
    SYNC_IN3 : in std_logic;
    EDGE3    : out std_logic
 );
end DETECTOR_FLANCO;

architecture BEHAVIORAL of DETECTOR_FLANCO is

    signal sreg1 : std_logic_vector(2 downto 0);
    signal sreg2 : std_logic_vector(2 downto 0);
    signal sreg3 : std_logic_vector(2 downto 0);
begin
process (CLK)
 begin
    if rising_edge(CLK) then
        sreg1 <= sreg1(1 downto 0) & SYNC_IN1;
    end if;
end process;
 
process (CLK)
 begin
    if rising_edge(CLK) then
        sreg2 <= sreg2(1 downto 0) & SYNC_IN2;
    end if;
end process;
 
process (CLK)
 begin
    if rising_edge(CLK) then
        sreg3 <= sreg3(1 downto 0) & SYNC_IN3;
    end if;
end process;
 
 with sreg1 select
 EDGE1 <= '1' when "100",
 '0' when others;
 
 with sreg2 select
 EDGE2 <= '1' when "100",
 '0' when others;
 
 with sreg3 select
 EDGE3 <= '1' when "100",
 '0' when others;
 
end BEHAVIORAL;
