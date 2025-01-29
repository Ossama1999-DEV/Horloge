library verilog;
use verilog.vl_types.all;
entity cpt_dcpt is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        dh              : in     vl_logic_vector(3 downto 0);
        uh              : in     vl_logic_vector(3 downto 0);
        dm              : in     vl_logic_vector(3 downto 0);
        um              : in     vl_logic_vector(3 downto 0);
        start           : in     vl_logic;
        mode            : in     vl_logic;
        alarme          : out    vl_logic;
        h1              : out    vl_logic_vector(3 downto 0);
        h2              : out    vl_logic_vector(3 downto 0);
        m1              : out    vl_logic_vector(3 downto 0);
        m2              : out    vl_logic_vector(3 downto 0);
        s1              : out    vl_logic_vector(3 downto 0);
        s2              : out    vl_logic_vector(3 downto 0)
    );
end cpt_dcpt;
