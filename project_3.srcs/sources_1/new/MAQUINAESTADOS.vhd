library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity maquina_estados is
    Port ( clk                : in STD_LOGIC;
    
           empezar_lavado     : in STD_LOGIC; --boton
           reset              : in STD_LOGIC; --boton
           sensor_liquidos    : in STD_LOGIC; --boton
           
           clk_out            : in STD_LOGIC; 
           
           sw_encendido       : in STD_LOGIC; 
           switch_velocidad   : in STD_LOGIC;
           switch_temperatura : in STD_LOGIC;
           
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
end maquina_estados;

architecture Behavioral of maquina_estados is
    type State_Type is (CONFIGURACION, LLENADO_AGUA, DETERGENTE, LAVADO, VACIAR_LIQUIDOS, SECAR, FINALIZADO);
    signal estado, estado_siguiente    : State_Type;
    signal contador                    : integer range 0 to 100:= 0;
    signal temperatura                 : integer    := 30; 
    signal velocidad                   : integer    := 0; 
    
   -- constant tiempo_llenado_agua       : integer := 5;        --ciclos para simulación
   -- constant tiempo_llenado_agua       : integer := 1000000;  --ciclos de reloj equivalentes
    
    --constant tiempo_llenado_detergente: integer := 4;        --ciclos para simulación
    --constant tiempo_llenado_detergente : integer := 1000000;       --ciclos de reloj equivalentes
   
    --constant tiempo_lavado             : integer := 15;       --ciclos para simulación
    constant tiempo_lavado             : integer := 15;        --ciclos de reloj equivalentes
    
    --constant tiempo_vaciado_liquidos   : integer := 8;        --ciclos para simulación
    --constant tiempo_vaciado_liquidos   : integer := 1000000;        --ciclos de reloj equivalentes
    
    --constant tiempo_secado             : integer := 100;      --ciclos para simulación
    constant tiempo_secado             : integer := 10;        --ciclos de reloj equivalentes
    
    constant TEMPERATURA_BAJA          : integer := 30;
    constant TEMPERATURA_ALTA          : integer := 50;
    
    constant VELOCIDAD_BAJA            : integer := 1;
    constant VELOCIDAD_ALTA            : integer := 2;
    
begin

 process(clk_out,estado,empezar_lavado,sensor_liquidos,contador)
    begin
     
        case estado is
            when CONFIGURACION =>
                codigo_modo <= "0001";
                
                led_funcionando   <= '0';
                led_finalizado    <= '0';
                contador          <= 0; 
                bomba_agua        <= '0';
                bomba_detergente  <= '0';
                motor_rotacion    <= '0';
                calentador        <= '0';
                abrir_sumidero    <= '0';
              
                
                if empezar_lavado = '1' then
                  
                    estado_siguiente <= LLENADO_AGUA; 
                else
                    estado_siguiente <= CONFIGURACION;
                end if;

            when LLENADO_AGUA =>
                led_funcionando   <= '1';
                codigo_modo       <= "0010"; 
                bomba_agua        <= '1';
                bomba_detergente  <= '0';
                motor_rotacion    <= '0';
                calentador        <= '0';
                abrir_sumidero    <= '0';
                
                
                if sensor_liquidos = '1' then   
                estado_siguiente <= DETERGENTE; 
                else
                estado_siguiente <= LLENADO_AGUA;
                end if;


            when DETERGENTE =>
                led_funcionando   <= '1';            
                codigo_modo       <= "0011";
                bomba_agua        <= '0';
                bomba_detergente  <= '1';
                motor_rotacion    <= '0';
                calentador        <= '0';
                abrir_sumidero    <= '0';
            
                   if sensor_liquidos = '1' then   
                estado_siguiente <= LAVADO; 
                else
                estado_siguiente <= DETERGENTE;
                end if;
            


            when LAVADO =>
                led_funcionando   <= '1';           
                codigo_modo       <= "0100";
                bomba_agua        <= '0';
                bomba_detergente  <= '0';
                motor_rotacion    <= '1';
                calentador        <= '1';
                abrir_sumidero    <= '0';
           
                
                   if empezar_lavado = '1' then   
                estado_siguiente <= VACIAR_LIQUIDOS; 
                else
                estado_siguiente <= LAVADO;
                end if;
--                if rising_edge(clk_out) then
--                 estado_siguiente <= VACIAR_LIQUIDOS;                    
--                end if;
                
            when VACIAR_LIQUIDOS =>
                led_funcionando   <= '1';            
                codigo_modo       <= "0101"; 
                bomba_agua        <= '0';
                bomba_detergente  <= '0';
                motor_rotacion    <= '0';
                calentador        <= '0';
                abrir_sumidero    <= '1';
                contador<=0;
              
                   
                if sensor_liquidos = '1' then   
                estado_siguiente <= SECAR; 
                else
                estado_siguiente <= VACIAR_LIQUIDOS;
                end if;       


            when SECAR =>
                led_funcionando   <= '1';            
                codigo_modo       <= "0110";
                bomba_agua        <= '0';
                bomba_detergente  <= '0';
                motor_rotacion    <= '0';
                calentador        <= '1';
                abrir_sumidero    <= '0';
                
                
                if empezar_lavado = '1' then   
                estado_siguiente <= FINALIZADO; 
                else
                estado_siguiente <= SECAR;
                end if;
--                if rising_edge(clk_out) then    
--                if contador = tiempo_secado then
--                    estado_siguiente <= FINALIZADO;
--                else
--                   contador <= contador + 1;
--                    estado_siguiente <= SECAR;
--                end if;
--                end if;
            when FINALIZADO =>
                led_funcionando   <= '0'; 
                led_finalizado    <= '1';           
                codigo_modo       <= "0000";
                bomba_agua        <= '0';
                bomba_detergente  <= '0';
                motor_rotacion    <= '0';
                calentador        <= '0';
                abrir_sumidero    <= '0';
      
                
                if empezar_lavado = '1' then
                    estado_siguiente <= CONFIGURACION;
                else
                    estado_siguiente <= FINALIZADO;
                end if;
                 
            when others =>
                estado_siguiente <= CONFIGURACION;

        end case;
    end process;
    
    process(clk, reset)
    begin
        if reset = '1' then
        
            estado <= CONFIGURACION;
            
        
        elsif rising_edge(clk) then 
            if sw_encendido = '1' then
               estado        <= estado_siguiente;
               led_encendido <= '1';
               seleccion_display <= "11111110";

            else 
               led_encendido <= '0';
               seleccion_display <= "11111111";
               estado <= CONFIGURACION; 
            end if;
        end if;
    end process;
    
    process(switch_velocidad, switch_temperatura)
    begin
        case switch_temperatura is
            when '1' =>
                 temperatura     <= TEMPERATURA_ALTA;
                 led_temperatura <= '1';
            when others =>
                 temperatura     <= TEMPERATURA_BAJA;
                 led_temperatura <= '0';
        end case;

        case switch_velocidad is
            when '1' =>
                 velocidad     <= VELOCIDAD_ALTA;
                 led_velocidad <= '1';
            when others =>
                 velocidad     <= VELOCIDAD_BAJA;
                 led_velocidad <= '0';
        end case;
    end process;
    
end Behavioral;

