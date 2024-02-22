import ConfigHandler from "../common/ConfigHandler.mjs";

export const STATUS_CODE_OK = 200;
export const STATUS_CODE_BAD_REQUEST = 400;
export const STATUS_CODE_UNAUTHORIZED = 401;

/**
 * Checks if the user token provided is an admin.
 * @param req {express.Request}
 * @return {boolean} True if the token is an admin, false otherwise.
 */
export const isAdmin = (req) => {
    // Gets the config from the handler, gets admins string or results to empty,
    // splits and then checks if cookie token is in that admins array.

    const adminsString = ConfigHandler.get().admins || "";
    const admins = adminsString.split(",");
    const token = req.cookies.token;
    return admins.includes(token);
}