import os

lines = open('log.txt').readlines()

for line in lines:
  words = line.split(',')
  Status = words[-2].replace(' ','')
  if Status=="Fixed":
    ParamNum = words[1].replace(' ','')
    out = '      if( _globalCovParList_[iGlobPar]->getFullTitle() == "Flux Systematics HP/%s" ){ continue; }'%(ParamNum)
    print(out)
