import { isAdmin, STATUS_CODE_OK, STATUS_CODE_UNAUTHORIZED } from "../HttpUtils.mjs";
import ConfigHandler from "../../common/ConfigHandler.mjs";
import * as LogHandler from "../../common/LogHandler.mjs";

/**
 * @param req {express.Request}
 * @param res {express.Response}
 */
export default (req, res) => {
    if (isAdmin(req)) {
        const config = ConfigHandler.read();
        LogHandler.debug("GET /api/config", `User '${req.cookies.token}' accessed the config.`);
        res.status(STATUS_CODE_OK).json({
            success: true,
            data: config
        });
    } else {
        LogHandler.log("GET /api/config", `Unauthorized user '${req.cookies.token}' attempted to access the config.`);
        res.status(STATUS_CODE_UNAUTHORIZED).json({
            success: false,
            data: "Unauthorized"
        });
    }
}