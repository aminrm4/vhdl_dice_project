library ieee;
use ieee.std_logic_1164.all;
entity tb_controller_fsm is
end tb_controller_fsm;

architecture sim of tb_controller_fsm is
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal roll_btn : std_logic := '0';
    signal d7       : std_logic := '0';
    signal d711     : std_logic := '0';
    signal d2312    : std_logic := '0';
    signal eq       : std_logic := '0';
    signal roll     : std_logic;
    signal sp       : std_logic;
    signal win      : std_logic;
    signal lose     : std_logic;
    signal show     : std_logic;
begin
    uut : entity work.controller_fsm
        port map (
            clk      => clk,
            reset    => reset,
            roll_btn => roll_btn,
            d7       => d7,
            d711     => d711,
            d2312    => d2312,
            eq       => eq,
            roll     => roll,
            sp       => sp,
            win      => win,
            lose     => lose,
            show     => show
        );

    clk <= not clk after 5 ns;

    process
    begin
        d7       <= '0';
        d711     <= '0';
        d2312    <= '0';
        eq       <= '0';
        roll_btn <= '0';
        reset    <= '1';
        wait for 30 ns;
        reset    <= '0';
        wait for 20 ns;

        roll_btn <= '1';
        wait for 40 ns;
        d711 <= '1';
        wait for 10 ns;
        roll_btn <= '0';
        wait for 40 ns;
        d711 <= '0';
        wait for 20 ns;

        reset    <= '1';
        wait for 20 ns;
        reset    <= '0';
        wait for 20 ns;
        roll_btn <= '1';
        wait for 40 ns;
        d2312 <= '1';
        wait for 10 ns;
        roll_btn <= '0';
        wait for 40 ns;
        d2312 <= '0';
        wait for 20 ns;

        reset    <= '1';
        wait for 20 ns;
        reset    <= '0';
        wait for 20 ns;
        roll_btn <= '1';
        wait for 40 ns;
        roll_btn <= '0';
        wait for 60 ns;
        roll_btn <= '1';
        wait for 40 ns;
        d7 <= '1';
        wait for 10 ns;
        roll_btn <= '0';
        wait for 40 ns;
        d7 <= '0';
        wait for 20 ns;

        reset    <= '1';
        wait for 20 ns;
        reset    <= '0';
        wait for 20 ns;
        roll_btn <= '1';
        wait for 40 ns;
        roll_btn <= '0';
        wait for 60 ns;
        roll_btn <= '1';
        wait for 40 ns;
        eq <= '1';
        wait for 10 ns;
        roll_btn <= '0';
        wait for 40 ns;
        eq <= '0';
        wait for 20 ns;

        reset    <= '1';
        wait for 20 ns;
        reset    <= '0';
        wait for 20 ns;
        roll_btn <= '1';
        wait for 40 ns;
        roll_btn <= '0';
        wait for 60 ns;
        roll_btn <= '1';
        wait for 40 ns;
        roll_btn <= '0';
        wait for 40 ns;
        roll_btn <= '1';
        wait for 40 ns;
        eq <= '1';
        wait for 10 ns;
        roll_btn <= '0';
        wait for 40 ns;
        eq <= '0';
        wait for 20 ns;

        reset    <= '1';
        wait for 20 ns;
        reset    <= '0';
        wait for 20 ns;
        roll_btn <= '1';
        wait for 40 ns;
        roll_btn <= '0';
        wait for 60 ns;
        roll_btn <= '1';
        wait for 40 ns;
        roll_btn <= '0';
        wait for 40 ns;
        roll_btn <= '1';
        wait for 40 ns;
        d7 <= '1';
        wait for 10 ns;
        roll_btn <= '0';
        wait for 40 ns;
        d7 <= '0';
        wait for 20 ns;

        reset    <= '1';
        wait for 20 ns;
        reset    <= '0';
        wait for 20 ns;
        roll_btn <= '1';
        wait for 20 ns;
        d711 <= '1';
        wait for 10 ns;
        roll_btn <= '0';
        wait for 40 ns;
        d711 <= '0';
        roll_btn <= '1';
        wait for 40 ns;
        roll_btn <= '0';
        wait for 20 ns;
        reset <= '1';
        wait for 20 ns;
        reset <= '0';
        wait for 20 ns;

        wait;
    end process;
end sim;
