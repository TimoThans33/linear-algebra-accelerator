library verilog;
use verilog.vl_types.all;
entity sincos_cordic is
    port(
        areset          : in     vl_logic;
        clk             : in     vl_logic;
        a               : in     vl_logic_vector(34 downto 0);
        c               : out    vl_logic_vector(33 downto 0);
        s               : out    vl_logic_vector(33 downto 0)
    );
end sincos_cordic;
