import fs from "fs";
import path from "path";
import { mainDir, tryCatch } from "./Utils.mjs";
import ErrorHandler from "./ErrorHandler.mjs";
import { EventEmitter } from "events";

const defaultConfig = {
    admins: "",
    debug: "false",
}

const configDir = path.join(mainDir, "json");
const configFile = path.join(configDir, "config.json");

const emitter = new EventEmitter();

tryCatch("Error trying to get initial config", () => {
    if (fs.existsSync(configDir)) {
        const config = JSON.parse(fs.readFileSync(configFile, "utf8"));
        emitter.emit("update", config);
    }
});

/**
 * Reads the config file.
 * @return {any}
 * @throws {Error} Will throw an error if the config file was not initialized.
 */
const read = () => {
    if (!fs.existsSync(configFile)) {
        return ErrorHandler("ConfigHandler", "Config was not initialized.");
    }
    const config = JSON.parse(fs.readFileSync(configFile, "utf8"));
    return { ...defaultConfig, ...config };
}

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
        }
    } else {
        config[key] = value;
    }
    write(config);
    emitter.emit("update", config);
    return config;
}

/**
 * Initialize the config file.
 * @return boolean True if the config file was created, false if it already existed.
 * @throws {Error} Will throw an error if the config directory was not created.
 */
const init = () => {
    const existed = fs.existsSync(configFile);
    write(defaultConfig);
    emitter.emit("update", defaultConfig);
    return !existed;
}

export default {
    read: read,
    get: get,
    set: set,
    init: init,
    on: emitter.on.bind(emitter),
}