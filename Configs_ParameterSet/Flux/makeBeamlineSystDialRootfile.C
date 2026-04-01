std::vector<std::string> GetNuMIBeamlineFluxSYstKnobNames();

void makeBeamlineSystDialRootfile()
{

  std::vector<std::string> detNames = GetNuMIBeamlineFluxSYstKnobNames();

  const unsigned int NKnob = detNames.size();

  // Make the covariance matrix: ((0,1), (1,0))
  TFile *file = new TFile("gundaminput_numibeamlinesyst.root","RECREATE");
  file->cd();

  TMatrixTSym<double> numibeamlinesyst_cov(NKnob);
  for (int i = 0; i < NKnob; i++) {
    numibeamlinesyst_cov(i, i) = 1.0;
  }
  numibeamlinesyst_cov.Write("numibeamlinesyst_cov");

  TObjArray numibeamlinesyst_param_names;
  for(const auto& name: detNames){
    numibeamlinesyst_param_names.Add( new TObjString(name.c_str()) );
    std::cout << "@@ Wrigin " << name << std::endl;
  }
  file->WriteObjectAny( &numibeamlinesyst_param_names, "TObjArray", "numibeamlinesyst_param_names" );

  TVectorD numibeamlinesyst_param_prior(NKnob);
  TVectorD numibeamlinesyst_param_lb(NKnob);
  TVectorD numibeamlinesyst_param_ub(NKnob);
  for(int i=0; i<NKnob; i++){
    numibeamlinesyst_param_prior[i] = 0.;
    numibeamlinesyst_param_lb[i] = -3.;
    numibeamlinesyst_param_ub[i] = +3.;
  }
  numibeamlinesyst_param_prior.Write("numibeamlinesyst_param_prior");
  numibeamlinesyst_param_lb.Write("numibeamlinesyst_param_lb");
  numibeamlinesyst_param_ub.Write("numibeamlinesyst_param_ub");

  file->Close();
}

std::vector<std::string> GetNuMIBeamlineFluxSYstKnobNames(){

  return {
/*
"beam_div",
"beam_power",
//"beam_shift_y_minus",
//"beam_shift_y_plus",
"beam_shift_x",
"beam_shift_y",
"beam_spot",
"horn1_x",
"horn1_y",
"horn_current_plus",
"water_layer"
*/

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
//"numi_beam_G3Chase",
  };


}
