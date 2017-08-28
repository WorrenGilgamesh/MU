var express = require('express')
  , app = express()

var showQuejas = require('./routes/showQuejaController')
var addQuejas = require('./routes/addQuejaController')

app.use('/', showQuejas);
app.use('/', addQuejas);


app.listen(8080, function () {
  console.log('Example app listening on port 8080!');
});

