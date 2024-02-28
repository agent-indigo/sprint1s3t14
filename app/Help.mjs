import fs from "fs";
import path from "path";
import { mainDir } from "../common/Utils.mjs";
import { tryCatch } from "../common/LogHandler.mjs";

const manualFile = path.join(mainDir, "app", "manual.txt");

export default () => {
    tryCatch("CLI", "Error reading manual", () => {
        console.log(fs.readFileSync(manualFile, "utf8"));
    });
}