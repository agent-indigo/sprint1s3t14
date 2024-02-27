// import modules here
import cookieParser from "cookie-parser";
import "dotenv/config";
import express from "express";
import Api from "./http/Api.mjs";
import RouteLogging from "./http/RouteLogging.mjs";
import path from "path";
import { mainDir } from "./common/Utils.mjs";

// load environment variables
const DEBUG = process.env.DEBUG || "false";
const PORT = process.env.PORT || 5000;

// instantiate Express.js
const app = express();

// use express.json & cookieParser
app.use(express.json(), cookieParser());

app.use("/", express.static(path.join(mainDir, "static"), {
    "extensions": ["html"]
}));
app.get("/", (req, res) => {
    res.sendFile(path.join(mainDir, "static", "login.html"));
});

RouteLogging(app);
Api(app);

// start the server
app.listen(PORT, () => {
    console.log(`Server running on localhost:${PORT}.`);
    if (DEBUG !== "false") console.log("Debug mode enabled.");
});
