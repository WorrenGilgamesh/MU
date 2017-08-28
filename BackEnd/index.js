var express = require('express')
  , app = express()

var showQuejas = require('./routes/showQuejaController')
var addQuejas = require('./routes/addQuejaController')

var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  app.use('/', showQuejas);
  app.use('/', addQuejas);
}).listen(8080, 'localhost');
console.log('Server running at http://localhost:8080/');


