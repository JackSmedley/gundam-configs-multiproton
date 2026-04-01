void print_graphs(){

  TFile *f = new TFile("/pnfs/icarus/persistent/users/jskim/NuMINumuXSec/NuMIXSec/v09_75_03/NuMICommonArea_230905_TruthVar/Tree/GUNDAM/TSpline/MakeTree_NuMI_MC_Nu_Phase2_GENIESystSGV2_FixFSI.root");
  TTree *t = (TTree *)f->Get("AllSamples_FillTree/selectedEvents_NSigmas");

  TSpline3 *spl = 0;
  t->SetBranchAddress("FrCEx_pi", &spl);

  for(int i=0; i<10; i++){
    t->GetEntry(i);
    std::cout << "=====================" << std::endl;
    printf("%d-th entry\n",i);
    for(int z=-3; z<=3; z++){
      std::cout << z << "\t" << spl->Eval(z) << std::endl;
    }
  }
  


}
