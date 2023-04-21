const express = require("express");
const app = express();
const port = process.env.PORT || 3000;
const axios = require("axios");

const wsTokenUrl = "https://api.jdoodle.com/v1/auth-token";
const creditSpentUrl = "https://api.jdoodle.com/v1/credit-spent";

const clientId = "f24fcb9aa1f0a602f3f645ff314c52a5";
const clientSecret = "ac75b0835426cec3ce1b2daf982d873c00d334fdc699ee8bcc6d56b909f9e0d2";

app.get("/health/:name", (req, res) => {
  greeting = "<h1>Server is live and working</h1>";
  name = req.params["name"];

  if (name) {
    res.send(greeting + "</br>and hello to " + name);
  } else {
    res.send(greeting);
  }
});

app.get("/used", async (req, res) => {
  const creditsResponse = await axios({
    method: "post",
    url: creditSpentUrl,
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    data: {
      clientId: clientId,
      clientSecret: clientSecret,
    },
  });
  const {status, data: used} = creditsResponse
  res.send({status, used})
});

app.post("/", async (req, res) => {
  const tokenResponse = await axios({
    method: "post",
    url: wsTokenUrl,
    headers: {
      "Content-Type": "application/json; charset=UTF-8",
    },
    data: {
      clientId: clientId,
      clientSecret: clientSecret,
    },
  });
  const {status, data: token} = tokenResponse
  res.send({status, token})
  // res.status(tokenResponse.statusCode).send(new Buffer('wahoo'));
});

app.listen(port, () => console.log(`HelloNode app listening on port ${port}!`));
