# C++ service roadmap

Goal: replace the Python orchestration layer only when the native service can cover the same operational surface.

Required milestones:

1. Standalone Windows service exe that detects `PenguinHotel-Win64-Shipping.exe` and retries safely.
2. Native global F10 hotkey handling with no terminal focus requirement.
3. Xenos injection orchestration and bridge port/progress sidecar management.
4. JSONL event log and `last_status.json` parity with the current Python runtime.
5. No-game smoke parity: process missing must report `waiting_for_process` without crashing.
6. Build/deploy scripts produce and install the C++ service without PyInstaller.

Until those milestones are complete, Python is a runtime dependency, not dead code.
