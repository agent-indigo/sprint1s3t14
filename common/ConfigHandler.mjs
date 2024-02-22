import fs from "fs";
import path from "path";
import { mainDir } from "./Utils.mjs";

const defaultConfig = {
    admins: ""
}

const configDir = path.join(mainDir, "json");
const configFile = path.join(configDir, "config.json");

/**
 * Reads the config file.
 * @return {any}
 * @throws {Error} Will throw an error if the config file was not initialized.
 */
const read = () => {
    if (!fs.existsSync(configFile)) {
        throw new Error("Config was not initialized");
    }
    return JSON.parse(fs.readFileSync(configFile, "utf8"));
}

/**
 * Writes all config data to config.json file with 4 space indentation.
 * @param config {any} The config to write.
 * @internal This is for use in this module only.
 */
const write = (config) => {
    fs.writeFileSync(configFile, JSON.stringify(config, null, 4), "utf8");
}

/**
 * Set a key to a value in the config file.
 * @param key {string} The key to set.
 * @param value {any} The value to set.
 */
const set = (key, value) => {
    const config = read();
    config[key] = value;
    write(config);
}

/**
 * Initialize the config file.
 * @return boolean True if the config file was created, false if it already existed.
 * @throws {Error} Will throw an error if the config directory was not created.
 */
const init = () => {
    const existed = fs.existsSync(configFile);
    write(defaultConfig);
    return !existed;
}

export default {
    get: read,
    set: set,
    init: init,
}