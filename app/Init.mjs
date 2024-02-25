import fs from "fs";
import path from "path";
import Help from "./Help.mjs";
import ConfigHandler from "../common/ConfigHandler.mjs";
import { mainDir } from "../common/Utils.mjs";
import { tryCatch } from "../common/LogHandler.mjs";

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
};

export default (args) => {
    switch (args[0]) {
        case "-h":
        case "--help": return Help();
        case "--all": return tryCatch("CLI", "Error creating directories and config file", all);
        case "--dir": return tryCatch("CLI", "Error creating directories", dir);
        case "--conf": return tryCatch("CLI", "Error creating config file", conf);
        default: return console.error("Unknown command, use --help for more information");
    }
}