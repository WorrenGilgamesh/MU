const express = require('express');
const postgraphql = require('postgraphql').postgraphql;


const app = express();

app.use(postgraphql('postgres://postgres:admin@localhost:5432/fm_db','public',{'graphiql':true}));



app.listen(3000);
