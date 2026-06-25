#!/bin/bash

declare -a combos=("" "_01" "_10" "_11")

for combo in "${combos[@]}"
do

  ###NEED THIS BECAUSE ROOT CAN ONLY EXPAND ONE VARIABLE
  export fitOut="${OUT}/fit/thirtyPercent${combo}_${1}.root"
  
  ###COMMANDS TO RUN
  fitCommand="gundamFitter -c fitConfig_$1_thirtyPercent${combo}.yaml -o $fitOut"
  preFitToyCommand="gundamToyGenerator -c toyGeneratorConfig_$1_thirtyPercent${combo}.yaml -f $fitOut -s 1 -n 10000 -o $OUT/toy/thirtyPercent${combo}_$1_preFit.root --use-prefit"
  postFitToyCommand="gundamToyGenerator -c toyGeneratorConfig_$1_thirtyPercent${combo}.yaml -f $fitOut -s 1 -n 10000 -o $OUT/toy/thirtyPercent${combo}_$1_postFit.root"
  xsecCommand="gundamCalcXsec -c xsecConfig_$1.yaml -f $fitOut -s 1 -n 10000 -o $OUT/xsec/thirtyPercent${combo}_$1_xsec.root"
  
  echo "Running sequence for Variable: $1 and Sample: thirtyPercent${combo}"
  
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
  
  ###ELSE QUIT
  else
    echo -e "\033[0;31m!!! Minimization did not converge !!!\033[0m"
  fi  

done
