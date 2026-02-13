import mysql from 'mysql2/promise'


export const pool = mysql.createPool({
    database: "almoxarifado_db",
    user: "root",
    password: "senai",
    host: "localhost",
    port: 3306,

})


