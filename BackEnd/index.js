var express = require('express')
  , app = express()

var showQuejas = require('./routes/showQuejaController')
var addQuejas = require('./routes/addQuejaController')
var principal = '/FrontEnd/prueba/dist'
var path = require("path");

app.use('/', showQuejas);
app.use('/', addQuejas);
app.get('/index', function(req, res) {
    res.sendFile(path.join(__dirname, '..', principal, 'index.html'));
});
  


app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});

