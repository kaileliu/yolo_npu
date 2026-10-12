#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
VERSION="${YOLO_NPU_RELEASE:-v1.0.0}"
ASSET_URL="https://github.com/kaileliu/yolo_npu/releases/download/${VERSION}/yolo_npu-rk3588-assets.tar.gz"
TMP_FILE="${TMPDIR:-/tmp}/yolo_npu-rk3588-assets.tar.gz"

command -v curl >/dev/null 2>&1 || { echo "error: curl is required" >&2; exit 1; }
curl -fL "$ASSET_URL" -o "$TMP_FILE"
tar -xzf "$TMP_FILE" -C "$ROOT"
echo "[download] extracted RKNN models and runtime into $ROOT"
