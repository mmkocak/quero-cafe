const admin = require('firebase-admin');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const bcrypt = require('bcrypt');

const app = express();

const serviceAccount = require('./quero-cafe-cf3c3-firebase-adminsdk-zn84l-b9178ddab0.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://quero-cafe-cf3c3-default-rtdb.firebaseio.com/",
});

const db = admin.database();
app.use(bodyParser.json());
app.use(cors());

const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;


app.post('/register', async (req, res) => {
    const { username, email, password } = req.body;

    // Check for missing fields and valid email format
    if (!username || !email || !password) {
        return res.status(400).send({ error: 'All fields are required (username, email with valid format, password)' });
    } else if (!emailRegex.test(email)) {
        console.log("Received email:", email);
        console.error("Invalid email format");
        return res.status(400).send({ error: 'Invalid email format' });

    } else if (password.length < 6) {
        return res.status(400).send({ error: 'Password must be at least 6 characters long' });
    }

    try {
        const hashedPassword = await bcrypt.hash(password, 10);

        const userRecord = await admin.auth().createUser({
            email: email,
            password: password
        });

        const userID = userRecord.uid;

        await db.ref(`/users/${userID}`).set({
            username: username,
            email: email,
            hashedPassword: hashedPassword
        });

        res.status(200).send({ uid: userRecord.uid });
    } catch (error) {
        res.status(400).send({ error: error.message });
    }
});

app.post('/login', async (req, res) => {
    const { username, password } = req.body;

    if (!username || !password) {
        return res.status(400).send({ error: 'Username and password are required' });
    }

    try {        
        // Get user data from database
        const userSnapshot = await db.ref('/users').orderByChild('username').equalTo(username).once('value');
        const usersData = userSnapshot.val();

        if (!usersData) {
            return res.status(404).send({ error: 'User not found' });
        }

        const userID = Object.keys(usersData)[0];
        const userData = usersData[userID];

        // Compare password
        const passwordMatch = await bcrypt.compare(password, userData.hashedPassword);
        
        if (!passwordMatch) {
            return res.status(401).send({ error: 'Invalid password' });
        }

        // Generate custom token for client
        const token = await admin.auth().createCustomToken(userID);
        
        res.status(200).send({ 
            token,
            user: {
                uid: userID,
                email: userData.email,
                username: userData.username
            }
        });
    } catch (error) {
        console.error('Login error:', error);
        res.status(400).send({ error: error.message });
    }
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});