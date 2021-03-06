//calling require framework
var express = require("express");
//definging app
var app = express();

// env consts for base url which could do not exist or take a value by user
var BASE_URL = process.env.BASE_URL || ""
// in case user define a value linking it to the base url 
if (BASE_URL.length > 0)
	BASE_URL = "/"+BASE_URL;

// foo url that returns """Hello""" in JSON format
app.get(BASE_URL+"/foo", function (req, res) {
    res.setHeader("Content-Type", "application/json");
    res.status(200).send(JSON.stringify({"msg":"Hello"}));
})

// bar url that returns World in JSON format
app.get(BASE_URL+"/bar", function (req, res) {
    res.setHeader("Content-Type", "application/json");
    res.status(200).send(JSON.stringify({"msg":"World"}));
 })

// other urls for error handling
app.all("*",function(req, res, next) {
    res.setHeader("Content-Type", "application/json");
    res.status(404).send(JSON.stringify({"msg":"route is not valid, use one these!",
                            "foo":BASE_URL+"/foo",
                            "bar":BASE_URL+"/bar"}));
})

exports.server = app;
