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
const users = [
    { id: 98, username: 'admin', password: 'test', firstName: 'admin', lastName: 'User' },
];

myRO.query('call getUsers()', function (error, results, fields) {
    if (error) throw error;
    //console.log(results[0]);
    results[0].forEach(function(e) {
        let utmp = {
            id          :e.id,
            username    :e.username,
            password    :e.password,
            firstName   :e.firstName,
            lastName    :e.lastName
        }
    users.push(utmp);
  });
  //console.log(users); 
});

module.exports = {
    authenticate,
    getAll
};

async function authenticate({ username, password }){
    console.log({ username, password });
    const user = users.find(u => u.username === username && u.password === password);
    if (user) {
        const { password, ...userWithoutPassword } = user;
        return userWithoutPassword;
    }
}

async function getAll() {
    return users.map(u => {
        const { password, ...userWithoutPassword } = u;
        return userWithoutPassword;
    });
}