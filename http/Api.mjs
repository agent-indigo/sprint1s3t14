import GetConfig from "./api/GetConfig.mjs";
import express from "express";
import UpdateConfig from "./api/UpdateConfig.mjs";
import GetToken from "./api/GetToken.mjs";
import CreateToken from "./api/CreateToken.mjs";
import AsyncHandler from "./AsyncHandler.mjs";

/**
 * @param server {Express}
 */
export default (server) => {
    server.get("/api/config", express.json(), AsyncHandler(GetConfig));
    server.put("/api/config", express.json(), AsyncHandler(UpdateConfig));
    server.get("/api/token", express.json(), AsyncHandler(GetToken));
    server.post("/api/login", express.json(), AsyncHandler(CreateToken));
}