library ieee;
use ieee.std_logic_1164.all;

entity tb_SINCRONIZADOR is
end tb_SINCRONIZADOR;

architecture tb of tb_SINCRONIZADOR is

    component SINCRONIZADOR
        port (CLK       : in std_logic;
              ASYNC_IN1 : in std_logic;
              SYNC_OUT1 : out std_logic;
              ASYNC_IN2 : in std_logic;
              SYNC_OUT2 : out std_logic;
              ASYNC_IN3 : in std_logic;
              SYNC_OUT3 : out std_logic);
    end component;

    signal CLK       : std_logic;
    signal ASYNC_IN1 : std_logic;
    signal SYNC_OUT1 : std_logic;
    signal ASYNC_IN2 : std_logic;
    signal SYNC_OUT2 : std_logic;
    signal ASYNC_IN3 : std_logic;
    signal SYNC_OUT3 : std_logic;



begin

    dut : SINCRONIZADOR
    port map (CLK       => CLK,
              ASYNC_IN1 => ASYNC_IN1,
              SYNC_OUT1 => SYNC_OUT1,
              ASYNC_IN2 => ASYNC_IN2,
              SYNC_OUT2 => SYNC_OUT2,
              ASYNC_IN3 => ASYNC_IN3,
              SYNC_OUT3 => SYNC_OUT3);

    
  

    stimuli : process
    begin
       
        ASYNC_IN1 <= '0';
        ASYNC_IN2 <= '0';
        ASYNC_IN3 <= '0';
        wait for 1 ps;
        clk <= '1';
        ASYNC_IN1 <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
                ASYNC_IN1 <= '0';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
                ASYNC_IN1 <= '1';

        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
                ASYNC_IN1 <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
                ASYNC_IN1 <= '1';

        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
                ASYNC_IN1 <= '0';

        wait for 1 ps;
        clk <= '1';
                ASYNC_IN1 <= '1';

        wait for 1 ps;
        clk <= '0';
        ASYNC_IN1 <= '0';
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
  
        wait;
    end process;

end tb;


configuration cfg_tb_SINCRONIZADOR of tb_SINCRONIZADOR is
    for tb
    end for;
end cfg_tb_SINCRONIZADOR;