# Endless SSH Honeypot

This project sets up a minimalist honeypot using the [Endlessh](https://github.com/skeeto/endlessh) tool. It traps unauthorized SSH connections in an infinite banner loop, effectively delaying brute-force scanners without giving them system access.

## Features

- Lightweight and written in C
- Sends endless SSH banners to waste attacker time
- Can run on port 22 or a higher test port (e.g., 2222)
- Easy to daemonize using systemd

## How It Works

Endlessh opens a TCP port and responds with a slow, never-ending SSH banner. This prevents attackers from reaching the authentication stage, slowing down mass scanners and brute-force bots.

## Installation

### Clone and Build

```bash
git clone https://github.com/your-username/endless-ssh-honeypot.git
cd endless-ssh-honeypot
sudo apt update
sudo apt install build-essential
make
```

### Run for Testing (Non-privileged port)

```bash
./endlessh -p 2222 -v
```

### Run on Port 22 as a Daemon (Systemd)

1. Copy binary:

```bash
sudo cp endlessh /usr/local/bin/
```

2. Copy systemd service file:

```bash
sudo cp endlessh.service /etc/systemd/system/
```

3. Enable and start service:

```bash
sudo systemctl daemon-reexec
sudo systemctl enable endlessh
sudo systemctl start endlessh
```

4. Check status:

```bash
sudo systemctl status endlessh
```

## Configuration Options

- `-p <port>`: Set port (default: 22)
- `-l <delay>`: Milliseconds between characters (default: 10000)
- `-d`: Run as daemon
- `-v`: Enable verbose output

## Sample Output

Below is what an unauthorized SSH connection sees when trying to connect:

```
$ ssh -p 2222 attacker@your-server-ip
SSH-2.0-Endlessh
SSH-2.0-Endlessh
...
```

More output examples can be found in the [screenshots/](sample_output.txt) directory.

## Disclaimer

Use this tool responsibly. Do not deploy on networks you do not control. It is meant for educational and defensive purposes only.

## Credits

This project is based on the original [Endlessh](https://github.com/skeeto/endlessh) by Chris Wellons.
