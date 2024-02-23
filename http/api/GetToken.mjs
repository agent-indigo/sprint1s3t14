import { STATUS_CODE_BAD_REQUEST, STATUS_CODE_OK } from "../HttpUtils.mjs";
import TokenHandler from "../../common/TokenHandler.mjs";

/**
 * @param req {express.Request}
 * @param res {express.Response}
 */
export default (req, res) => {
    const token = req.cookies.token
    const entry = TokenHandler.search("token", token);
    if(!entry) {
        res.status(STATUS_CODE_BAD_REQUEST).json({
            success: false,
            data: "Invalid token provided"
        })
    } else {
        res.status(STATUS_CODE_OK).json({
            success: true,
            data: {
                username: entry.username,
                email: entry.email,
                phone: entry.phone,
                created: entry.created
            }
        })
    }
}