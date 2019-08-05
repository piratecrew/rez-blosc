# -*- coding: utf-8 -*-

name = 'blosc'

version = '1.17.0'

authors = ['Blosc Development Team']

variants = [["platform-linux"]]

def commands():
    env.LD_LIBRARY_PATH.prepend("{root}/lib")
    if building:
        env.CMAKE_MODULE_PATH.append("{root}/cmake")