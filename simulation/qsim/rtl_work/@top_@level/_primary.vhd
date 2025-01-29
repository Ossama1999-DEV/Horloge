library verilog;
use verilog.vl_types.all;
entity Top_Level is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        start           : in     vl_logic;
        mode            : in     vl_logic;
        dh              : in     vl_logic_vector(3 downto 0);
        uh              : in     vl_logic_vector(3 downto 0);
        dm              : in     vl_logic_vector(3 downto 0);
        um              : in     vl_logic_vector(3 downto 0);
        seg_h1          : out    vl_logic_vector(6 downto 0);
        seg_h2          : out    vl_logic_vector(6 downto 0);
        seg_m1          : out    vl_logic_vector(6 downto 0);
        seg_m2          : out    vl_logic_vector(6 downto 0);
        seg_s1          : out    vl_logic_vector(6 downto 0);
        seg_s2          : out    vl_logic_vector(6 downto 0);
        alarme          : out    vl_logic
    );
end Top_Level;
