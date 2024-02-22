import fs from "fs"
import path from "path";
import { mainDir } from "../common/Utils.mjs";

const manualFile = path.join(mainDir, "app", "manual.txt");

const Help = () => {
    try {
        console.log(fs.readFileSync(manualFile, "utf8"))
    } catch (error) {
        console.error(`Error reading file: ${error}`)
    }
}
export default Help