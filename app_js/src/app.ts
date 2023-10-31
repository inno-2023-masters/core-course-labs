import express from "express";
/* eslint-disable */
const jester: any = require('jester-jokes');

export const app = express();

app.get('/', (req, res) => {
    const joke = jester.getJoke();
    res.send({"joke": joke});
})