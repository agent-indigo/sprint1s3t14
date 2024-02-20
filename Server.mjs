// import modules here
import express from "express"
import morgan from "morgan"

// write all of your code inside this function expression
const Server = (() => {
    // instantiate Express.js
    const app = express()

    // environment variables
    const DEBUG = process.env.DEBUG || 'false'
    const PORT = process.env.PORT || 5000

    // development logger: "Morgan"
    if(DEBUG !== 'false') app.use(morgan('dev'))

    // start the server
    app.listen(PORT, () => {
        console.log(`Server running on localhost:${PORT}.`)
        if(DEBUG !== 'false') console.log('Debug mode enabled.')
    })

    // handle promise rejections
    process.on('unhandledRejection', (error, promise) => {
        console.error(`Error: ${error.message}`)
        // close server & exit process
        app.close(() => process.exit(1))
    })
})()

export default Server
