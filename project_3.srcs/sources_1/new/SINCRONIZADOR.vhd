library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SINCRONIZADOR is
 port (
    CLK       : in std_logic;
    
    ASYNC_IN1 : in std_logic;
    SYNC_OUT1 : out std_logic;
    
    ASYNC_IN2 : in std_logic;
    SYNC_OUT2 : out std_logic;
    
    ASYNC_IN3 : in std_logic;
    SYNC_OUT3 : out std_logic
    );
end SINCRONIZADOR;

architecture BEHAVIORAL of SINCRONIZADOR is

 signal sreg1 : std_logic_vector(1 downto 0);
 signal sreg2 : std_logic_vector(1 downto 0);
 signal sreg3 : std_logic_vector(1 downto 0);
 
begin
 
process (CLK)
   begin
    if rising_edge(CLK) then
        sync_out1 <= sreg1(1);
        sreg1     <= sreg1(0) & async_in1;
    end if;
end process;
 
process (CLK)
 begin
    if rising_edge(CLK) then
        sync_out2 <= sreg2(1);
        sreg2     <= sreg2(0) & async_in2;
    end if;
end process;
 
process (CLK)
 begin
    if rising_edge(CLK) then
        sync_out3 <= sreg3(1);
        sreg3     <= sreg3(0) & async_in3;
    end if;
end process;

end BEHAVIORAL;