import fs from "fs";
import "dotenv/config";
import { format } from "date-fns";
import { v4 as uuid } from "uuid";
import path from "path";
import { mainDir } from "./Utils.mjs";

const FILE_FORMAT = "yyyy-MM-dd";
const LOG_TIME_FORMAT = "H:mm:ss:SSS";

const getLogFile = () => {
    const date = format(new Date(), FILE_FORMAT);
    const logDir = path.join(mainDir, "logs");
    if (!fs.existsSync(logDir)) fs.mkdirSync(logDir);
    return path.join(logDir, `${date}.log`);
};

/**
 * Log to the disk for that log file of that day.
 * @param source {string} The source of the log ie. web or cli
 * @param message {string} the readable message/tldr
 * @param [error] {Error} An optional error if the log was resulted from an error in the application.
 * @return {string} The UUID of the log entry.
 */
export const log = (source, message, error) => {
    const logId = uuid();
    const date = format(new Date(), LOG_TIME_FORMAT);
    const logFile = getLogFile();
    fs.appendFileSync(logFile, `[${date}] (${source}) [${logId}] ${message}\n`);
    if (error) fs.appendFileSync(logFile, `  ${error.stack}\n`);
    return logId;
};

/**
 * Like log but will only log if it's in a debug environment
 * @param source {string} The source will be prefixed by DEBUG:
 * @param message {string} The message to log
 */
export const debug = (source, message) => {
    if (process.env.DEBUG === "true") {
        log(`DEBUG: ${source}`, message);
    }
}

/**
 * Executes the given function and catches any errors, logging them to the console.
 * @param source {string} The source of the error.
 * @param message {string} The message to log if an error occurs.
 * @param fn {function} The function to execute.
 * @param args {...*} The arguments to pass to the function.
 * @return {*} The result of the function, or undefined if an error occurred.
 */
export const tryCatch = (source, message, fn, ...args) => {
    try {
        return fn(...args);
    } catch (e) {
        const logId = log(source, message, e);
        console.error(`${message}. Please contact support with the following reference number: ${logId}`);
    }
};