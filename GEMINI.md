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
    - **Storage**: IndexedDB (Local project persistence).

## Architecture
The project is structured as a **pnpm monorepo**:

- `apps/web`: The React-based frontend application.
    - `src/components`: UI components (Timeline, Preview, Inspector).
    - `src/bridges`: Coordination layer between the UI and the core engines.
    - `src/stores`: Zustand stores for application state.
    - `src/services`: Background services like auto-save and screen recording.
- `packages/core`: The core editing engines.
    - `src/video`: Video processing and rendering logic.
    - `src/audio`: Audio processing, effects, and beat detection.
    - `src/graphics`: SVG and shape handling.
    - `src/export`: Video/Audio encoding and export management.
    - `src/actions`: The undoable action system.

## Building and Running
The project uses `pnpm` for package management.

- **Installation**:
  ```bash
  pnpm install
  ```
- **Development**:
  ```bash
  pnpm dev
  ```
- **Building**:
  ```bash
  pnpm build
  # This builds both the WASM core and the web application.
  ```
- **Testing**:
  ```bash
  pnpm test      # Watch mode
  pnpm test:run  # CI mode
  ```
- **Quality Tools**:
  ```bash
  pnpm lint
  pnpm typecheck
  ```

## Development Conventions
- **Action-Based State**: All edits should be implemented as undoable actions within the core system.
- **Immutable Updates**: Use Zustand for state management, ensuring state updates are immutable.
- **Engine Separation**: Keep engine logic (in `packages/core`) independent of UI logic (in `apps/web`). Use bridges for coordination.
- **Strict TypeScript**: Avoid `any`. Prefer interfaces for object shapes and follow strict type checking.
- **Conventional Commits**: Use conventional commit messages (e.g., `feat:`, `fix:`, `refactor:`, `perf:`).
- **AI-Ready**: The project is designed for AI-assisted development. Refer to `llm.txt` (shadcn/ui context) and existing bridges for pattern consistency.

## Key Files
- `package.json`: Root configuration and workspace scripts.
- `README.md`: High-level project documentation and features.
- `CONTRIBUTING.md`: Detailed developer setup and coding standards.
- `mediabunny.d.ts`: Type definitions for the primary media engine dependency.
- `llm.txt`: Contextual documentation for shadcn/ui components.

---
*Note: This file was automatically generated to provide context for AI-assisted development.*
