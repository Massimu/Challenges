"
**********************************************************************
Project           : This code provide a function to calculate the depth
                    list of a directed acyclic graph (DAG) and test the
                    returned list with some expectations which provided 
                    by user before running the test.  

Program name      : depth.r

Author            : Meysam Esmaeilpour

Date created      : 2019-04-01

Purpose           : Test return depth of a DAG
***********************************************************************
Breadth first search algorithm is implemented here to calculate the depth list:

-BFS moving through graph and visit nodes to the end.

 Breadth First Search (BFS) is a traversing algorithm where one should start traversing from a selected
 node (source or starting node) and traverse the graph layerwise thus exploring the neighbour nodes 
 (nodes which are directly connected to source node) One must then move towards the next-level neighbour nodes.
  
 -As the name BFS suggests, it is required to traverse the graph breadthwise
  as follows:

  1- First move horizontally and visit all the nodes of the current layer.
  2- Move to the next layer.

  The distance between the nodes in layer 1 is comparitively lesser than 
  the distance between the nodes in layer 2. Therefore, in BFS, you must
  traverse all the nodes in layer 1 before you move to the nodes in layer 2.
-----------------------------------------------------------------------------
  For first three interation as an example of illustraion:

  First iteration:

    - s (source node) will be popped from the queue
    - Neighbors of s i.e. 1 and 2 will be traversed
    - 1 and 2, which have not been traversed earlier, are traversed.
      They will be:
        - Pushed in the queue
        - 1 and 2 will be marked as visited
-----------------------------------------------------------------------------
  Second iteration:

        - 1 is popped from the queue
    - Neighbors of 1 i.e. s and 3 are traversed
    - s is ignored because it is marked as 'visited'
    - 3, which has not been traversed earlier, is traversed. It is:
         -Pushed in the queue
         -Marked as visited
------------------------------------------------------------------------------
Third iteration:

    - 2 is popped from the queue
    - Neighbors of 2 i.e. s, 3, and 4 are traversed
    - 3 and s are ignored because they are marked as 'visited'
    - 4, which has not been traversed earlier, is traversed. It is:
          -Pushed in the queue

------------------------------------------------------------------------------
"
#-----------------------------------------------------------------------------
#required libraries:
"to provide a queue list for BFS algorithm:
  -This library can provide a queue which one can push back and pop 
   elements into queue list.
"
library(dequer)
"to construct a test framework
"
library(testthat)

#====================================================
#Get numeric input:
"to check whether the input is only numeric
  intput: any character could be entered as argument.
  output: the function just validate the numeric input 
           as output.
"
readnumeric <- function()
{ 
  #get the character from user
  n <- readline(prompt=)
  #check if it is not a special character like / | *& $ # @ ! ~
  if (grepl("^0[0-9]+$",n)){
    print("INVALID INPUT, PLEASE TRY A NUMBER")
    n <- readnumeric()
  }
  #check if it is not a alphabet
  n <- suppressWarnings(as.integer(n))
  if (is.na(n)){
    print("INVALID INPUT, PLEASE TRY A NUMBER")
    n <- readnumeric()
  }
  return(n)
}
#==============================================
#adjacent 
"to construct the adjacent list of all nodes considering their neighbors,
there are some rules should be considered here:
1- the number of nodes should be numeric
2- the number of edges of each node should be numeric, and lower than nodes
3- there is not any self-loop edge (because this code provided for DAG)
4- there is not any repeated adjacency element
--------------------------------------------------------------------------
HOW IT WORKS:

  -Create an empty list of lists. As the number of connected nodes of each node
   is known. the function ask user to specify it and then enter the connected nodes
   numbers to build the adjacent list.  
--------------------------------------------------------------------------
inputs: 
      -dest: an empty list constructed based on each node neighbors
      -n   : the number of nodes

output:
       -adjacent list: a list of neighbour list for each node.
"

