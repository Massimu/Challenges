# Description:  
providing index.js and routines.js to have a server at desire URL and PORT with specific responses.  
The project includes three sections. The first one was constructing a package.json file to get 
requirements. The second and third parts were providing index.js and routes.js files. 
  
 Having this three file one can skip the following step and just run the index.js file to get the
 result which is nothing except a running server.  
    
Here I describe the package.json file!  

#### Steps for creating the pachage.json file:
After installing nodejs on operating system.  
##### 1: open a terminal at the path of files and enter:  

node -v  : to get the version of node  

npm -v   : to get the version of node package manager 

```
npm init
```
to construct "package.json" file for the project. It will ask user to insert some user-depend details related to  
 the project such as: name, authur, version, and so on. After that, user will be ask to save the file. To get the  
  "express" framework which is necessary for this project, user should enter the bwlow command in terminal:  
```
npm install express --save
```
Now, one can check the package.json file and see the "express" framework is added to it. another package file and module  
folder will be created at this level. Having this files one can run the index.js.  
##### 2: index.js and routes.js
routes.js: to call the framework, set the user basic url and construct the messages for different states.  
index.js : to call the routes.js, set the user port, run server, and send responses through it.  
Both of these file are decribed in their scripts.  

## To run:
Having index.js, routes.js, and package.json file one can follow below instructions to run server:  

##### 1: update the requied packages using below command in terminal:
```
npm update
```
##### 2: Run the server by defining an arbitrary port and url (in my code) and run the index.js:
```
 export PORT=8889;export BASE_URL="test";node index.js   
```
Here I put my desired port and url as (port:8889 and url:test)  
##### 4: Testing the server in browser. Open a browser and:
```
localhost:8889/test/foo -------> {"msg":"Hello"}  

and simply change foo to bar to get {"msg":"World"}
```

## Extra part:

### To create to image using docker interminal:
#### steps:
##### 1 - Install docker:
```
sudo snap install docker
```
##### 2 - Create Dockerfile and Dockeridnor:
Open the Dockerfile in your favorite text editor
```
touch Dockerfile
```
then construct the docker file for the app as:  
The first thing we need to do is define from what image we want to build from. Here we will use the latest LTS (long term support) version 8 of node available from the Docker Hub:  
```
FROM node:8
```
Next we create a directory to hold the application code inside the image, this will be the working directory for your application:  
```
WORKDIR /usr/src/app
```
This image comes with Node.js and NPM already installed so the next thing we need to do is to install your app dependencies using  
the npm binary. Please note that if you are using npm version 4 or earlier a package-lock.json file will not be generated.  
Create a .dockerignore file in the same directory as your Dockerfile with following content:   

‍‍‍‍‍‍‍‍‍‍‍‍‍‍```
#Install app dependencies
#A wildcard is used to ensure both package.json AND package-lock.json are copied
#where available (npm@5+)
COPY package*.json ./
RUN npm install
#If you are building your code for production
#RUN npm ci --only=production
```
Note that, rather than copying the entire working directory, we are only copying the package.json file. This allows us to take advantage  
of cached Docker layers. bitJudo has a good explanation of this here. Furthermore, the npm ci command, specified in the comments, helps  
provide faster, reliable, reproducible builds for production environments. You can read more about this here.  

To bundle your app's source code inside the Docker image, use the COPY instruction:  
```
#Bundle app source
COPY . .
```
Your app binds to port 8080 so you'll use the EXPOSE instruction to have it mapped by the docker daemon:
```
EXPOSE 8080
```
Last but not least, define the command to run your app using CMD which defines your runtime. Here we will use the basic npm start which  
will run node server.js to start your server:
```
CMD [ "npm", "start" ]
```
Here, one should edit the package file and add "start":"node index.js" to the "scripts" part.  
Create a .dockerignore file in the same directory as your Dockerfile with following content:
```
node_modules
npm-debug.log
```  
##### 3 - Build docker image:
NOTICE: my specific values are:  
```
<username>: meysam
'user_port'= 8888  
user_url=test
docker_port:8888

```
sudo build -t <username>/node-web-app   
```               
To see the result:  
```
docker images
```
To see the information of images:  
```
docker ps -a
```
##### 4 - To run the docker image:
in terminal:  
```
docker run -d -e PORT='user_port' -e BASE_URL='user_url' -p docker_port:user_port <username>/node-web-app

```
one can save this image locally(for your case change the path):  
```

sudo docker save -o ~/Desktop/Challenges-master/CH1/url_image_test.tar meysam/node-web-app
```
##### 5 - Testing the server in browser. Open a browser and:
```
localhost:8888/test/foo -------> {"msg":"Hello"}
ttps://nodejs.org/de/docs/guides/nodejs-docker-w
and simply change foo to bar to get {"msg":"World"}  
```
###### To load the image via another system:
```
sudo docker load -i ~/Desktop/Challenges-master/CH2/url.tar
```
After loading the image one can do every described action to have results.
