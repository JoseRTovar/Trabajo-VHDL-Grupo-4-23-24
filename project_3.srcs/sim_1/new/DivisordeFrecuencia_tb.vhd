library ieee;
use ieee.std_logic_1164.all;

entity tb_DivisorFrecuencia is
end tb_DivisorFrecuencia;

architecture tb of tb_DivisorFrecuencia is

    component DivisorFrecuencia
        port (clk_in  : in std_logic;
              rst     : in std_logic;
              clk_out : out std_logic);
    end component;

    signal clk_in  : std_logic;
    signal rst     : std_logic;
    signal clk_out : std_logic;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : DivisorFrecuencia
    port map (clk_in  => clk_in,
              rst     => rst,
              clk_out => clk_out);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk_in is really your main clock signal
    clk_in <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_DivisorFrecuencia of tb_DivisorFrecuencia is
    for tb
    end for;
end cfg_tb_DivisorFrecuencia;