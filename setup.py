#!/usr/bin/env python3

import filecmp
import os
from os import path
import shutil

if __name__ == '__main__':
    real_home = path.abspath(os.getenv('HOME'))
    os.chdir('HOME')
    for root, dirs, files in os.walk('.'):
        for f in files:
            dst = path.abspath(path.join(real_home, root, f))
            src = path.abspath(path.join(root, f))
            if os.access(dst, os.F_OK):
                if path.islink(dst):
                    if os.readlink(dst) == src:
                        # already exists
                        continue
                else:
                    if not filecmp.cmp(dst, src):
                        # backup
                        shutil.copyfile(dst, dst+'.bak')
                # safe to delete
                os.remove(dst)
            dst_dir = os.path.dirname(dst)
            if not os.path.isdir(dst_dir):
                os.makedirs(dst_dir)
            os.symlink(src, dst)
            print('%s -> %s' % (dst, src))
