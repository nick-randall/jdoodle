const express = require("express");
const app = express();
const port = process.env.PORT || 3000;
const axios = require("axios");

const wsTokenUrl = "https://api.jdoodle.com/v1/auth-token";
const clientId = "f24fcb9aa1f0a602f3f645ff314c52a5";
const clientSecret = "ac75b0835426cec3ce1b2daf982d873c00d334fdc699ee8bcc6d56b909f9e0d2";

app.get(["/", "/:name"], (req, res) => {
  greeting = "<h1>Hello From Node on Fly!</h1>";
  name = req.params["name"];

  if (name) {
    res.send(greeting + "</br>and hello to New Changed Code" + name);
  } else {
    res.send(greeting);
  }
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