adjacent <- function(dest,n){
  #Create a list of lists(eash node has a dest list) to store each node neighbors
  adj=rep(list(c()),n)
  #Construct the whole adjacent list for DAG.
  for(i in 1:length(dest)){
    x = dest[i]
    #filling the dest list of each node with a valid number considering the DAG
    cat("Enter the number of neighbors for",x,"th :\n")
    #check if it is not a non-numeric input
    add <- readnumeric()
    #The input should not be bigger than the node number
    while(add >= n){
      print("The number of adjacents should be lower than the nodes")
      add <- readnumeric()
    }
    #Accepting the number of neighbors of each node
    ad <- add
    #Asking the neighbor node number for each node
    print("adjs:")
    c = c()
    #filling the adj list of each node based on having the len of list from above 
    for(k in 1:ad){
      #check if it is not non-numeric
      cc <- readnumeric()
      #the adjacent node could not be zero or equal or greater than the node
      while(cc > n || cc == x || cc == 0){
        print("It is not a valid input, try again:")
        cc <- readnumeric()
      }
      #To avoid duplicate list member which does not make sense.
      if(k>1 && k<=ad){
          while((cc %in% c)){
          print("It is not a valid input, try again:")
          cc <- readnumeric()
        }
      }
      c[k] <- cc
    }
    adj[[i]] <- append(adj[[x]],c)
    
  }
  return(adj)
}
#==============================================
"
The BFS method is descibed at the begining of the code is implemented here.

INPUTS: adjacent list / source node / distance list / paths list / number of nodes.
OUTPUT: distance list (depth) filled throuh algorithm.
"
BFS <- function(adj,src,dist,paths,n){
  #assume all nodes are not visited
  visited = !as.logical(c(1:n))
  #constructing distance and path array
  dist[src] = 0
  paths[src] = 1
  #constructing a queue
  q <- queue()
  #pushing source node into queue list to start the algorithm
  pushback(q,src)
  #make the source node visited
  visited[src] = TRUE
  #start the algorithm as it is described for each iteration
  #start with source node in queue list
  while(!length(q)==0 ){
    curr = pop(q)
    temp = adj[[curr]]
    #looking for connected node for the last node in queue list
    if(!is.null(temp)){
      for( i in 1:length(temp) ){
        x = temp[i]
        if(visited[x] == FALSE){
          #adding visited node to queue list for further layers of DAG
          pushback(q,x)
          visited[x] = TRUE
        }
        #Updating the distance and path list at each iteration
        if(dist[x] > dist[curr] + 1){
          dist[x] = dist[curr] + 1
          paths[x] = paths[curr]
        }else if(dist[x]== dist[curr]+1)
        {
          paths[x] = paths[x] + paths[curr]
        }
      }
    }else break
    
  }
  return(dist)
}
#====================================================
#Find shortest path:
"Creating:
a list for sotring shortest path
a list for string path
applying BFS method
returning depth values for each node with respect to source

inputs: adjacent list / source node / number of nodes
output: BFS output which is a list as the depth of  of DAG nodes.
"

FindShortestPath <- function(adj,src,n){
  #definging depth and path list
  dist  = rep(c(Inf),n) 
  paths = rep(c(0),n)
  #apply BFS to return the depth of DAG
  sp    = BFS(adj, src, dist, paths, n)
  
  return(sp)
}

#====================================================
#main
cat("This program is implemented to provide a data structure of DAG to test\n
    the result in a TDD simple framework prepared within another code.\n
    Here user is asked to determine the number of nodes of his/her DAG\n
    and also the srouce node. In addition to provide a better adjacency list user\n
    should insert the list of nodes which have directed edges.Then program calculate\n
    the depth of each node in a sequence which could be compare with user's expectations\n
    using the test framework. Enjot it ... \n\n")

depth <- function(){
  print("the number of nodes to provide a DAG:")
  n <- readnumeric()
  print("Which node is the source?: ")
  src <- readnumeric()
  print("How many Vertices have directed edge(s)?:")
  v <- readnumeric()
  dest = c()
  print("Enter their indexes respectively: ")
  #To make a list without duplicate member
  i=1
  while(TRUE){
    while(TRUE){
      temp = readnumeric()
      if(!(temp %in% dest)){
        dest[i] = temp
        break
      }
      else
        print("Invalid input, same vertices are not allowed to enter!!")
    
    }
    i = i+1
    if(i>v)
      break
}
   
  #constructing the adjacency list
  adj<- adjacent(dest,n)
  #calculating the sequence of the depth for each node.
  d <- FindShortestPath(adj,src,n)
  return(d)
}
#==========================================
#Here the returned depth list will be tested using a test structure
#Result:
depth <- depth()
d <- depth

#==========================================
#Test structure:
test_that("Shortest path test", {
  #getting the function output
  dep <- depth
  #change the expected result for any defined DAG.
  #Here I just inset my desired values for described DAG in README.txt file.
  #one sould modify the argument of the test considering defined DAG
  expect_that( length(dep), equals(7) )
  expect_equal(dep,c(0,1,1,2,3,3,4)) # whole graph depth list which should be modified each time.
  expect_equal(dep[1],0)             # source node
  expect_equal(dep[2],1)             # second node
  
})

