const mysql = require('mysql');  

require('dotenv').config() 
const myRO = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    port: process.env.DB_RO_PORT,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME
});
myRO.connect(); 

// users hardcoded for simplicity, store in a db for production applications
const empdata =[];
myRO.query('call getEmp()', function (error, results, fields) {
    if (error) throw error;
    results[0].forEach(function(e) {
        empdata.push(e);
    });
    //console.log(empdata);
});

module.exports = {
    getAll
};

async function getAll() {
    return empdata;
}