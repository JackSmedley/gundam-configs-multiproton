echo "Fitter"
#gundamFitter -c fitConfig_HadronicOpeningAngle_00.yaml -o $OUT/fit/Theta_Delta2Npi00_HadronicOpeningAngle.root

echo "Prefit toy gen"
#gundamToyGenerator -c toyGeneratorConfig_HadronicOpeningAngle_00.yaml -f $OUT/fit/Theta_Delta2Npi00_HadronicOpeningAngle.root -s 1 -n 10000 -o $OUT/toy/Theta_Delta2Npi00_HadronicOpeningAngle_preFit.root --use-prefit

echo "Postfit toy gen"
gundamToyGenerator -c toyGeneratorConfig_HadronicOpeningAngle_00.yaml -f $OUT/fit/Theta_Delta2Npi00_HadronicOpeningAngle.root -s 1 -n 10000 -o $OUT/toy/Theta_Delta2Npi00_HadronicOpeningAngle_postFit.root

echo "XSec calc"
gundamCalcXsec -c xsecConfig_HadronicOpeningAngle_00.yaml -f $OUT/fit/Theta_Delta2Npi00_HadronicOpeningAngle.root -s 1 -n 10000 -o $OUT/xsec/Theta_Delta2Npi00_HadronicOpeningAngle_xsec.root

