set ::env(DESIGN_NAME) lknt64_8core
set ::env(VERILOG_FILES) "$::env(DESIGN_DIR)/../../verilog/top.v"

set ::env(CLOCK_PORT) "clk"
set ::env(RESET_PORT) "reset"
set ::env(CLOCK_PERIOD) "25" ;# 40MHz

set ::env(FP_CORE_UTIL) "35"
set ::env(PL_TARGET_DENSITY) "0.45"
set ::env(ROUTING_CORES) 4
set ::env(DIODE_INSERTION_STRATEGY) 4
