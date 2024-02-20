
const help = [
    "Usage: node app.js init [options]",

    "Options:",
    "  --help       Display this help message",
]

const run = (args) => {
    switch (args[0]) {
        case "-h":
        case "--help":
            return console.log(help.join("\n"));
        default:
            return console.log("Command not found");
    }
}

module.exports = run