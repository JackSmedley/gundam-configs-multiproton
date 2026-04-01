import os

NuMIBeamlineFluxSYstKnobNames = [
#"beam_div",
#"beam_power",
##"beam_shift_y_minus",
##"beam_shift_y_plus",
#"beam_shift_y",
#"beam_shift_x",
#"beam_spot",
#"horn1_x",
#"horn1_y",
#"horn_current_plus",
#"water_layer"

"HornCurr",
"Horn1_x",
"Horn1_y",
"Beam_spot",
"Horn2_x",
"Horn2_y",
"Horns_water",
"Beam_shift_x",
"Beam_shift_y",
"Target_z",
#"numi_beam_G3Chase",
]

NuMIHPFluxSYstKnobNames = [ "flux_PCA_" + str(i) for i in range(98) ]

