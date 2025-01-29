library verilog;
use verilog.vl_types.all;
entity cpt_dcpt_vlg_check_tst is
    port(
        alarme          : in     vl_logic;
        h1              : in     vl_logic_vector(3 downto 0);
        h2              : in     vl_logic_vector(3 downto 0);
        m1              : in     vl_logic_vector(3 downto 0);
        m2              : in     vl_logic_vector(3 downto 0);
        s1              : in     vl_logic_vector(3 downto 0);
        s2              : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end cpt_dcpt_vlg_check_tst;
