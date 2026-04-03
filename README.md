  
# gundam-configs-multiproton  
  
## Samples and observables  
Fits use three samples:  
    "signal"        -- (CutType==0)  
    "1pNpisideband" -- (CutType==1)  
    "2pNpisideband" -- (CutType==2)  
The "XpNpisideband" lables are somewhat of a misnomer, they really select for events with 1 charged pion  
  
Configs are available for six observables:  
    "HadronicOpeningAngle" -- Cosine of the opening angle between leading two protons; NOTE this is undefined for the 1pNpi sideband so "ProtonPionAngle" is used instead (Unitless)  
    "MuonHadronAngle"      -- Cosine of the opening angle between the muon momentum vector and the vector sum of the hadron pair (Unitless)  
    "DeltaPT"              -- Single-transverse momentum imbalance (GeV/c)  
    "DeltaPTT"             -- Double-transverse momentum imbalance (GeV/c)  
    "DeltaPhiT"            -- Transverse opening angle (radians)  
    "DeltaAlphaT"          -- Transverse boosting angle (radians)  
All observables are defined with respect to the muon and leading two protons or for the 1pNpi sideband with respect to the muon, the proton, and the pion  
Corresponding truth variables in the tree are all named "TrueX" for reco variable X  
  
### A Note on On-Off systematics and config files labelled "\_XY" for X=0,1 and Y=0,1  
Two highly relevant on-off model switch systematics are always set to discrete values of 0 or 1 during the fit: "DecayAngMEC" and "ThetaDelta2Npi"  
For "\_XY" configs, X gives the value of "DecayAngMEC", and Y is the value of "ThetaDelta2Npi"  
Config files without these lables all have X=0 and Y=0  
To get a final result, we plan to perform fits for all four permutations, take the best fit as the result, reject fits with a DeltaChi2 > 1, and take the remaining spread as an additional uncertainty  
  

