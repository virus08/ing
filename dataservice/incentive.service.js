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
const data = [];
const emp = [];
getMysql();
module.exports = {
    getAll,
    getM,
    getAllIncentive
};
async function getAll(req) {
    getMysql();
    tmp = data.filter(d => d.Emp_Code === req.empid)
    return tmp
}
async function getM(req) {
    let tmpm=['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06',
        '2018-07','2018-08','2018-09','2018-10','2018-11','2018-12'];
    getMysql();
    tmp = data.find(d => d.Emp_Code === req.empid && d.tack === tmpm[req.m-1])
    //data = [];
    return tmp
}
async function getAllIncentive() {
    let tmpm=['2018-01','2018-02','2018-03','2018-04','2018-05','2018-06',
        '2018-07','2018-08','2018-09','2018-10','2018-11','2018-12'];
    let tmps=[];
    let res={};
    getMysql();
    emp.forEach(function(e){
        e.January=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[0]).Incentive,
        e.February=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[1]).Incentive,
        e.March=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[2]).Incentive,
        e.April=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[3]).Incentive,
        e.May=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[4]).Incentive,
        e.June=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[5]).Incentive,
        e.July=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[6]).Incentive,
        e.August=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[7]).Incentive,
        e.September=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[8]).Incentive,
        e.October=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[9]).Incentive,
        e.November=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[10]).Incentive,
        e.December=data.find(d => d.Emp_Code === e.Emp_Code && d.tack === tmpm[11]).Incentive,
        tmps.push(e);
    });
    return tmps
}
async function getMysql(){
    myRO.query('call ing.getEmp();', function (error, results, fields) {
        if (error) throw error;
        while(emp.length > 0) {
            emp.pop();
        }
        results[0].forEach(function(e) { 
            emp.push(e);
        });
    });

    myRO.query('call getIncentive(\'2018-01-01\',\'2018-01-31\',\'Target_s1\',\'Target_g1\');', function (error, results, fields) {
        if (error) throw error;
        while(data.length > 0) {
            data.pop();
        }
        results[0].forEach(function(e) { 
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-02-01\',\'2018-02-28\',\'Target_s2\',\'Target_g2\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-03-01\',\'2018-03-31\',\'Target_s3\',\'Target_g3\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-04-01\',\'2018-04-30\',\'Target_s4\',\'Target_g4\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-05-01\',\'2018-05-31\',\'Target_s5\',\'Target_g5\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-06-01\',\'2018-06-30\',\'Target_s6\',\'Target_g6\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-07-01\',\'2018-07-31\',\'Target_s7\',\'Target_g7\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-08-01\',\'2018-08-31\',\'Target_s8\',\'Target_g8\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-09-01\',\'2018-09-30\',\'Target_s9\',\'Target_g9\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-10-01\',\'2018-10-31\',\'Target_s10\',\'Target_g10\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-11-01\',\'2018-11-30\',\'Target_s11\',\'Target_g11\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
        });
    });
    myRO.query('call getIncentive(\'2018-12-01\',\'2018-12-31\',\'Target_s12\',\'Target_g12\');', function (error, results, fields) {
        if (error) throw error;
        results[0].forEach(function(e) {
            data.push(e);
            //console.log(data)
        });
    });
}