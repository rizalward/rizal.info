# ЯBOWZR Ubuntu Touch updates

This channel updates only the ARM64 Ubuntu Touch face served by the local
ЯBOWZR server. The native launcher, permissions, Heart, and OS image are not
part of the artifact and do not require a rebuild for these updates.

The Pixel updater checks `updates/index.json`, downloads the declared archive
with Python HTTPS, verifies size and SHA-256, stages it, and atomically
promotes `face/active/` on the next launcher start. A previous tree remains
available for rollback.

The separate [standalone image build](image/README.md) pins the verified
`0.1.0-ut3` face payload and refuses checksum or device-input mismatches.
