echo "Fitter"
gundamFitter -c fitConfig_DeltaAlphaT_thirtyPercent.yaml -o $OUT/fit/thirtyPercentNoMaxP_DeltaAlphaT.root

echo "Prefit toy gen"
gundamToyGenerator -c toyGeneratorConfig_DeltaAlphaT_thirtyPercent.yaml -f $OUT/fit/thirtyPercentNoMaxP_DeltaAlphaT.root -s 1 -n 10000 -o $OUT/toy/thirtyPercentNoMaxP_DeltaAlphaT_preFit.root --use-prefit

echo "Postfit toy gen"
gundamToyGenerator -c toyGeneratorConfig_DeltaAlphaT_thirtyPercent.yaml -f $OUT/fit/thirtyPercentNoMaxP_DeltaAlphaT.root -s 1 -n 10000 -o $OUT/toy/thirtyPercentNoMaxP_DeltaAlphaT_postFit.root

echo "XSec calc"
gundamCalcXsec -c xsecConfig_DeltaAlphaT.yaml -f $OUT/fit/thirtyPercentNoMaxP_DeltaAlphaT.root -s 1 -n 10000 -o $OUT/xsec/thirtyPercentNoMaxP_DeltaAlphaT_xsec.root

