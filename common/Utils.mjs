import path from "path";
import { fileURLToPath } from "url";
import 'dotenv/config';
import ErrorHandler from './ErrorHandler.mjs';

const __filename = fileURLToPath(import.meta.url); // Gets the filename and dirname of the current module.
const __dirname = path.dirname(__filename); // Reduces down to just the directory name.

/**
 * The main directory of the application.
 * @type {string} The main directory of the application.
 */
// This takes from the current module's directory and goes up one level.
export const mainDir = path.join(__dirname, "..");

/**
 * Returns the current date plus the given days.
 * @param days {number} The amount of days to add to the current date.
 * @return {Date} The current date plus the given days.
 */
export const nowPlusDays = (days) => {
    const date = new Date();
    date.setDate(date.getDate() + days);
    return date;
}

/**
 * Executes the given function and catches any errors, logging them to the console.
 * @param message {string} The message to log if an error occurs.
 * @param fn {function} The function to execute.
 * @param args {...*} The arguments to pass to the function.
 * @return {*} The result of the function, or undefined if an error occurred.
 */
export const tryCatch = (message, fn, ...args) => {
    try {
        return fn(...args);
    } catch (e) {
        // TODO replace with proper logging, and give the user just the message and a reference number (LOG ID).
        ErrorHandler(fn, message);
        if (process.env.DEBUG !== 'false') console.error(e);
    }
}