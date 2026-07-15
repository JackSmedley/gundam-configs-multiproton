import os
import argparse
from glob import glob

#Copy the fit, toy generator, and xsec configs from the source variable to the target variable 
def main(target, source):
    assert(target != None)

    source_files = glob(f'*{source}*')
    for source_file in source_files:
        target_file = source_file.replace(source, target)
        print(f'Copying {source_file} to {target_file}')

        with open(source_file, 'r') as file:
            lines = file.read()
            lines = lines.replace(source, target)
    
        with open(target_file, 'w') as file:
            file.write(lines)

    return

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--target', default=None, type=str,
                        help='''Which variable to copy to, default None''')
    parser.add_argument('--source', default='HadronicOpeningAngle', type=str,
                        help='''Which variable to copy from, default HadronicOpeningAngle''')
    args = parser.parse_args()
    main(**vars(args))
