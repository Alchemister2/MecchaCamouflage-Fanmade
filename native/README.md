# native route policy

## Active routes

| Route | Status | Purpose |
| --- | --- | --- |
| `texture_sync_strict_probe` | Default candidate | Import generated texture through SDK, then dispatch runtime texture sync RPC candidates. Fast multi candidate; remote verification still required. |
| `front_atlas_paint_stream` | Explicit fallback | Build CPU texture atlas, then apply through replicated `ServerPaintBatch`. No texture import is allowed, but it is slow. |
| `front_sample_paint_stream` | Explicit diagnostic | Replicated paint API sample route. |
| `front_metallic_texture_paint_stream` | Explicit diagnostic | Metallic/base paint experiment through replicated paint API. |
| `texture_atlas_paint_api_stream` | Explicit diagnostic | Full atlas experiment through replicated paint API. |
| `cpu_mesh_raycast`, `cpu_mesh_probe_only`, `cpu_mesh_texture_paint_stream` | Gated candidates | CPU mesh/raycast work. Must not use memory-scan fallback or local-only texture import. |

## Removed local-only routes

The following routes are intentionally not exposed through the public CLI/default dispatch because they mutate only local texture state and do not prove multiplayer behavior:

- `texture_import_diagnostic`
- `texture_color_transfer_probe`
- `front_metallic_texture_import_diagnostic`
- `metallic_base_then_front_texture_import_diagnostic`
- `cpu_mesh_texture_import_diagnostic`

## Hard rules

- Default F10 uses `texture_sync_strict_probe`; `front_atlas_paint_stream` is explicit fallback only.
- `ImportChannelFromBytes` is allowed only inside `texture_sync_strict_probe`.
- `texture_sync_strict_probe` must fail before local import when no sync RPC is available.
- Local-only import, material swap, synthetic UV placement, and memory-scan fallback are forbidden.
- Texture artifacts such as `atlas_preview.ppm`, `import_bytes_preview.ppm`, `coverage_mask.pgm`, and `rgb_stats.json` may be produced for debugging without mutating game state.
- Remote multiplayer success requires a remote peer observation; local import or local hash change is not sufficient.
