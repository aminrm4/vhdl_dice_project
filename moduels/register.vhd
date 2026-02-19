library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity point_register is
    port (
        clk : in  std_logic;
        rst : in  std_logic;
        en  : in  std_logic;
        d   : in  unsigned(3 downto 0);
        q   : out unsigned(3 downto 0)
    );
end point_register;

architecture behavioral of point_register is
begin

    process(clk, rst)
    begin
        if rst = '1' then
            q <= "0000";
        elsif rising_edge(clk) then
            if en = '1' then
                q <= d;
            end if;
        end if;
    end process;

end behavioral;
