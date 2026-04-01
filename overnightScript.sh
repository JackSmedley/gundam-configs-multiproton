echo "Fitter"
gundamFitter -c fitConfig_DeltaPT.yaml -o $OUT/fit/asimovSignalNoMaxP_DeltaPT.root

echo "Prefit toy gen"
gundamToyGenerator -c toyGeneratorConfig_DeltaPT.yaml -f $OUT/fit/asimovSignalNoMaxP_DeltaPT.root -s 1 -n 10000 -o $OUT/toy/asimovSignalNoMaxP_DeltaPT_preFit.root --use-prefit

echo "Postfit toy gen"
gundamToyGenerator -c toyGeneratorConfig_DeltaPT.yaml -f $OUT/fit/asimovSignalNoMaxP_DeltaPT.root -s 1 -n 10000 -o $OUT/toy/asimovSignalNoMaxP_DeltaPT_postFit.root

echo "XSec calc"
gundamCalcXsec -c xsecConfig_DeltaPT.yaml -f $OUT/fit/asimovSignalNoMaxP_DeltaPT.root -s 1 -n 10000 -o $OUT/xsec/asimovSignalNoMaxP_DeltaPT_xsec.root

