import Help from "./Help.mjs"
import ConfigHandler from "../common/ConfigHandler.mjs";

const show = () => {
    const config = ConfigHandler.get();
    for (let [key, value] of Object.entries(config)) {
        console.log(`'${key}': '${value}'`);
    }
}

const reset = () => {
    ConfigHandler.init();
    console.log("Config reset to default.");
}

const set = (key, value) => {
    if (key === undefined || value === undefined) {
        return console.error("Invalid arguments. Use --set <key> <value>");
    }
    ConfigHandler.set(key, value);
    console.log(`Config '${key}' set to '${value}'`);
}

const Config = args => {
    switch (args[0]) {
        case "-h":
        case "--help": return Help();
        case "--show": return show();
        case "--reset": return reset();
        case "--set": return set(args[1], args[2]);
        default: return console.error("Command not found.");
    }
}
export default Config