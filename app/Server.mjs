// import modules here
import 'dotenv/config'
import express from 'express'
import fs from 'fs'
import morgan from "morgan"
import path from 'path'

// write all of your code inside this function expression
const Server = (() => {
    // load environment variables
    const DEBUG = process.env.DEBUG || 'false'
    const PORT = process.env.PORT || 5000

    // instantiate Express.js
    const app = express()

    // development logger: "Morgan"
    const logStram = fs.WriteStream(path.join(path.dirname, 'log.csv'), { flags: 'a' })
    app.use(morgan(':method,:url,:status,:response-time ms', { stream: logStram }))

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
})()

export default Server
