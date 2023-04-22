const express = require("express");
const axios = require("axios");
const app = express();
const port = process.env.PORT || 3000;
const clientSecret = process.env.CLIENT_SECRET;
const clientId = process.env.CLIENT_ID;

const wsTokenUrl = "https://api.jdoodle.com/v1/auth-token";

app.get("/health", (req, res) => {
  message = "<h1>Server is live and working</h1>";

  res.send(message);
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
  const { status, data: used } = creditsResponse;
  res.send({ status, used });
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
  res.status(tokenResponse.statusCode).send();
});

app.listen(port, () => console.log(`HelloNode app listening on port ${port}!`));
