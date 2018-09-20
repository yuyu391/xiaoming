var http = require("http");

http.createServer(function(request, response){
	// send HTTP HEAD
	// http : 200 ok
	// text/plain
	response.writeHead(200, {'Content-Type': 'text/plain'});

	response.end('Hello world by nodejs\n');

}).listen(8888);

console.log("Server running at http://127.0.0.1:8888/");
