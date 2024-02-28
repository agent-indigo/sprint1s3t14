import Help from "./Help.mjs";
import ConfigHandler from "../common/ConfigHandler.mjs";
import { tryCatch } from "../common/LogHandler.mjs";

const show = () => {
    const config = ConfigHandler.read();
    for (let [key, value] of Object.entries(config)) {
        console.log(`'${key}': '${value}'`);
    }
};

const reset = () => {
    ConfigHandler.init(true);
    console.log("Config reset to default.");
};

const set = (key, value) => {
    if (key === undefined || value === undefined) {
        return console.error("Invalid arguments. Use --set <key> <value>");
    }
    ConfigHandler.set(key, value);
    console.log(`Config '${key}' set to '${value}'`);
};

export default (args) => {
    switch (args[0]) {
        case "-h":
        case "--help": return Help();
        case "--show": return tryCatch("CLI", "Error showing config", show);
        case "--reset": return tryCatch("CLI", "Error resetting config", reset);
        case "--set": return tryCatch("CLI", "Error setting config", set, args[1], args[2]);
        default: return console.error("Unknown command, use --help for more information");
    }
};