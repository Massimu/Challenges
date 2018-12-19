#required libraries:
"to provide a queue list for BFS alorithm"
library(dequer)
"to construct a test framework"
library(testthat)

#====================================================
#Get numeric input:
"to check whether an input is numeric"
readnumeric <- function()
{ 
  n <- readline(prompt=)
  if (grepl("^0[0-9]+$",n)){
    print("INVALID INPUT, PLEASE TRY A NUMBER")
    n <- readnumeric()
  }
  n <- suppressWarnings(as.integer(n))
  if (is.na(n)){
    print("INVALID INPUT, PLEASE TRY A NUMBER")
    n <- readnumeric()
  }
  return(n)
}
#==============================================
#adjacent 
"to construct the adjacent list of all nodes based on their neighbors
there are some rules should be considered here:
1- the number of nodes should be numeric
2- the number of edges of each node should be numeric, and lower than nodes
3- there is not any self-loop edge
4- there is not any repeated adjacency element
"
adjacent <- function(dest,n){
  adj=rep(list(c()),n)
  for(i in 1:length(dest)){
    x = dest[i]
    cat("Enter the number of neighbors for",x,"th :\n")
    add <- readnumeric()
    while(add >= n){
      print("The number of adjacents should be lower than the nodes")
      add <- readnumeric()
    }
    ad <- add
    print("adjs:")
    c = c()
    for(k in 1:ad){
      cc <- readnumeric()
      while(cc > n || cc == x || cc == 0){
        print("It is not a valid input, try again:")
        cc <- readnumeric()
      }
      if(k>1 && k<=ad){
        while(cc==c[k-1]){
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
#Breadth first search algorithm:
"besd in BFS known algorithm, moving through graph and visit nodes to the end"

BFS <- function(adj,src,dist,paths,n){
  visited = !as.logical(c(1:n))
  dist[src] = 0
  paths[src] = 1
  q <- queue()
  pushback(q,src)
  visited[src] = TRUE
  while(!length(q)==0 ){
    curr = pop(q)
    temp = adj[[curr]]
    if(!is.null(temp)){
      for( i in 1:length(temp) ){
        x = temp[i]
        if(visited[x] == FALSE){
          pushback(q,x)
          visited[x] = TRUE
        }
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
"

FindShortestPath <- function(adj,src,n){
  dist  = rep(c(Inf),n) 
  paths = rep(c(0),n)
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
  print("Which node should be the source?: ")
  src <- readnumeric()
  print("Enter the number of Vertices which have directed edge")
  v <- readnumeric()
  dest = c()
  print("Enter them respectively: ")
  for(i in 1:v){
    dest[i] = readnumeric()
  }
  #constructing the adjacency list
  adj<- adjacent(dest,n)
  #calculating the sequence of the depth for each node.
  d <- FindShortestPath(adj,src,n)
  return(d)
}
#==========================================
#Result:
depth <- depth()

#==========================================
#Test structure:
test_that("Shortest path test", {
  #getting the function output
  dep <- depth
  #change the expected result for any defined DAG.
  expect_that( length(dep), equals(7) )
  expect_equal(dep,c(0,1,1,2,3,3,4)) # whole graph
  expect_equal(dep[1],0)             # source node
  expect_equal(dep[2],1)             # second node
  
})

