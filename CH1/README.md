# Desciption:  
This code includes several function to provide the main function "depth()" requirements. one can find how they work
by reading their description within code.  
depth.r  : run a test for checking correct depth for any arbitrary Directed Acyclic Graph(DAG)
 
## required libraries:
```
dequer
testthat
```

#### Prerequisites:

install required libraries in R:
```
install.packages("dequer")
install.packages("testthat")
```

#### How to run in Terminal:
```
~R
setwd("path of files")
system("ls")Prerequisites
library("dequer")
library("testthat")
test_file("depth.r")
```
after that one can follow the instructions to obtain the depths of any DAG nodes.

#### user inputs:
n    : number of nodes
src  : source node
V    : number of nodes with edges 
dest : index of nodes with edges
  
Running the code based on mentioned points one can get the result of test as it was asked 
in the challenge. To get the depth value it is just enough run :
source("depth.r")
in terminal and then "depth" in terminal to see what was the user's depth list for arbitrary DAG.

My sample DAG. NOTICE: To test for any other DAG this configuration should be changed.
 
SAMPLE DAG INPUT:

n=7
source=1
V=6
dest=1,2,3,4,5,6 # Pres [Esnter] after each digits

adj 1 = 2 -----> 2,3  #which means the first node have two adjacent 2 and 3
adj 2 = 2 -----> 3,4  
adj 3 = 1 -----> 4
adj 4 = 2 -----> 5,6
adj 5 = 1 -----> 7
adj 6 = 1 -----> 7
  
Then program construct the adjacency list of DAG and simply show the result.

for sample: depth = 0,1,1,2,3,3,4 which are depth of node 1 to 7





