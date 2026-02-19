library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_register is
end tb_register;

architecture sim of tb_register is

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal en  : std_logic := '0';
    signal d   : unsigned(3 downto 0) := "0000";
    signal q   : unsigned(3 downto 0);

begin

    uut: entity work.point_register
        port map(
            clk => clk,
            rst => rst,
            en  => en,
            d   => d,
            q   => q
        );

    clk <= not clk after 10 ns;

    process
    begin
        rst <= '1';
        wait for 25 ns;
        rst <= '0';

        d  <= "0111";
        en <= '1';
        wait for 20 ns;

        d <= "1010";
        wait for 20 ns;

        en <= '0';
        d  <= "1111";
        wait for 40 ns;

        en <= '1';
        d  <= "0101";
        wait for 20 ns;

        rst <= '1';
        wait for 15 ns;
        rst <= '0';

        d <= "1101";
        en <= '1';
        wait for 20 ns;

        wait;
    end process;

end sim;
