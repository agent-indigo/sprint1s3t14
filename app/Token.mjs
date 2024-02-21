const Token = args => {
    const help = [
        "Usage: node app.js token [options]",
    
        "Options:",
        "  --help       Display this help message",
    ]
    switch (args[0]) {
        case "-h":
        case "--help":
            return console.log(help.join("\n"));
        default:
            return console.log("Command not found");
    }
}
export default Token