<!-- markdownlint-disable -->

# Hardening Report: appleboy--lambda-action/v0.1.8

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `1`

Action **appleboy--lambda-action/v0.1.8** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The Dockerfile uses a mutable image tag `ghcr.io/appleboy/drone-lambda:1.3.5` instead of a SHA digest. Since action.yml uses `runs.using: 'docker'` with `image: 'Dockerfile'`, this base image is pulled at build time and is subject to supply-chain attacks if the tag is overwritten. It should be pinned to a full SHA256 digest, e.g. `ghcr.io/appleboy/drone-lambda@sha256:<64-hex-char-digest> # 1.3.5`.

Locations:

- `Dockerfile:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned the Dockerfile base image from the mutable tag `ghcr.io/appleboy/drone-lambda:1.3.5` to the immutable SHA256 digest `ghcr.io/appleboy/drone-lambda@sha256:032c5951365ca4e4e376c74eb41cf699413618696eed0111e5cc00d6eec0fbc3 # 1.3.5`. The original tag is preserved as a comment for readability.

