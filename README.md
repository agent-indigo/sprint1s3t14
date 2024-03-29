# Sprint 1 Javascript · Semester 3 · Team 14

## Team Members

- [Valentine Ampah](https://github.com/heatherb24)
- [Heather Bartlett](https://github.com/VK-Ampah)
- [Brady Green](https://github.com/Brady-G)
- [Braden Hynes](https://github.com/agent-indigo)

## Installation

```npm
# Start off by cloning the repository
# Then run the following command to install the required packages
npm install

# To initalize the config files you must first use the CLI app 
# to create the required files
npm run init

# To start the http server run the following command
npm run start
```

## Usage

```npm
# To use the CLI app you can run the following command
node app <command> <options>

# For information on the commands and options run the following command
node app --help
```

## Logging

Logging in our project is written to files in the `logs` directory. The log files are named based on the date they were created.
The log files are plain text files and can be opened with any text editor, and a new log file is created each day.
Within the log files, the log files name is the date in the format `YYYY-MM-DD.log`, the log contents have the
following format:

`[<timestamp>] (source/loglevel) [log id] log message`

> Optionally if the log message from an error, the stack trace will be printed below the log message.

## Example

`[2:51:27:659] (GET /api/config) [e214d157-cf66-4cef-9707-0f3f0be4a60f] Unauthorized user 'test' attempted to access the config.`

## Project Format

The project is structured in the following format:

- /app - Contains code only for the CLI app
- /common - Contains code shared between the CLI app and the HTTP server
- /http - Contains code only for the HTTP server
- /json - Contains the JSON files used by the CLI app and the HTTP server such as `tokens.json` and `config.json`
- /logs - Contains the log files generated by the CLI app and the HTTP server
- /static - Contains the static files served by the HTTP server such as `login.html` and `style.css`
- /app.js - The entry point for the CLI app
- /server.js - The entry point for the HTTP server

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details
