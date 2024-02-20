
const help = [
    "Usage: node app.js [options]",
    "",
    "Options:",
    "  --help       Display this help message",
]

const run = (args) => {
    console.log(help.join("\n"));
}

module.exports = run