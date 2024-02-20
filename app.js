const args = process.argv.slice(2);
const commands = {
    "--help": require("./app/help"),
    "-h": require("./app/help"),
    "config": require("./app/config"),
    "init": require("./app/init"),
    "token": require("./app/token"),
}

const command = args[0];
if (commands.hasOwnProperty(command)) {
    commands[command](args.slice(1));
} else {
    console.log("Command not found");
}

