library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_dice_counter is
end tb_dice_counter;

architecture sim of tb_dice_counter is

    signal clk : std_logic := '0';
    signal rst : std_logic := '0';
    signal en  : std_logic := '0';
    signal q   : unsigned(2 downto 0);

begin

    uut: entity work.dice_counter
        port map (
            clk => clk,
            rst => rst,
            en  => en,
            q   => q
        );

    clk <= not clk after 10 ns;

    rst <= '1', '0' after 20 ns;   

    en <= '0',
          '1' after 30 ns,
          '0' after 280 ns;
end sim;
