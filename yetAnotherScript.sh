echo "Fitter"
gundamFitter -c fitConfig_DeltaAlphaT.yaml -o $OUT/fit/asimovSignalNoMaxP_DeltaAlphaT.root

echo "Prefit toy gen"
gundamToyGenerator -c toyGeneratorConfig_DeltaAlphaT.yaml -f $OUT/fit/asimovSignalNoMaxP_DeltaAlphaT.root -s 1 -n 10000 -o $OUT/toy/asimovSignalNoMaxP_DeltaAlphaT_preFit.root --use-prefit

echo "Postfit toy gen"
gundamToyGenerator -c toyGeneratorConfig_DeltaAlphaT.yaml -f $OUT/fit/asimovSignalNoMaxP_DeltaAlphaT.root -s 1 -n 10000 -o $OUT/toy/asimovSignalNoMaxP_DeltaAlphaT_postFit.root

echo "XSec calc"
gundamCalcXsec -c xsecConfig_DeltaAlphaT.yaml -f $OUT/fit/asimovSignalNoMaxP_DeltaAlphaT.root -s 1 -n 10000 -o $OUT/xsec/asimovSignalNoMaxP_DeltaAlphaT_xsec.root

