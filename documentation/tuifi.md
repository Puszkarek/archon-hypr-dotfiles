# Tuifi Setup

Tuifi is a TUI music player for TIDAL that requires a self-hosted HiFi API instance.

## Prerequisites

- Active TIDAL subscription
- Python 3.7+
- mpv
- ffmpeg

## Initial Setup

### 1. Clone Repositories

```bash
cd ~
git clone https://github.com/binimum/hifi-api
git clone https://git.sr.ht/~matf/tuifi
```

### 2. Setup HiFi API

```bash
cd ~/hifi-api
python -m venv venv
./venv/bin/pip install -r tidal_auth/requirements.txt
./venv/bin/python tidal_auth/tidal_auth.py
```

Follow the authentication link to log in with your TIDAL account. This creates `token.json`.

```bash
./venv/bin/pip install -r requirements.txt
```

### 3. Usage

Run the fish function to start the HiFi API server and launch tuifi:

```fish
start-tuifi
```

This will:
- Start the HiFi API server on `http://localhost:8000`
- Launch tuifi connected to the local API
- Automatically stop the API server when tuifi exits

## Manual Usage

If you prefer to run components separately:

```bash
# Start HiFi API server
cd ~/hifi-api
./venv/bin/python main.py

# In another terminal, launch tuifi
cd ~/tuifi
./tuifi --api http://localhost:8000
```

## Configuration

Tuifi settings are stored in `~/.config/tuifi/settings.jsonc`. The API URL can be set:
- At runtime: `./tuifi --api http://localhost:8000`
- In settings.jsonc: `{ "api": "http://localhost:8000" }`

## Notes

- The HiFi API server defaults to `0.0.0.0:8000` (exposes to network)
- For local-only access, modify `main.py` to bind to `127.0.0.1:8000`
- The fish function handles starting/stopping the API server automatically
