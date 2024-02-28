import fs from "fs";
import path from "path";
import { mainDir } from "./Utils.mjs";
import { EventEmitter } from "events";

const defaultConfig = {
    admins: "880e0d76", // Token for 'admin' user.
    logRoutes: "false", // Whether to log all routes to the console. Including the method and path.
};

const configDir = path.join(mainDir, "json");
const configFile = path.join(configDir, "config.json");

const emitter = new EventEmitter();

/**
 * Reads the config file.
 * @return {any}
 */
const read = () => {
    if (!fs.existsSync(configFile)) {
        return {...defaultConfig};
    }
    const config = JSON.parse(fs.readFileSync(configFile, "utf8"));
    return {...defaultConfig, ...config};
};

/**
 * Get a value from the config file.
 * @template T The type of the value.
 * @param key {string} The key to get.
 * @param [fallback] {T} The value to return if the key does not exist.
 * @return {T} The value of the key.
 */
const get = (key, fallback) => {
    const config = read();
    return config[key] || fallback;
};

/**
 * Writes all config data to config.json file with 4 space indentation.
 * @param config {any} The config to write.
 * @internal This is for use in this module only.
 */
const write = (config) => {
    fs.writeFileSync(configFile, JSON.stringify(config, null, 4), "utf8");
};

/**
 * Set a key to a value in the config file.
 * @param key {string} The key to set.
 * @param value {any} The value to set, or null to delete the key.
 * @return {any} The new config.
 */
const set = (key, value) => {
    let config = read();
    if (value === null) {
        delete config[key];
        // Ensure that the default keys are not removed by the user.
        config = {
            ...defaultConfig,
            ...config,
        };
    } else {
        config[key] = value;
    }
    write(config);
    emitter.emit("update", config);
    return config;
};

/**
 * Initialize the config file.
 * @param [ifExists] {boolean} Force the creation of the config file even if it already exists.
 * @return boolean True if the config file was created, false if it already existed.
 * @throws {Error} Will throw an error if the config directory was not created.
 */
const init = (ifExists) => {
    const existed = fs.existsSync(configFile);
    if (ifExists || !existed) {
        write(defaultConfig);
        emitter.emit("update", defaultConfig);
    }
    return !existed;
};

export default {
    read: read,
    get: get,
    set: set,
    init: init,
    on: emitter.on.bind(emitter),
};