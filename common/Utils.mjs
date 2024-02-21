import path from "path";
import { fileURLToPath } from "url";

const __filename = fileURLToPath(import.meta.url); // Gets the filename and dirname of the current module.
const __dirname = path.dirname(__filename); // Reduces down to just the directory name.

/**
 * The main directory of the application.
 * @type {string} The main directory of the application.
 */
// This takes from the
export const mainDir = path.join(__dirname, "..");