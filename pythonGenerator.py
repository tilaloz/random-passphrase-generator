# -*- coding: utf-8 -*-
"""
Created on Wed Oct 30 14:12:08 2019

@author: Owner
"""

import numpy as np
import pickle
from tkinter import filedialog
from tkinter import *

root = Tk()
root.filename  =  filedialog.askopenfilename(
        initialdir = ".",
        title = "Select a dictionary file",
        filetypes = (("txt files","*.txt"),("all files","*.*")))

print (root.filename)


r = ['q','w','e','r','t','a','s','d','f','g','z','x','c','v','b']
l = ['p','o','i','u','y','l','k','j','h','m','n','b']
#def Pickle_from_file(file):
f = open(root.filename, 'r')

#f = open(file, 'r')
flist = [line.replace('\n','') for line in f.readlines()]
print(flist)
    

#if __name__ == '__main__':
#    Pickle_from_file('google-10000-english-usa-no-swears.txt')
