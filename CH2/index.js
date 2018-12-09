var app = require('./routes.js');

// env consts for port (default value is 3333)
const PORT = process.env.PORT || 3333

// listen to port on localhost:port{
try {
    app.server.listen(PORT, function () {
	console.log("Server is up and running on http://localhost:"+PORT);
	})
} catch (err) {
    console.log(err)
}