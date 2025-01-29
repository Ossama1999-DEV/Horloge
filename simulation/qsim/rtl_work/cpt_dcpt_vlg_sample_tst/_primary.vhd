library verilog;
use verilog.vl_types.all;
entity cpt_dcpt_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        dh              : in     vl_logic_vector(3 downto 0);
        dm              : in     vl_logic_vector(3 downto 0);
        enable          : in     vl_logic;
        mode            : in     vl_logic;
        reset           : in     vl_logic;
        start           : in     vl_logic;
        uh              : in     vl_logic_vector(3 downto 0);
        um              : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end cpt_dcpt_vlg_sample_tst;
