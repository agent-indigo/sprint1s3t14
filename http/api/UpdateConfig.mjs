import { isAdmin, STATUS_CODE_BAD_REQUEST, STATUS_CODE_OK, STATUS_CODE_UNAUTHORIZED } from "../HttpUtils.mjs";
import ConfigHandler from "../../common/ConfigHandler.mjs";
import * as LogHandler from "../../common/LogHandler.mjs";

/**
 * @param req {express.Request}
 * @param res {express.Response}
 */
export default (req, res) => {
    if (isAdmin(req)) {
        const key = req.body.key;
        const value = req.body.value;
        if (key && value !== undefined) {
            const config = ConfigHandler.set(key, value);
            LogHandler.debug("PUT /api/config", `User '${req.cookies.token}' updated the config key '${key}' to '${value}'.`);
            res.status(STATUS_CODE_OK).json({
                success: true,
                data: config
            });
        } else {
            res.status(STATUS_CODE_BAD_REQUEST).json({
                success: false,
                data: "Key and value are required"
            });
        }
    } else {
        LogHandler.log("PUT /api/config", `Unauthorized user '${req.cookies.token}' attempted to update the config.`);
        res.status(STATUS_CODE_UNAUTHORIZED).json({
            success: false,
            data: "Unauthorized"
        });
    }
}