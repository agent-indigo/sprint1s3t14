import Help from "./Help.mjs";
import TokenHandler from "../common/TokenHandler.mjs";

const Token = args => {
    const listTokens = async () => {
        console.log("\nUser List\n");
        for (let entry of TokenHandler.get()) {
            console.log(`${entry.username}: ${entry.token}.`);
        }
    };
    const createToken = async username => {
        if (!username) return console.error("All arguments must be provided, please refer to token --help");
        const [token] = TokenHandler.create(username);
        console.log(`New token successfully created for ${username}, token: ${token}`);
    };
    const updateToken = async (username, type, value) => {
        if (!type || !value) {
            return console.error("All arguments must be provided, please refer to token --help");
        }
        const updatedData = { [type]: value };
        if (TokenHandler.update("username", username, updatedData)) {
            console.log(`Token updated successfully for ${type}: ${value}.`);
        } else {
            console.error(`Token not found for username: ${username}.`);
        }
    };
    const searchToken = async (type, value) => {
        if (!type || !value) {
            return console.error("All arguments must be provided, please refer to token --help");
        }
        const entry = TokenHandler.search(type, value);
        if (entry) {
            return console.log(`Token found: ${JSON.stringify(entry, null, 4)}.`);
        } else {
            return console.error(`Token not found for ${type}: ${value}.`);
        }
    };
    try {
        switch (args[0]) {
            case "-h":
            case "--help": return Help();
            case "--list": return listTokens();
            case "--new": return createToken(args[1]);
            case "--update": return updateToken(args[2], args[1], args[3]);
            case "--search": return searchToken(args[1], args[2]);
            default: return console.error("Command not found.");
        }
    } catch (error) {
        console.error(`Error processing command: ${error}.`);
    }
};
export default Token;