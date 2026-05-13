# OpenReel Video Desktop

Professional video editing, now available as a standalone desktop application.

## Features
- **Native File System**: Open and save projects directly to your local drive.
- **Hardware Acceleration**: Full support for WebGPU and WebCodecs for smooth 4K editing.
- **Offline Mode**: Edit without an internet connection.
- **Auto-Updates**: Stay up to date with the latest features and bug fixes.
- **Privacy**: Your videos never leave your machine.

## System Requirements
- **Windows**: Windows 10/11 (64-bit)
- **macOS**: macOS 11.0 or later (Intel & Apple Silicon supported)
- **Linux**: Ubuntu 20.04+, Debian 10+, or any modern distro supporting AppImage/deb.
- **RAM**: 8GB minimum, 16GB+ recommended for 4K.
- **GPU**: Modern GPU with WebGPU support.

## Installation
You can download the latest version from the [Releases](https://github.com/Augani/openreel-video/releases) page.

- **Windows**: Download `.exe` and run the installer.
- **macOS**: Download `.dmg`, open it, and drag OpenReel to your Applications folder.
- **Linux**: Download `.AppImage` (make executable and run) or `.deb` (install via `dpkg` or `apt`).

## Development
```bash
# Install dependencies
pnpm install

# Run in development mode
pnpm --filter @openreel/web electron:dev

# Build for Windows
pnpm --filter @openreel/web build:win

# Build for macOS
pnpm --filter @openreel/web build:mac

# Build for Linux
pnpm --filter @openreel/web build:linux
```

## Known Limitations
- Initial launch may be slow due to WASM compilation.
- Screen recording requires system permissions on macOS.
