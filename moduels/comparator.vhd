library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
    port(a,b: in unsigned(3 downto 0); eq: out std_logic);
end comparator;

architecture behavioral of comparator is
begin
    eq <= '1' when a=b else '0';
end behavioral;
