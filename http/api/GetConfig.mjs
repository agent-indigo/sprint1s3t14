import { isAdmin, STATUS_CODE_OK, STATUS_CODE_UNAUTHORIZED } from "../HttpUtils.mjs";
import ConfigHandler from "../../common/ConfigHandler.mjs";

/**
 * @param req {express.Request}
 * @param res {express.Response}
 */
export default (req, res) => {
    if (isAdmin(req)) {
        const config = ConfigHandler.read();
        res.status(STATUS_CODE_OK).json({
            success: true,
            data: config
        });
    } else {
        res.status(STATUS_CODE_UNAUTHORIZED).json({
            success: false,
            data: "Unauthorized"
        });
    }
}