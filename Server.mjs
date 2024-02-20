// import modules here
import express from "express"
import dotenv from 'dotenv'
import morgan from "morgan"

// write all of your code inside this function expression
const Server = (() => {
    // load environment variables
    dotenv.config({ path: './config.env' })
    const DEBUG = process.env.DEBUG || 'false'
    const PORT = process.env.PORT || 5000

    // instantiate Express.js
    const app = express()

    // development logger: "Morgan"
    if(DEBUG !== 'false') app.use(morgan('dev'))

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