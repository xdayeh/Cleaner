# Cleaner

Cleaner is a professional and minimalistic Linux system cleanup tool.
It is designed for Debian-based systems to help automate common 
maintenance tasks with logs and error tracking.

## Features

- Updates system packages and upgrades
- Checks for available but held-back/phased upgrades
- Removes unused packages
- Cleans package cache and temporary files
- Clears old system logs and journal entries
- Logs the full process with timestamps
- Handles errors and logs them into `/var/log/cleaner.log`

## Installation

### Manual (.deb)
Download the `.deb` file and install it:
```bash
curl -sL https://github.com/xdayeh/cleaner/releases/latest/download/cleaner.deb -o cleaner.deb && sudo dpkg -i cleaner.deb && cleaner && rm cleaner.deb
```
This command will:
- Download the latest `.deb` package
- Install it using `dpkg`
- Run the `cleaner` tool immediately
- Remove the downloaded file afterwards
## Sample Output

```
[2025-04-22 03:12:00] Welcome to Cleaner — your professional system 
maintenance assistant.
[2025-04-22 03:12:00] Thank you for using Cleaner. Beginning system 
cleanup process...
...
[2025-04-22 03:14:30] System cleanup completed successfully.
```

## Requirements

- A Debian-based system (Ubuntu, etc.)
- Root privileges

## License

This project is licensed under the MIT License.
