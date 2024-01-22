library ieee;
use ieee.std_logic_1164.all;

entity tb_DETECTOR_FLANCO is
end tb_DETECTOR_FLANCO;

architecture tb of tb_DETECTOR_FLANCO is

    component DETECTOR_FLANCO
        port (CLK      : in std_logic;
              SYNC_IN1 : in std_logic;
              EDGE1    : out std_logic;
              SYNC_IN2 : in std_logic;
              EDGE2    : out std_logic;
              SYNC_IN3 : in std_logic;
              EDGE3    : out std_logic);
    end component;

    signal CLK      : std_logic;
    signal SYNC_IN1 : std_logic;
    signal EDGE1    : std_logic;
    signal SYNC_IN2 : std_logic;
    signal EDGE2    : std_logic;
    signal SYNC_IN3 : std_logic;
    signal EDGE3    : std_logic;

begin

    dut : DETECTOR_FLANCO
    port map (CLK      => CLK,
              SYNC_IN1 => SYNC_IN1,
              EDGE1    => EDGE1,
              SYNC_IN2 => SYNC_IN2,
              EDGE2    => EDGE2,
              SYNC_IN3 => SYNC_IN3,
              EDGE3    => EDGE3);

    stimuli : process
    begin
       
        CLK <= '0';
        SYNC_IN1 <= '0';
        SYNC_IN2 <= '0';
        SYNC_IN3 <= '0';
wait for 1 ps;
        clk <= '0';
        SYNC_IN1 <= '1';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
                SYNC_IN1 <= '0';

        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
                SYNC_IN1 <= '1';

        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
                SYNC_IN1 <= '0';

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
                        SYNC_IN1 <= '1';

        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
        wait for 1 ps;
        clk <= '0';
        wait for 1 ps;
        clk <= '1';
                        SYNC_IN1 <= '0';

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


configuration cfg_tb_DETECTOR_FLANCO of tb_DETECTOR_FLANCO is
    for tb
    end for;
end cfg_tb_DETECTOR_FLANCO;