import Config from './Config.mjs'
import Help from './Help.mjs'
import Init from './Init.mjs'
import Token from './Token.mjs'
const App = () => {
    const args = process.argv.slice(2);
    const commands = {
        '-c': Config,
        '-config': Config,
        '-h': Help,
        '-help': Help,
        '-i': Init,
        '-init': Init,
        '-t': Token,
        '-token': Token
    }
    const command = args[0];
    if (commands.hasOwnProperty(command)) {
        commands[command](args.slice(1));
    } else {
        console.log("Command not found");
    }
}
export default App