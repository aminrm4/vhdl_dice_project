library ieee;
use ieee.std_logic_1164.all;

entity tb_craps_system is
end tb_craps_system;

architecture sim of tb_craps_system is
    signal clk       : std_logic := '0';
    signal reset_btn : std_logic := '0';
    signal roll_btn  : std_logic := '0';
    signal seg_die1  : std_logic_vector(6 downto 0);
    signal seg_die2  : std_logic_vector(6 downto 0);
    signal win_led   : std_logic;
    signal lose_led  : std_logic;
begin
    uut : entity work.craps_system
        port map (
            clk       => clk,
            reset_btn => reset_btn,
            roll_btn  => roll_btn,
            seg_die1  => seg_die1,
            seg_die2  => seg_die2,
            win_led   => win_led,
            lose_led  => lose_led
        );

    clk <= not clk after 5 ns;

    process
    begin
        reset_btn <= '1';
        wait for 40 ns;
        reset_btn <= '0';
        wait for 30 ns;

        roll_btn <= '1';
        wait for 20 ns;
        roll_btn <= '0';
        wait for 80 ns;

        reset_btn <= '1';
        wait for 30 ns;
        reset_btn <= '0';
        wait for 30 ns;

        roll_btn <= '1';
        wait for 12 ns;
        roll_btn <= '0';
        wait for 60 ns;

        roll_btn <= '1';
        wait for 22 ns;
        roll_btn <= '0';
        wait for 80 ns;

        reset_btn <= '1';
        wait for 30 ns;
        reset_btn <= '0';
        wait for 30 ns;

        roll_btn <= '1';
        wait for 35 ns;
        roll_btn <= '0';
        wait for 60 ns;

        roll_btn <= '1';
        wait for 28 ns;
        roll_btn <= '0';
        wait for 80 ns;

        reset_btn <= '1';
        wait for 30 ns;
        reset_btn <= '0';
        wait for 30 ns;


        roll_btn <= '1';
        wait for 12 ns;
        roll_btn <= '0';
        wait for 60 ns;

        roll_btn <= '1';
        wait for 22 ns;
        roll_btn <= '0';
        wait for 50 ns;

        roll_btn <= '1';
        wait for 18 ns;
        roll_btn <= '0';
        wait for 80 ns;

        reset_btn <= '1';
        wait for 30 ns;
        reset_btn <= '0';
        wait for 100 ns;

        wait;
    end process;
end sim;
