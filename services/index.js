const admin = require('firebase-admin');
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

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
    if (!username || !email || !password ) {
        return res.status(400).send({ error: 'All fields are required (username, email with valid format, password)' });
    }else if(!emailRegex.test(email)){
        console.log("Received email:", email);
        console.error("Invalid email format");
        return res.status(400).send({ error: 'Invalid email format' });
    
    }

    try {
        const userRecord = await admin.auth().createUser({
            email: email,
            password: password
        });

        const userID = userRecord.uid;

        await db.ref(`/users/${userID}`).set({
            username: username,
            email: email
        });

        res.status(200).send({ uid: userRecord.uid });
    } catch (error) {
        res.status(400).send({ error: error.message });
    }
});

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});