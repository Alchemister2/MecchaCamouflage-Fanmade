# Runtime architecture

The active runtime has two layers.

- Python orchestration in `src/`: process detection, F10 hotkey handling, Xenos injection, localhost bridge communication, progress polling, and JSONL/status logging.
- Native runtime in `native/`: injector plus injected bridge, SDK probing, paint/texture route execution, progress sidecar updates, and game SDK calls.

Python is retained in phase 1 because it owns operational behavior that is not yet implemented in C++.

A future C++-only service can remove Python only after it provides equivalent behavior:

- process watch and retry loop
- global F10 hotkey
- injector launch and bridge port sidecar handling
- progress/status/event logging
- no-game smoke behavior
- build/deploy integration
