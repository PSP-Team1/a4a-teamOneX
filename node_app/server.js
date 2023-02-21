const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

const pool = mysql.createPool({
    connectionLimit: 10,
    host: 'db',
    user: 'root',
    password: 'ci',
    database: 'ci_app'
});

app.post('/api/login', (req, res) => {

    console.log(req)
    const { email, password } = req.body;

    pool.query('SELECT id FROM sys_users WHERE email = ? AND password = ?', [email, password], (error, results) => {
        if (error) {
            console.error(error);
            return res.status(500).json({ error: 'Failed to query the database' });
        }

        if (results.length === 0) {
            return res.status(401).json({ error: 'Invalid email or password' });
        }

        const token = jwt.sign({ email: email }, 'secret_key');
        res.json({ token: token });
    });
});


function verifyToken(req, res, next) {
    const token = req.headers.authorization;
    if (!token) {
        return res.status(401).json({ error: 'Unauthorized: Missing token' });
    }

    try {
        const decoded = jwt.verify(token, 'secret_key');
        req.user = decoded;
        next();
    } catch (error) {
        return res.status(401).json({ error: 'Unauthorized: Invalid token' });
    }
}

app.get('/api/company_audit_response/:audit_id', verifyToken, (req, res) => {
    const audit_id = req.params.audit_id;

    pool.query('SELECT * FROM company_audit_response WHERE audit_id = ?', audit_id, (error, results) => {
        if (error) {
            console.error(error);
            res.status(500).json({ error: 'Failed to query the database' });
        } else {
            console.log(`Results: ${JSON.stringify(results)}`);
            res.json(results);
        }
    });
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});
