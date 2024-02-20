const Help = args => {
    const help = [
        "Usage: node app.js [options]",
        "",
        "Options:",
        "  --help       Display this help message",
    ]
    console.log(help.join("\n"))
}
export default Help