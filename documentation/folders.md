# The Pandemonium Architecture

_System and Workflow Specification_

## 1. Core System

| Component    | Name          | Lore / Function                                                              |
| :----------- | :------------ | :--------------------------------------------------------------------------- |
| **Hostname** | `pandemonium` | The capital of Hell. The physical machine identifying itself on the network. |
| **Username** | `asmodeus`    | The Prince of Demons. The primary, day-to-day user account.                  |

## 2. Network & Connectivity

| Component          | Name          | Lore / Function       |
| :----------------- | :------------ | :-------------------- |
| **Wi-Fi (5GHz)**   | `goetia`      | The Invocation.       |
| **Wi-Fi (2.4GHz)** | `purgatory`   | The Waiting Room      |
| **Bluetooth**      | `morningstar` | The Light-Bringer.    |
| **Local Domain**   | `.goetia`     | Local network suffix. |

## 3. The User Space (`/home/asmodeus/`)

### The Grimoire (`~/grimoire/`)

The primary development directory for writing code, containing the logic and structures of your projects.

- **`desires/`** — Personal passion projects, apps, and custom extensions.
- **`pacts/`** — Professional work, freelance contracts, and corporate obligations.
- **`coven/`** — Collaborative, open-source repositories and shared knowledge.
- **`appendices/`** — SDKs, compilers, and foundational toolchains (e.g., Flutter SDK).

### Other Directories

- **`~/incantations/`** — Dedicated directory for writing lyrics, songs, and verses.

## 4. Browser Bookmarks (GitHub & Workflow)

| Folder Level    | Name         | Function / Lore                                                      |
| :-------------- | :----------- | :------------------------------------------------------------------- |
| **Main Folder** | `the_altar`  | **Github**                                                           |
| ↳ _Subfolder_   | `judgments`  | **To Review:** Code brought before you for approval or rejection.    |
| ↳ _Subfolder_   | `offerings`  | **My PRs:** Your own code submitted to the project maintainers.      |
| ↳ _Subfolder_   | `the_trials` | **CI Actions:** Automated tests and pipelines the code must survive. |
| ↳ _Subfolder_   | `curses`     | **Issues/Bugs:** Broken logic and grievances that must be purged.    |
