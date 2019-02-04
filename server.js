require('rootpath')();
const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mysql = require('mysql'); 
// var session = require('express-session');
//* Add Header 
const cors = require('cors');
const basicAuth = require('_helpers/basic-auth');
const errorHandler = require('_helpers/error-handler');

// var flash = require('connect-flash');

require('dotenv').config()

/*  env 
DB_HOST=192.168.56.10
DB_PORT=6446
DB_RO_PORT= 6447
DB_USER=root
DB_PASS=
DB_NAME=rest
APP_HOST=0.0.0.0
APP_PORT=8000
OAUTH_APP_ID=54f59231-4d59-424a-aa93-06dbc90cb80e
OAUTH_APP_PASSWORD=X7bgzonV/bqZxdrM4ov2M3FPvjk56f4XQV4OzMC2Ox0=
OAUTH_REDIRECT_URI=http://localhost:3000/auth/callback
OAUTH_SCOPES='profile offline_access user.read calendars.read'
OAUTH_AUTHORITY=https://login.microsoftonline.com/common
OAUTH_ID_METADATA=/v2.0/.well-known/openid-configuration
OAUTH_AUTHORIZE_ENDPOINT=/oauth2/v2.0/authorize
OAUTH_TOKEN_ENDPOINT=/oauth2/v2.0/token
*/
const myRW = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    port: process.env.DB_PORT,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});
myRW.connect();

const myRO = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    port: process.env.DB_RO_PORT,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});
myRO.connect();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(cors());
app.get('/', function (req, res) {
    return res.send({ error: false, message: 'hello' })
});
app.use(basicAuth);
app.use('/api', require('./dataservice/api'));
app.use('/users', require('./users/users.controller'));
app.use(errorHandler);

app.all("*", function (req, res, next) {
    return res.send({ error: true, message: 'Page Not Found' });
    next();
});

app.listen(process.env.APP_PORT, function () {
    console.log('Node app is running on port: '+ process.env.APP_PORT); 
});