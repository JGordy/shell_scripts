#!/bin/zsh

# in terminal, use 'sh ~/shell_scripts/express.sh' to run this script

# Simple program to create file directory for Node.js/express/postgresql projects

echo 'Project Name: '

read projectName

mkdir $projectName

cd $projectName

mkdir routes tests fetchers services utilities controllers

touch .env .env.default .travis.yml

echo 'web: node server.js' > Procfile

echo 'node_modules/

# misc
.DS_Store
.env
.env.default
.env.local
.env.development.local
.env.test.local
.env.production.local' > .gitignore

echo "require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const morgan = require('morgan');
const bcrypt = require('bcrypt');
const passport = require('passport');
const routes = require('./routes/index');
const BasicStrategy = require('passport-http').BasicStrategy;

const app = express();

// Required for production app...setting the port
app.set('port', (process.env.PORT || 3000));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(morgan('dev'));

app.use(passport.initialize());

const authenticateUser = (username, password, done) => {
    model.User.findOne({
        where: {
        'username': username.toLowerCase()
        }
    }).then(function (user) {
        if (user == null) {
        return done(null, false, { message: 'Invalid email and/or password: please try again' })
        }

        let hashedPassword = bcrypt.hashSync(password, user.salt)

        if (user.password === hashedPassword) {
        return done(null, user)
        }

        return done(null, false, { message: 'Invalid email and/or password: please try again' })
    })
}

passport.use(new BasicStrategy(authenticateUser))

passport.serializeUser((user, done) => {
    done(null, user.id)
})

passport.deserializeUser((id, done) => {
    model.User.findOne({
        where: {
        'id': id
        }
    }).then(function (user) {
        if (user == null) {
        done(new Error('Wrong user id'))
        }

        done(null, user)
    })
})

app.use('/api', routes);
app.use(routes);

// the 'if' is used for testing.
// getting the port from above..do this for production instead of localhost:3000
if (require.main === module) {
    app.listen(app.get('port'), () => {
        console.log('Node app is running on port', app.get('port'));
    });
}" > server.js

echo "require('dotenv').config();
const express = require('express');
const passport = require('passport');
const BasicStrategy = require('passport-http').BasicStrategy;
// const Utils = require('../utilities/utilities');

const router = express.Router();

// Passport Basic Authentication Strategy
passport.use(new BasicStrategy(
    function (username, password, done) {
        const userPassword = users[username];
        if (!userPassword) { return done(null, false); }
        if (userPassword !== password) { return done(null, false); }
        return done(null, username);
    }
));

// Allows CORS
router.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
    next();
});

/**
 * Documentation Routes
 */

// Use this route for Api documentation
router.get('/', (req, res) => {
    res.status(200).send({ status: '200', message: 'Everything is fine, we\'re fine', requestBody: req.body });
});

module.exports = router;" > routes/index.js

echo '# '$projectName'' > README.md

npm init --y

SCRIPTS='express nodemon bcrypt dotenv fs jsonwebtoken passport passport-http pg sequelize sequelize-cli bluebird node-fetch path morgan body-parser'

npm install --save $SCRIPTS

DEV_SCRIPTS='jest jest-cli'

npm install --save-dev $DEV_SCRIPTS

sequelize init

git init

git status

git add .

git status

git commit -m "initial commit"

echo "Git repo url:"

read gitRepo

git remote add origin $gitRepo

git remote -v

echo 'Add these to your package.json scripts field:

    "dev": "PORT=3002 nodemon server.js",
    "start": "nodemon server.js"
'

echo '
Local Database setup:

    #1 Create your local database, run:
    createdb <name_of_database>

    #2 Update the database name in your config.json file

    #3 Add models using syntax:
    sequelize model:create --name <model_name> --attributes <attribute_key>:<attribute_type>,<2nd_att_key>:<2nd_att_type>

    Example:
    sequelize model:create --name User --attributes email:string,password:string
    
    #4 Do not forget to update your <model_name>.js file if needed.

    #5 Once edits to models are complete, run:
    sequelize db:migrate
'

code .

PORT=3002 nodemon server.js
