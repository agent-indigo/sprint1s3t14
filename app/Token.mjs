import crc32 from 'crc/crc32'
import { format, addDays } from 'date-fns'
import fs from 'fs'
import Help from './Help.mjs'
import path from 'path'
const Token = args => {
    const tokensPath = path.join(path.dirname(__filename), 'json', 'tokens.json')
    const listTokens = () => {
        fs.readFile(tokensPath, 'utf-8', (error, data) => {
            if (error) {
                console.error(`Error reading tokens file: ${error}`)
                return
            } else {
                let tokens = JSON.parse(data)
                console.log('\nUser List\n')
                tokens.forEach(user => {
                    console.log(`${user.username}: ${user.token}`)
                })
            }
        })
    }
    const createToken = username => {
        const now = new Date()
        const expiry = addDays(now, 3)
        const dateFormat = 'MMM/d/yy,H:mm:ss:SSS'
        const token = {
            "created": format(now, dateFormat),
            "username": username,
            "email": "user@example.com",
            "phone": "5556597890",
            "token": crc32(username).toString(16),
            "expires": format(expiry, dateFormat),
            "confirmed": "tbd"
        }
        fs.readFile(tokensPath, 'utf-8', (error, data) => {
            if (error) {
                console.error(`Error reading tokens file: ${error}`)
                return
            } else {
                let tokens = JSON.parse(data)
                tokens.push(token)
                let stringifiedTokens = JSON.stringify(tokens)
                fs.writeFile(tokensPath, stringifiedTokens, 'utf-8', error => {
                    if (error) {
                        console.error(`Error writing tokens file: ${error}`)
                        return
                    }
                    console.log(`New token successfully created:\n${JSON.stringify(token)}`)
                })
            }
        })
        return token
    }
    switch (args[0]) {
        case "-h":
        case "--help":
            Help()
            break
        case '--list':
            listTokens()
            break
        case '--new':
            createToken(args[1])
            break
        default:
            console.error("Command not found")
    }
}
export default Token