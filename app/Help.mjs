import fs from 'fs'
const Help = () => {
    try {
        const data = fs.readFileSync('./manual.txt', 'utf8')
        console.log(data)
    } catch (error) {
        console.error(`Error reading file: ${error}`)
    }
}
export default Help