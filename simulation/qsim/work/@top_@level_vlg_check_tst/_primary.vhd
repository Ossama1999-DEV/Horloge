library verilog;
use verilog.vl_types.all;
entity Top_Level_vlg_check_tst is
    port(
        seg_h1          : in     vl_logic_vector(6 downto 0);
        seg_h2          : in     vl_logic_vector(6 downto 0);
        seg_m1          : in     vl_logic_vector(6 downto 0);
        seg_m2          : in     vl_logic_vector(6 downto 0);
        seg_s1          : in     vl_logic_vector(6 downto 0);
        seg_s2          : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Top_Level_vlg_check_tst;
