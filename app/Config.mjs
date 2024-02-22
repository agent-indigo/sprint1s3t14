import Help from "./Help.mjs"
const Config = args => {
    switch (args[0]) {
        case "-h":
        case "--help":
            Help()
            break
        default:
            return console.log("Command not found")
    }
}
export default Config