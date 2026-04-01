#!/bin/bash

###NEED THIS BECAUSE ROOT CAN ONLY EXPAND ONE VARIABLE
export fitOut="${OUT}/fit/${2}_${1}.root"

###COMMANDS TO RUN
fitCommand="gundamFitter -c fitConfig_$1.yaml -o $fitOut"
preFitToyCommand="gundamToyGenerator -c toyGeneratorConfig_$1.yaml -f $fitOut -s 1 -n 10000 -o $OUT/toy/$2_$1_preFit.root --use-prefit"
postFitToyCommand="gundamToyGenerator -c toyGeneratorConfig_$1.yaml -f $fitOut -s 1 -n 10000 -o $OUT/toy/$2_$1_postFit.root"
xsecCommand="gundamCalcXsec -c xsecConfig_$1.yaml -f $fitOut -s 1 -n 10000 -o $OUT/xsec/$2_$1_xsec.root"
#xsecCommandClosureTest="gundamCalcXsec -c xsecConfig_$1.yaml -f $fitOut -s 1 -n 10000 -o $OUT/xsec/$2ClosureTest_$1_xsec.root --use-bf-as-xsec --TurnRecoOnlyOff"

echo "Running sequence for Variable: $1 and Sample: $2"

###DEBUG
#echo $fitCommand
#echo $preFitToyCommand
#echo $postFitToyCommand
#echo $xsecCommand

###RUN FIT
$fitCommand
$preFitToyCommand

if root -q -l 'checkForHesse.C("$fitOut")' | grep -q "true"

###RUN THE REST IF FIT CONVERGED
then
  $postFitToyCommand
  $xsecCommand
#  $xsecCommandClosureTest

###ELSE QUIT
else
  echo -e "\033[0;31m!!! Minimization did not converge !!!\033[0m"
fi

