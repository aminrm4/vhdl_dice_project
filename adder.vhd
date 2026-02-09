library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
    port(a,b: in unsigned(2 downto 0); s: out unsigned(3 downto 0));
end adder;

architecture behavioral of adder is
begin
    s <= resize(a,4) + resize(b,4);
end behavioral;
