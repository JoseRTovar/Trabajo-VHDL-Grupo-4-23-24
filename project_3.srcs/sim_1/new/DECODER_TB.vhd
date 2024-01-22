library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder is
end tb_decoder;

architecture tb of tb_decoder is

    component decoder
        port (codigo_modo : in std_logic_vector (3 downto 0);
              led         : out std_logic_vector (6 downto 0));
    end component;

    signal codigo_modo : std_logic_vector (3 downto 0);
    signal led         : std_logic_vector (6 downto 0);

begin

    dut : decoder
    port map (codigo_modo => codigo_modo,
              led         => led);

    stimuli : process
    begin

        codigo_modo <= (others => '0');
wait for 4 ps;
        codigo_modo <= "0001";
wait for 4 ps;
        codigo_modo <= "0010";
wait for 4 ps;
        codigo_modo <= "0011";
wait for 4 ps;
        codigo_modo <= "0100";
wait for 4 ps;
        codigo_modo <= "0101";
wait for 4 ps;
        codigo_modo <= "0110";
        wait;
    end process;

end tb;



configuration cfg_tb_decoder of tb_decoder is
    for tb
    end for;
end cfg_tb_decoder;