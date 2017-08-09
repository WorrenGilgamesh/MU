var express = require('express');
var app = express();

app.get('/', function (req, res) {
var request = require('request');

var data = {
  "query": `
    query GetAllUsers {
  viewer {
    allUsers {
      edges {
        node {
          id
          username
        }
      }
    }
  }
}
  `,
  "variables": {}
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

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

