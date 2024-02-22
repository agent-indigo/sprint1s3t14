import Help from "./Help.mjs"
const Init = args => {
    switch (args[0]) {
        case '-h':
        case '--help':
            Help()
            break
        default:
            return console.error('Command not found.')
    }
}
export default Init