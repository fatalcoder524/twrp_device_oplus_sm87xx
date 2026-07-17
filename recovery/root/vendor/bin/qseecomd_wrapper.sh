#!/system/bin/sh

log_msg() {
    echo "[qseecomd-wrapper] $1"
    echo "[qseecomd-wrapper $1" > /dev/kmsg 2>/dev/null || true
}

if getprop twrp.se.no_sb | grep -q "true"; then
    log_msg "Taking Non-Strongbox: qseecomd"
    exec /vendor/bin/qseecomd_no_sb "$@"
else
    log_msg "Taking Strongbox: qseecomd"
    exec /vendor/bin/qseecomd "$@"
fi