#Description of the second challenge.

the package includes required file to run a server with \foo and \bar responses.

Steps:

1: open a terminal at the path of files and enter :

node -v  : to get the version of node

npm -v   : to get the version of node package manager

2: update the used packages using below command in terminal:

npm update

3: Run the server by defining an arbitrary port and url (in my code) and run the index.js:


 export PORT=8889;export BASE_URL="test";node index.js   (port:8889 and url:test)

4: Testing the server in browser. Open a browser and:


localhost:8889/test/foo -------> {"msg":"Hello"}

and simply change foo to bar to get {"msg":"World"}

