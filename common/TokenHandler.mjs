import fs from "fs";
import path from "path";
import { mainDir, nowPlusDays } from "./Utils.mjs";
import { crc32 } from "crc";
import { format, isFuture } from "date-fns";

const DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
const EXPIRY_IN_DAYS = 3;

const tokenDir = path.join(mainDir, "json");
const tokenFile = path.join(tokenDir, "tokens.json");

/**
 * @typedef {Object} TokenEntry
 * @property {string} created
 * @property {string} username
 * @property {string} [email] - Optional, Mutable
 * @property {string} [phone] - Optional, Mutable
 * @property {string} token
 * @property {string} expires - Mutable
 * @property {boolean} confirmed - Mutable
 */

/**
 * Reads all tokens/users from disk.
 * @return {TokenEntry[]}
 */
const read = () => {
    if (!fs.existsSync(tokenFile)) {
        return [];
    }
    const entries = JSON.parse(fs.readFileSync(tokenFile, "utf8"));
    //Filter out expired tokens.
    const filteredEntries = entries.filter(entry => isFuture(entry.expires));
    // If tokens were filtered, write the new list to disk.
    if (entries.length !== filteredEntries.length) {
        write(filteredEntries);
    }
    return filteredEntries;
};

/**
 * Writes all tokens/users to disk with 4 space indentation.
 * @param entries {TokenEntry[]} The tokens to write.
 * @internal This is for use in this module only.
 */
const write = (entries) => {
    fs.writeFileSync(tokenFile, JSON.stringify(entries, null, 4), "utf8");
};

/**
 * Adds and returns a new user and token for a given username.
 * @param username {string} The username to create a token for.
 * @return {[string,Date]}
 */
const create = (username) => {
    const token = crc32(username).toString(16);
    const in3days = nowPlusDays(EXPIRY_IN_DAYS);

    if (!update("token", token, {expires: format(in3days, DATE_FORMAT)})) {
        const entries = read();
        entries.push({
            created: format(new Date(), DATE_FORMAT),
            username: username,
            token: token,
            expires: format(in3days, DATE_FORMAT),
            confirmed: false,
        });
        write(entries);
    }
    return [token, in3days];
};

/**
 * @param key {string} The key to search entries by
 * @param value {string} The value of the key that is being searched by
 * @param data {any | TokenEntry}
 * @return {boolean} True if the token was found and updated, false otherwise.
 */
const update = (key, value, data) => {
    const entries = read();
    const entryIndex = entries.findIndex(t => t[key] === value);
    if (entryIndex !== -1) {
        // Merges the existing token data with the new data.
        // This means that the new data will overwrite the old data, but the old data will remain if not overwritten.
        entries[entryIndex] = {
            ...entries[entryIndex],
            ...data,
        };
        write(entries);
        return true;
    }
    return false;
};

/**
 * @param key {string} The key to search entries by
 * @param value The value of the key that is being searched by
 * @return {TokenEntry} The found token entry, if undefined the entry was not found.
 **/
const search = (key, value) => {
    const entries = read();
    const entryIndex = entries.findIndex(t => t[key] === value);
    if (entryIndex !== -1) {
        return entries[entryIndex];
    }
    return undefined;
};

export default {
    get: read,
    create: create,
    update: update,
    search: search,
};