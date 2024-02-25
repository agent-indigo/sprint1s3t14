import { STATUS_CODE_BAD_REQUEST, STATUS_CODE_OK } from "../HttpUtils.mjs";
import TokenHandler from "../../common/TokenHandler.mjs";
import * as LogHandler from "../../common/LogHandler.mjs";

/**
 * @param req {express.Request}
 * @param res {express.Response}
 */
export default (req, res) => {
    const {username, phone, email} = req.body;
    if (!username) {
        res.status(STATUS_CODE_BAD_REQUEST).json({
            success: false,
            data: "Username not provided"
        });
    } else {
        LogHandler.debug("POST /api/token", `User '${username}' created a token.`);
        const [token, expiryDate] = TokenHandler.create(username);
        TokenHandler.update("token", token, {
            phone,
            email,
            confirmed: true
        });
        // Set the token as a cookie with expiry
        res.cookie("token", token, {expires: expiryDate, httpOnly: true});
        res.status(STATUS_CODE_OK).json({
            success: true,
            data: token
        });
    }
}