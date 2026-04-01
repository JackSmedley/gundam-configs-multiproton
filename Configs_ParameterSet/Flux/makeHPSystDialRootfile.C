std::vector<std::string> GetNuMIHPFluxSYstKnobNames();

void makeHPSystDialRootfile()
{

  std::vector<std::string> detNames = GetNuMIHPFluxSYstKnobNames();

  const unsigned int NKnob = detNames.size();

  // Make the covariance matrix: ((0,1), (1,0))
  TFile *file = new TFile("gundaminput_numiHPsyst.root","RECREATE");
  file->cd();

  TMatrixTSym<double> numiHPsyst_cov(NKnob);
  for (int i = 0; i < NKnob; i++) {
    numiHPsyst_cov(i, i) = 1.0;
  }
  numiHPsyst_cov.Write("numiHPsyst_cov");

  TObjArray numiHPsyst_param_names;
  for(const auto& name: detNames){
    numiHPsyst_param_names.Add( new TObjString(name.c_str()) );
    std::cout << "@@ Wrigin " << name << std::endl;
  }
  file->WriteObjectAny( &numiHPsyst_param_names, "TObjArray", "numiHPsyst_param_names" );

  TVectorD numiHPsyst_param_prior(NKnob);
  TVectorD numiHPsyst_param_lb(NKnob);
  TVectorD numiHPsyst_param_ub(NKnob);
  for(int i=0; i<NKnob; i++){
    numiHPsyst_param_prior[i] = 0.;
    numiHPsyst_param_lb[i] = -3.;
    numiHPsyst_param_ub[i] = +3.;
  }
  numiHPsyst_param_prior.Write("numiHPsyst_param_prior");
  numiHPsyst_param_lb.Write("numiHPsyst_param_lb");
  numiHPsyst_param_ub.Write("numiHPsyst_param_ub");

  file->Close();
}

std::vector<std::string> GetNuMIHPFluxSYstKnobNames(){
  std::vector<std::string> names;
  for (  int i = 0; i < 98; i++ ) names.push_back( "flux_PCA_" + std::to_string(i) );
  return names;
}
