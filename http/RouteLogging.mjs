import ConfigHandler from "../common/ConfigHandler.mjs";
import * as LogHandler from "../common/LogHandler.mjs";

let logRoutes = ConfigHandler.get("logRoutes", "false") === "true";

ConfigHandler.on("update", (config) => {
    logRoutes = config.logRoutes === "true";
});

/**
 * @param server {Express}
 */
export default (server) => {
    server.use((req, res, next) => {
        next();
        if (logRoutes) {
            LogHandler.log("WEB/info", `Path requested: ${req.method} ${req.path}`);
        }
    });
}