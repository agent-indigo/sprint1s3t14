import GetConfig from "./api/GetConfig.mjs";
import express from "express";
import UpdateConfig from "./api/UpdateConfig.mjs";

/**
 * @param server {Express}
 */
const setup = (server) => {
    server.get("/api/config", express.json(), GetConfig);
    server.put("/api/config", express.json(), UpdateConfig);
}

export default setup