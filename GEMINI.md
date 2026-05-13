# OpenReel Video - GEMINI.md

## Project Overview
OpenReel Video is an open-source, browser-based professional video editor designed as a client-side alternative to CapCut. It leverages modern web technologies to provide a high-performance editing experience without requiring server-side processing or installations.

- **Primary Purpose**: Professional-grade video, audio, and photo editing entirely in the browser.
- **Core Technologies**:
    - **UI**: React 18, TypeScript, Tailwind CSS, shadcn/ui.
    - **State Management**: Zustand (Immutable state, action-based editing).
    - **Media Engine**: [MediaBunny](https://mediabunny.dev), WebCodecs (Hardware acceleration), WebGPU (GPU-accelerated rendering).
    - **Audio**: Web Audio API.
    - **3D/Graphics**: THREE.js, Canvas2D.
    - **Storage**: IndexedDB (Web) / Local File System (Desktop).
    - **Desktop**: Electron, electron-vite, electron-builder.

## Architecture
The project is structured as a **pnpm monorepo**:

- `apps/web`: The React-based frontend application and Electron host.
    - `src/components`: UI components (Timeline, Preview, Inspector).
    - `src/bridges`: Coordination layer between the UI and the core engines.
    - `src/stores`: Zustand stores for application state.
    - `src/services`: Background services like auto-save and screen recording.
    - `electron/`: Electron main process and preload scripts.
    - `electron-vite.config.ts`: Configuration for Electron build.
- `packages/core`: The core editing engines (Video, Audio, Graphics, Export).

## Building and Running
- **Web Development**: `pnpm dev`
- **Desktop Development**: `pnpm --filter @openreel/web electron:dev`
- **Desktop Build (Win)**: `pnpm --filter @openreel/web build:win`
- **Desktop Build (Mac)**: `pnpm --filter @openreel/web build:mac`
- **Desktop Build (Linux)**: `pnpm --filter @openreel/web build:linux`
- **WASM Build**: `pnpm build:wasm` (Required before first run/build)

## Desktop Features & Workflows
- **Native APIs**: Accessible via `window.api` (see `use-electron.ts` hook). Supports native file dialogs and direct file system access.
- **Auto-Updates**: Managed by `electron-updater` via GitHub Releases.
- **CI/CD**: `.github/workflows/release.yml` handles automated cross-platform builds on tag push (`v*`).

## Upstream Synchronization
This project is a fork. To stay updated with the original repository:
1. Add upstream: `git remote add upstream https://github.com/Augani/openreel-video.git`
2. Sync script: Run `./scripts/sync-upstream.sh` to fetch and prepare merge from `upstream/main`.
3. Branching: Use `desktop-main` for the primary desktop codebase and `main` to track upstream.

## Development Conventions
- **Action-Based State**: All edits should be implemented as undoable actions.
- **Desktop Compatibility**: Always check `isDesktop` via `useElectron()` before calling Electron-specific APIs to maintain web/desktop parity.
- **Strict TypeScript**: No `any`. Update `electron-env.d.ts` when adding IPC channels.
- **AI-Ready**: Refer to `llm.txt` for shadcn/ui. Use `scripts/claude-review.md` for AI code reviews.

## Key Files
- `package.json`: Root configuration and workspace scripts.
- `README.md`: High-level project documentation and features.
- `CONTRIBUTING.md`: Detailed developer setup and coding standards.
- `mediabunny.d.ts`: Type definitions for the primary media engine dependency.
- `llm.txt`: Contextual documentation for shadcn/ui components.

---
*Note: This file was automatically generated to provide context for AI-assisted development.*
