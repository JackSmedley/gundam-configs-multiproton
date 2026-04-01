bool checkForHesse(TString path) {
  TFile infile(path);
  return ( infile.GetDirectory("FitterEngine/postFit/Hesse") );
}

