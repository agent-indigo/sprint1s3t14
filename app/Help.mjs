import fs from "fs"
import path from "path";
import { mainDir, tryCatch } from "../common/Utils.mjs";

const manualFile = path.join(mainDir, "app", "manual.txt");

const Help = () => {
    tryCatch("Error reading manual", () => {
        console.log(fs.readFileSync(manualFile, "utf8"));
    });
}
export default Help