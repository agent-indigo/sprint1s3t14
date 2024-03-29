import Help from "./Help.mjs";
import TokenHandler from "../common/TokenHandler.mjs";
import { tryCatch } from "../common/LogHandler.mjs";

const UPDATE_TYPES = {
    email: "email",
    phone: "phone"
};

const SEARCH_TYPES = {
    user: "username",
    ...UPDATE_TYPES
};

const list = () => {
    console.log("\nUser List\n");
    for (let entry of TokenHandler.get()) {
        console.log(`${entry.username}: ${entry.token}.`);
    }
};

const create = username => {
    if (!username) return console.error("All arguments must be provided, please refer to token --help");
    const [token] = TokenHandler.create(username);
    console.log(`New token successfully created for ${username}, token: ${token}`);
};

const update = (username, type, value) => {
    if (!type || !value) {
        return console.error("All arguments must be provided, please refer to token --help");
    }
    if (!UPDATE_TYPES.hasOwnProperty(type)) {
        return console.error(`Invalid type: ${type}, allowed types: ${Object.keys(UPDATE_TYPES).join(", ")}`);
    }
    type = UPDATE_TYPES[type];
    const updatedData = {[type]: value};
    if (TokenHandler.update("username", username, updatedData)) {
        console.log(`Token updated successfully for ${type}: ${value}.`);
    } else {
        console.error(`Token not found for username: ${username}.`);
    }
};

const search = async (type, value) => {
    if (!type || !value) {
        return console.error("All arguments must be provided, please refer to token --help");
    }
    if (!SEARCH_TYPES.hasOwnProperty(type)) {
        return console.error(`Invalid type: ${type}, allowed types: ${Object.keys(SEARCH_TYPES).join(", ")}`);
    }
    type = SEARCH_TYPES[type];
    const entry = TokenHandler.search(type, value);
    if (entry) {
        return console.log(`Token found: ${JSON.stringify(entry, null, 4)}.`);
    } else {
        return console.error(`Token not found for ${type}: ${value}.`);
    }
};

export default (args) => {
    switch (args[0]) {
        case "-h":
        case "--help": return Help();
        case "--list": return tryCatch("CLI", "Error listing tokens", list);
        case "--new": return tryCatch("CLI", "Error creating token", create, args[1]);
        case "--update": return tryCatch("CLI", "Error updating token", update, args[2], args[1], args[3]);
        case "--search": return tryCatch("CLI", "Error searching token", search, args[1], args[2]);
        default: return console.error("Unknown command, use --help for more information");
    }
};