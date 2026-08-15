<!-- markdownlint-disable -->

# Hardening Report: appleboy--lambda-action/v0.1.9

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **appleboy--lambda-action/v0.1.9** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The workflow file .github/workflows/ci.yml uses mutable tag-based refs instead of pinned 40-character SHA commit hashes. Specifically: `uses: actions/checkout@v3` and `uses: actions/setup-go@v4`. These tags can be moved to point to different (potentially malicious) commits without notice, creating a supply-chain risk.

Locations:

- `.github/workflows/ci.yml:11`
- `.github/workflows/ci.yml:13`

### missing-permissions (severity: medium)

The workflow file .github/workflows/ci.yml has no top-level `permissions:` key, and the only job (`deploy_zip`) also has no job-level `permissions:` key. Without explicit permissions, the workflow inherits the default repository permissions (which may include broad write access), violating the principle of least privilege.

Locations:

- `.github/workflows/ci.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

1. Pinned actions/checkout@v3 to SHA a37ce9120846195fa4ece8f58b268e6043cb2f26 and actions/setup-go@v4 to SHA 7b8cf10d4e4a01d4992d18a89f4d7dc5a3e6d6f4, preserving the original tags as inline comments. 2. Added top-level `permissions: {}` to deny all permissions by default, and a job-level `permissions: { contents: read }` for the deploy_zip job (minimum required for checkout).

