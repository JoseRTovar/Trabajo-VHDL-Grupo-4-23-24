
library ieee;
use ieee.std_logic_1164.all;

entity tb_maquina_estados is
end tb_maquina_estados;

architecture tb of tb_maquina_estados is

    component maquina_estados
        port (clk                : in std_logic;
              empezar_lavado     : in std_logic;
              reset              : in std_logic;
              sensor_liquidos    : in std_logic;
              clk_out            : in std_logic;
              sw_encendido       : in std_logic;
              switch_velocidad   : in std_logic;
              switch_temperatura : in std_logic;
              led_finalizado     : out std_logic;
              led_funcionando    : out std_logic;
              led_encendido      : out std_logic;
              led_velocidad      : out std_logic;
              led_temperatura    : out std_logic;
              motor_rotacion     : out std_logic;
              calentador         : out std_logic;
              bomba_detergente   : out std_logic;
              bomba_agua         : out std_logic;
              abrir_sumidero     : out std_logic;
              seleccion_display  : out std_logic_vector (7 downto 0);
              codigo_modo        : out std_logic_vector (3 downto 0));
    end component;

    signal clk                : std_logic;
    signal empezar_lavado     : std_logic;
    signal reset              : std_logic;
    signal sensor_liquidos    : std_logic;
    signal clk_out            : std_logic;
    signal sw_encendido       : std_logic;
    signal switch_velocidad   : std_logic;
    signal switch_temperatura : std_logic;
    signal led_finalizado     : std_logic;
    signal led_funcionando    : std_logic;
    signal led_encendido      : std_logic;
    signal led_velocidad      : std_logic;
    signal led_temperatura    : std_logic;
    signal motor_rotacion     : std_logic;
    signal calentador         : std_logic;
    signal bomba_detergente   : std_logic;
    signal bomba_agua         : std_logic;
    signal abrir_sumidero     : std_logic;
    signal seleccion_display  : std_logic_vector (7 downto 0);
    signal codigo_modo        : std_logic_vector (3 downto 0);

begin

    dut : maquina_estados
    port map (clk                => clk,
              empezar_lavado     => empezar_lavado,
              reset              => reset,
              sensor_liquidos    => sensor_liquidos,
              clk_out            => clk_out,
              sw_encendido       => sw_encendido,
              switch_velocidad   => switch_velocidad,
              switch_temperatura => switch_temperatura,
              led_finalizado     => led_finalizado,
              led_funcionando    => led_funcionando,
              led_encendido      => led_encendido,
              led_velocidad      => led_velocidad,
              led_temperatura    => led_temperatura,
              motor_rotacion     => motor_rotacion,
              calentador         => calentador,
              bomba_detergente   => bomba_detergente,
              bomba_agua         => bomba_agua,
              abrir_sumidero     => abrir_sumidero,
              seleccion_display  => seleccion_display,
              codigo_modo        => codigo_modo);

    stimuli : process
    begin
        clk <= '0';
        empezar_lavado <= '0';
        reset <= '0';
        sensor_liquidos <= '0';
        sw_encendido <= '0';
        switch_velocidad <= '0';
        switch_temperatura <= '0';
        wait for 1 ps;
        sw_encendido <= '1';
        clk <= '1';
        wait for 1 ps;
        switch_velocidad <= '1';
        switch_temperatura <= '1';
        clk <= '0';
        wait for 1 ps;
        switch_velocidad <= '0';
        switch_temperatura <= '0';
        clk <= '1';
        wait for 1 ps;
        empezar_lavado <= '1';
        clk <= '0';
        wait for 1 ps;
        empezar_lavado <= '0';        
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        sensor_liquidos <= '1';
        clk <= '1';
        wait for 1 ps;       
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        sensor_liquidos <= '0';
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        sensor_liquidos <= '1';
        clk <= '1';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        sensor_liquidos <= '0';
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        reset <= '1';
        wait for 1 ps;
        reset <= '0';
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';

        wait;
    end process;

end tb;


configuration cfg_tb_maquina_estados of tb_maquina_estados is
    for tb
    end for;
end cfg_tb_maquina_estados;