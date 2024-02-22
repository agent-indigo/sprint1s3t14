import path from "path";
import { fileURLToPath } from "url";

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