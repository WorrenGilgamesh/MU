var express = require('express')
  , app = express()

var showQuejas = require('./routes/showQuejaController')
var addQuejas = require('./routes/addQuejaController')
var principal = require('./../FrontEnd/prueba/dist/index.html')

app.use('/', showQuejas);
app.use('/', addQuejas);
app.get('/index', function(req, res) {
    res.sendFile(principal);
});


app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});

