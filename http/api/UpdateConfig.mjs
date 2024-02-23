import { isAdmin, STATUS_CODE_BAD_REQUEST, STATUS_CODE_OK, STATUS_CODE_UNAUTHORIZED } from "../HttpUtils.mjs";
import ConfigHandler from "../../common/ConfigHandler.mjs";

/**
 * @param req {express.Request}
 * @param res {express.Response}
 */
export default (req, res) => {
    if (isAdmin(req)) {
        const key = req.body.key;
        const value = req.body.value;
        if (key && value) {
            const config = ConfigHandler.set(key, value);
            res.status(STATUS_CODE_OK).json({
                success: true,
                data: {
                    ...config,
                    [key]: value
                }
            });
        } else {
            res.status(STATUS_CODE_BAD_REQUEST).json({
                success: false,
                data: "Key and value are required"
            });
        }
    } else {
        res.status(STATUS_CODE_UNAUTHORIZED).json({
            success: false,
            data: "Unauthorized"
        });
    }
}