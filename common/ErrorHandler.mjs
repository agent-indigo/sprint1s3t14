import fs from 'fs'
import 'dotenv/config'
import {format} from 'date-fns'
import {v4 as uuid} from 'uuid'
const ErrorHandler = (source, error) => {
    const DEBUG = process.env.DEBUG || 'false'
    if (DEBUG !== 'false') console.error(`Error: ${error}.\nThis has been logged in 'errors.log.tsv'`)
    try {
        fs.appendFileSync('../errors.log.tsv', `${format(new Date(), 'MMM/d/yy,H:mm:ss:SSS')}\t${source}\t${uuid()}\t${error}\n`)
    } catch(error) {
        if (DEBUG !== 'false') console.error(`Error: ${error}.`)
    }
}
export default ErrorHandler