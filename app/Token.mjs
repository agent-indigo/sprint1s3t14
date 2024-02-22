import { crc32 } from 'crc'
import { format, addDays } from 'date-fns'
import { readFile, writeFile } from 'fs/promises'
import Help from './Help.mjs'
import path from 'path'
const Token = async args => {
    const tokensPath = path.join(path.dirname, 'json', 'tokens.json')
    const generateSecureToken = length => {
        return crc32(Math.ceil(length / 2)).toString('hex').slice(0, length)
    }
    const listTokens = async () => {
        try {
            const data = await readFile(tokensPath, 'utf-8')
            const tokens = JSON.parse(data)
            console.log('\nUser List\n')
            tokens.forEach(user => {
                console.log(`${user.username}: ${user.token}.`)
            })
        } catch (error) {
            console.error(`Error reading tokens file: ${error}.`)
        }
    }
    const createToken = async username => {
        try {
            const now = new Date()
            const expiry = addDays(now, 3)
            const dateFormat = 'MMM/d/yy,H:mm:ss:SSS'
            const token = {
                created: format(now, dateFormat),
                username: username,
                email: 'user@example.com',
                phone: '5556597890',
                token: generateSecureToken(16),
                expires: format(expiry, dateFormat),
                confirmed: 'tbd',
            }
            let tokens = []
            try {
                const data = await readFile(tokensPath, 'utf-8')
                tokens = JSON.parse(data)
            } catch (error) {
                console.error(`Error parsing tokens: ${error}.`)
            }
            tokens.push(token)
            const stringifiedTokens = JSON.stringify(tokens)
            await writeFile(tokensPath, stringifiedTokens, 'utf-8')
            console.log(`New token successfully created:\n${JSON.stringify(token)}.`)
            return token
        } catch (error) {
            console.error(`Error creating token: ${error}.`)
        }
    }
    const updateToken = async (username, type, value) => {
        try {
            const data = await readFile(tokensPath, 'utf-8')
            let tokens = JSON.parse(data)
            const index = tokens.findIndex(token => token.username === username)
            if (index !== -1) {
                tokens[index][type] = value
                const stringifiedTokens = JSON.stringify(tokens)
                await writeFile(tokensPath, stringifiedTokens, 'utf-8')
                console.log(`Token updated successfully for ${type}: ${value}.`)
            } else {
                console.error(`Token not found for username: ${username}.`)
            }
        } catch (error) {
            console.error(`Error updating token: ${error}.`)
        }
    }
    const searchToken = async (type, value) => {
        try {
            const data = await readFile(tokensPath, 'utf-8')
            const tokens = JSON.parse(data)
            const token = tokens.find(token => token[type] === value)
            if (token) {
                console.log(`Token found: ${JSON.stringify(token)}.`)
            } else {
                console.error(`Token not found for ${type}: ${value}.`)
            }
        } catch (error) {
            console.error(`Error searching token: ${error}.`)
        }
    }
    try {
        switch (args[0]) {
            case '-h':
            case '--help':
                Help()
                break
            case '--list':
                await listTokens()
                break
            case '--new':
                await createToken(args[1])
                break
            case '--update':
                await updateToken(args[2], args[3], args[4])
                break
            case '--search':
                await searchToken(args[1], args[2])
                break
            default:
                console.error('Command not found.')
        }
    } catch (error) {
        console.error(`Error processing command: ${error}.`)
    }
}
export default Token