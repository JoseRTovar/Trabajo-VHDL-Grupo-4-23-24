library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DivisorFrecuencia is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : inout STD_LOGIC);
end DivisorFrecuencia;

architecture Behavioral of DivisorFrecuencia is
    signal contador : integer range 0 to 25000000; -- Frecuencia original: 100 MHz, Frecuencia deseada: 0.5 Hz
begin
    process(clk, reset)
    begin
        if reset = '1' then
            contador <= 0;
            clk_out <= '0';
        elsif rising_edge(clk) then
            if contador < 24999999 then
                contador <= contador + 1;
            else
                contador <= 0;
                clk_out <= not clk_out; -- Genera un pulso cada vez que se alcanza la cuenta deseada
            end if;
        end if;
    end process;

end Behavioral;
