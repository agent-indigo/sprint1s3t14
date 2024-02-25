import Config from "./app/Config.mjs";
import Help from "./app/Help.mjs";
import Init from "./app/Init.mjs";
import Token from "./app/Token.mjs";

const args = process.argv.slice(2);
const commands = {
    "-h": Help,
    "--help": Help,
    "config": Config,
    "init": Init,
    "token": Token,
};

const command = args[0];
if (commands.hasOwnProperty(command)) {
    commands[command](args.slice(1));
} else {
    console.log("Command not found");
}