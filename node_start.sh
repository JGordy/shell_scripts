#!/bin/zsh

# in terminal, use 'sh ~/shell_scripts/node_start.sh' to run this script

# Simple program to create file directory for Node.js projects

echo 'Project Name: '

read projectName

mkdir $projectName

cd $projectName

mkdir views routes public models tests

touch models/index.js public/main.css

echo 'node_modules/' > .gitignore

echo '<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>'$projectName'</title>
    <link rel="stylesheet" href="/main.css">
  </head>
  <body>
    <div class="container">
      {{{yield}}}
    </div>
  </body>
</html>' > views/layout.mustache

echo '<h1>Index.mustache</h1>' > views/index.mustache

echo 'const express = require("express");
const mustacheExpress = require("mustache-express");
const bodyParser = require("body-parser");
const path = require("path");
const routes = require("./routes/index");
const morgan = require("morgan");

const app = express();

app.use(express.static(path.join(__dirname, "public")));

app.engine("mustache", mustacheExpress());
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "mustache");
app.set("layout", "layout");

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(morgan("dev"));

app.use(routes);

app.listen(3000, function() {
  console.log("App is running on localhost:3000");
})' > server.js

echo 'const express = require("express");
const router = express.Router();


router.get("/", function(req, res) {
  res.render("index");
});


module.exports = router;' > routes/index.js

echo '* {
  margin: 0;
  padding: 0;
}

body {
    background-color: aliceblue;
}

.container {
  display: flex;
  flex-flow: row wrap;
  margin: 20px auto;
}' > public/main.css

echo '# '$projectName'' > README.md

npm init --y

npm install --save express mustache mustache-express path morgan body-parser

git init

git status

git add .

git status

git commit -m "initial commit"

echo "Git repo url:"

read gitRepo

git remote add origin $gitRepo

git remote -v

code .

nodemon server.js
