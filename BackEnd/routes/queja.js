var express = require('express')
  , router = express.Router();

var request = require('request');

router.get('/showQueja', function(req, res) {
var data = {
  "query": `query GetQueja ($queja: ID!){
  getQuejas(id: $queja){
    id
    createdAt
    modifiedAt
    descripcion
  }
}
  `,
  "variables": {"queja": "UXVlamFzOjQ"}
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