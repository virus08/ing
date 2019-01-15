const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const mysql = require('mysql'); 
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
 
 // Retrieve all todos 
app.get('/sections', function (req, res) {
    myRO.query('SELECT DISTINCT Session_Code FROM source', function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: false, data: results, message: 'Sections' });
    });
});

app.get('/emp', function (req, res) {
    myRO.query('CALL getEmp()', function (error, results, fields) {
        if (error) throw error;        
        return res.send({ error: false, data: results, message: 'Emp List' });
    });
});

app.get('/listonhand', function (req, res) {
    myRO.query('SELECT emp.Emp_Code,Name,Surname,Start_date,GROUP_CONCAT(onhand.Code) as `Code Onhand`, count(DISTINCT onhand.Code) as `Product Count` FROM emp left join onhand on emp.Emp_Code= onhand.Emp_Code group by emp.Emp_Code;', function (error, results, fields) {
        if (error) throw error;        
        return res.send({ error: false, data: results, message: 'Emp List' });
    });
});



app.get('/Brand', function (req, res) {
    myRO.query('SELECT DISTINCT Code, Brand_Name FROM source', function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: false, data: results, message: 'Brand_Name' });
    });
});




app.get('/Source/search/:keyword', function (req, res) {
    let keyword = req.params.keyword;
    myRO.query("SELECT * FROM rest.source WHERE Session_Code LIKE ? ", ['%' + keyword + '%'], function (error, results, fields) {
        if (error) throw error;
        return res.send({ error: false, data: results, message: 'Todos search list.' });
    });
});

// default route
app.get('/', function (req, res) {
    return res.send({ error: true, message: 'hello' })
});
 
// all other requests redirect to 404
app.all("*", function (req, res, next) {
    return res.send({ error: true, message: 'Page Not Found' });
    next();
});

// port must be set to 8080 because incoming http requests are routed from port 80 to port 8080
app.listen(process.env.APP_PORT, function () {
    console.log('Node app is running on port: '+ process.env.APP_PORT); 
});