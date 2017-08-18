var express = require('express')
  , app = express()

var quejas = require('./routes/queja')

app.use('/', quejas);


app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

