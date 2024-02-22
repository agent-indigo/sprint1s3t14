// import modules here
import cookieParser from 'cookie-parser'
import 'dotenv/config'
import express from 'express'
import fs from 'fs'
import morgan from "morgan"
import Token from './app/Token.mjs'
import AsyncHandler from './AsyncHandler.mjs'
import ErrorResponse from './ErrorResponse.mjs'
import Api from "./http/Api.mjs";
// write all of your code inside this function expression
const Server = (() => {
    // load environment variables
    const DEBUG = process.env.DEBUG || 'false'
    const PORT = process.env.PORT || 5000

    // instantiate Express.js
    const app = express()

    // use express.json & cookieParser
    app.use(express.json(), cookieParser())

    // development logger: "Morgan"
    const logStream = fs.WriteStream('./log.csv', { flags: 'a' })
    app.use(morgan(':method,:url,:status,:response-time ms', { stream: logStream }))

    // login route
    const login = () => app.post('/api/login', AsyncHandler(async (request, response, next) => {
        const { username } = request.body
        if (!username) return next(ErrorResponse('No username entered.', 404))
        const token = await Token(['--new', username])
        // Set the token as a cookie with expiry
        const expiryDate = new Date(token.expires)
        response.cookie('token', token.token, { expires: expiryDate, httpOnly: true })
        return response.status(200).json({
            success: true,
            token
        })
    }))

    // show token route
    const showToken = () => app.get('/api/token', (request, response, next) => {
        const token = request.cookies.token
        if(!token) {
            return next(ErrorResponse('Token not found.', 404))
        } else {
            return response.status(200).json({
                success: true,
                token
            })
        }
    })

    Api(app)

    // start the server
    app.listen(PORT, () => {
        console.log(`Server running on localhost:${PORT}.`)
        if(DEBUG !== 'false') console.log('Debug mode enabled.')
    })

    // handle promise rejections
    process.on('unhandledRejection', error => {
        console.error(`Error: ${error.message}`)
        // close server & exit process
        app.close(() => process.exit(1))
    })
    return {
        login,
        showToken
    }
})()

export default Server
