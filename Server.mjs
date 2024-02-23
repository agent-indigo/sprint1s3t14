// import modules here
import cookieParser from "cookie-parser";
import "dotenv/config";
import express from "express";
import fs from "fs";
import morgan from "morgan";
import Api from "./http/Api.mjs";
// write all of your code inside this function expression

// load environment variables
const DEBUG = process.env.DEBUG || "false";
const PORT = process.env.PORT || 5000;

// instantiate Express.js
const app = express();

// use express.json & cookieParser
app.use(express.json(), cookieParser());

// development logger: "Morgan"
const logStream = fs.WriteStream("./log.csv", {flags: "a"});
app.use(morgan(":method,:url,:status,:response-time ms", {stream: logStream}));

Api(app);

// start the server
app.listen(PORT, () => {
    console.log(`Server running on localhost:${PORT}.`);
    if (DEBUG !== "false") console.log("Debug mode enabled.");
});
