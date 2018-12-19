Desciption:

#required libraries:

dequer
testthat

FILE:
-------
depth.r  : run a test for checking correct depth for any arbitrary Directed Acyclic Graph(DAG)
-------

This code includes several function to provide the main function "depth()" requirements. one can find how they work
by reading their description within code.

How to run:

setwd("path of files")
system("ls")
library(dequer)
library(testthat)
test_file("depth.r")

after that user can follow the instructions to obtain the depths of any DAG nodes.

user inputs:

n    : number of nodes
src  : source node
V    : number of nodes with edges 
dest : index of nodes with edges
===============================================================================
for the first run the test is set to check my sample DAG. To test for any other DAG this configuration should be changed.
 
SAMPLE DAG INPUT:

n=7
source=1
V=6
dest=1,2,3,4,5,6 # , means [Enter]

adj 1 = 2 -----> 2,3  #which means the first node have two adjacent 2 and 3
adj 2 = 2 -----> 3,4  
adj 3 = 1 -----> 4
adj 4 = 2 -----> 5,6
adj 5 = 1 -----> 7
adj 6 = 1 -----> 7
  
Then program construct the adjacency list of DAG and simply show the result.

for sample: depth = 0,1,1,2,3,3,4 which are depth of node 1 to 7

Test part:

To test the depth for arbitrary nodes all whole DAG. it is just enough to execute the code. One should modify
the test before run for his/her own DAG. 



