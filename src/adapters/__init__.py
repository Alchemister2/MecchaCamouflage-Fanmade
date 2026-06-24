"""Adapter layer for paint execution backends."""

from .base import AdapterError, ApplyResult, PaintAdapter
from .noop import NoopAdapter
from .xenos_stub import XenosBridgeAdapter, XenosStubAdapter

__all__ = [
    "AdapterError",
    "ApplyResult",
    "PaintAdapter",
    "NoopAdapter",
    "XenosBridgeAdapter",
    "XenosStubAdapter",
]
