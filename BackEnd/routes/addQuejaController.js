var express = require('express')
  , app = express()
  , router = express.Router();

var request = require('request');

var bodyParser = require('body-parser');
app.use(bodyParser.json()); // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

app.post('/addQueja', function(req, res) {
  var addPost = req.body.miQueja
var data = {
  "query": `mutation CreateQuejas($queja: CreateQuejasInput!){
  createQuejas(input: $queja){
    changedQuejas{
      id
      descripcion
    }
  }
}
  `,
  "variables": {"queja": {
  "descripcion": addPost
}}
}
request({
  url: "https://us-west-2.api.scaphold.io/graphql/MUDB",
  method: "POST",
  json: true,
  headers: {
    "content-type": "application/json",
  },
  body: data
}, function(error, response, body) {
  if (!error && response.statusCode == 200) {
    res.send(JSON.stringify(body, null, 2));
  } else {
    console.log(error);
    console.log(response.statusCode);
  }
});
});

module.exports = router