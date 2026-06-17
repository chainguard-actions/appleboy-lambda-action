<!-- markdownlint-disable -->

# Hardening Report: appleboy--lambda-action/v0.1.9

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **appleboy--lambda-action/v0.1.9** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The Dockerfile used by this Docker action pulls a base image using a mutable tag rather than an immutable SHA digest. `FROM ghcr.io/appleboy/drone-lambda:1.3.6` uses the tag `1.3.6`, which can be silently replaced with different (potentially malicious) content at any time. It should be pinned to a full SHA256 digest, e.g. `FROM ghcr.io/appleboy/drone-lambda@sha256:<64-hex-char-digest> # 1.3.6`.

Locations:

- `Dockerfile:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Dockerfile base image from `ghcr.io/appleboy/drone-lambda:1.3.6` to `ghcr.io/appleboy/drone-lambda@sha256:5e5a2689782a3722fa0e0cdda6c0f532b64abe17c02d0b6e12197792687e3e48 # 1.3.6`. The mutable tag is now replaced with an immutable digest, preventing silent replacement of the image content.

