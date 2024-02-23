import fs from "fs";
import path from "path";

import Help from "./Help.mjs"
import ConfigHandler from "../common/ConfigHandler.mjs";
import { mainDir, tryCatch } from "../common/Utils.mjs";

const jsonDirectory = path.join(mainDir, "json");

const dir = () => {
    if (!fs.existsSync(jsonDirectory)) {
        fs.mkdirSync(jsonDirectory);
        console.log("Directory created successfully");
    } else {
        console.log("Directory already exists");
    }
};
const conf = () => {
    if (ConfigHandler.init()) {
        console.log("Config file created successfully");
    } else {
        console.log("Config file already exists");
    }
};
const all = () => {
    dir();
    conf();
}

const Init = args => {
    switch (args[0]) {
        case "-h":
        case "--help": return Help();
        case "--all": return tryCatch("Error creating directories and config file", all);
        case "--dir": return tryCatch("Error creating directories", dir);
        case "--conf": return tryCatch("Error creating config file", conf);
        default: return console.error("Unknown command, use --help for more information");
    }
}
export default Init