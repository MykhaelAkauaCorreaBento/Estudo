import mysql from 'mysql2/promise';

const pool = mysql.createPool({
    host : 'localhost',
    user : 'mykhael',
    password : 'mykhael11',
    database : 'leads_db'
});

export default pool;