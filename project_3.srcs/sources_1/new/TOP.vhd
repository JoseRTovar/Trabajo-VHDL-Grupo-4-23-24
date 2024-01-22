library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP_LAVADORA is
  Port(
        boton_inicio       : in STD_LOGIC;  --inicio lavado
        boton_reset        : in STD_LOGIC;  --lleva al modo 1 configuración
        boton_sensor_liquidos: in STD_LOGIC;
        clk                : in STD_LOGIC;
        
        sw_temperatura     : in STD_LOGIC;   --temperatura de lavado alta o baja
        sw_velocidad       : in STD_LOGIC;   --velocidad del bombo alta o bajo
        sw_encendido       : in STD_LOGIC;   --encender o apagar la lavadora
                
        led_finalizado     : out STD_LOGIC;
        led_funcionando    : out STD_LOGIC; 
        led_encendido      : out STD_LOGIC;
        led_temperatura    : out STD_LOGIC;
        led_velocidad      : out STD_LOGIC;
       
        
        bomba_agua         : out STD_LOGIC; --actuador
        bomba_detergente   : out STD_LOGIC; --actuador
        calentador         : out STD_LOGIC; --actuador
        motor_rotacion     : out STD_LOGIC; --actuador
        abrir_sumidero     : out STD_LOGIC; --actuador
        

        seleccion_display  : out STD_LOGIC_VECTOR(7 downto 0);
        leds_display       : out STD_LOGIC_VECTOR(6 downto 0)
        );
end TOP_LAVADORA;

architecture Behavioral of TOP_LAVADORA is

signal sadinicio            : std_logic;
signal sadreset             : std_logic;
signal sadsensor_liquidos   : std_logic;

signal daminicio            : std_logic;
signal damreset             : std_logic;
signal damsensor_liquidos   : std_logic;

signal madcodigo_modo : std_logic_vector(3 downto 0);

signal damclk_out     : std_logic;

component SINCRONIZADOR is
port ( 
    CLK       : in std_logic;
    
    ASYNC_IN1 : in std_logic;
    SYNC_OUT1 : out std_logic;
    
    ASYNC_IN2 : in std_logic;
    SYNC_OUT2 : out std_logic;
    
    ASYNC_IN3 : in std_logic;
    SYNC_OUT3 : out std_logic
    );
end component SINCRONIZADOR;

component DETECTOR_FLANCO is
port ( 
    CLK       : in std_logic;
    
    SYNC_IN1  : in std_logic;
    EDGE1     : out std_logic;
    
    SYNC_IN2  : in std_logic;
    EDGE2     : out std_logic;
    
    SYNC_IN3  : in std_logic;
    EDGE3     : out std_logic
    );
end component DETECTOR_FLANCO;

component DivisorFrecuencia is
port ( clk     : in STD_LOGIC;
       reset   : in STD_LOGIC;
       clk_out : inout STD_LOGIC
       );
end component DivisorFrecuencia;

component MAQUINA_ESTADOS is
port (
    empezar_lavado     : in STD_LOGIC;
    reset              : in STD_LOGIC;
    sensor_liquidos    : in STD_LOGIC;   
    clk                : in STD_LOGIC;

    
    switch_temperatura : in STD_LOGIC;
    switch_velocidad   : in STD_LOGIC;
    sw_encendido       : in STD_LOGIC; 
    
    clk_out            : in STD_LOGIC;
    
    led_finalizado     : out STD_LOGIC;
    led_funcionando    : out STD_LOGIC; 
    led_encendido      : out STD_LOGIC;
    led_velocidad      : out STD_LOGIC;
    led_temperatura    : out STD_LOGIC;
    
    motor_rotacion     : out STD_LOGIC;
    calentador         : out STD_LOGIC;
    bomba_detergente   : out STD_LOGIC;
    bomba_agua         : out STD_LOGIC;
    abrir_sumidero     : out STD_LOGIC;
    
    seleccion_display  : out STD_LOGIC_VECTOR(7 downto 0);
    codigo_modo        : out STD_LOGIC_VECTOR(3 downto 0)
  
    );
end component MAQUINA_ESTADOS;

component decoder is
port(
    codigo_modo        : IN std_logic_vector(3 DOWNTO 0);
    led                : OUT std_logic_vector(6 DOWNTO 0)
);
end component decoder;
begin
inst_DivisorFrecuencia: DivisorFrecuencia port map(
    clk => clk,
    reset => damreset,
    clk_out => damclk_out
    );
inst_sincronizador: sincronizador port map( 
    CLK       => clk,
    
    ASYNC_IN1 => boton_inicio,
    SYNC_OUT1 => sadinicio,
    
    ASYNC_IN2 => boton_reset,
    SYNC_OUT2 => sadreset,
    
    ASYNC_IN3 => boton_sensor_liquidos,
    SYNC_OUT3 => sadsensor_liquidos 
 );
 
 inst_detectorflanco: detector_flanco port map ( 
    CLK      => clk,
    
    SYNC_IN1 => sadinicio,
    EDGE1    => daminicio,
    
    SYNC_IN2 => sadreset,
    EDGE2    => damreset,
    
    SYNC_IN3 => sadsensor_liquidos,
    EDGE3    => damsensor_liquidos
    );

inst_maquina_estados: maquina_estados port map(
    clk                => clk, 
    clk_out            => damclk_out,
    reset              => damreset,
    sensor_liquidos    => damsensor_liquidos,
    sw_encendido       => sw_encendido, 
    empezar_lavado     => daminicio,
    switch_velocidad   => sw_velocidad,
    led_velocidad      => led_velocidad,
    switch_temperatura => sw_temperatura,
    led_temperatura    => led_temperatura,
    motor_rotacion     => motor_rotacion,
    calentador         => calentador,
    bomba_detergente   => bomba_detergente,
    bomba_agua         => bomba_agua,
    abrir_sumidero     => abrir_sumidero,
    codigo_modo        => madcodigo_modo,
    led_encendido      => led_encendido,
    seleccion_display  => seleccion_display,
    led_funcionando    => led_funcionando,
    led_finalizado     => led_finalizado  
    );

inst_decoder: decoder port map(
    codigo_modo => madcodigo_modo,
    led         => leds_display 
    );

    
end Behavioral;