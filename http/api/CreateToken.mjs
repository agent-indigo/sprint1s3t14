import { STATUS_CODE_BAD_REQUEST, STATUS_CODE_OK } from "../HttpUtils.mjs";
import TokenHandler from "../../common/TokenHandler.mjs";

/**
 * @param req {express.Request}
 * @param res {express.Response}
 */
export default (req, res) => {
    const {username} = req.body
    if (!username) {
        res.status(STATUS_CODE_BAD_REQUEST).json({
            success: false,
            data: "Username not provided"
        })
    } else {
        const [token, expiryDate] = TokenHandler.create(username)
        // Set the token as a cookie with expiry
        res.cookie('token', token, {expires: expiryDate, httpOnly: true})
        res.status(STATUS_CODE_OK).json({
            success: true,
            data: token
        })
    }
}