<!-- markdownlint-disable -->

# Hardening Report: appleboy--lambda-action/v0.2.0

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **appleboy--lambda-action/v0.2.0** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The workflow file .github/workflows/ci.yml references GitHub Actions using mutable tag refs instead of full 40-character SHA commit hashes. This exposes the workflow to supply-chain attacks if the upstream action tag is moved or compromised. Failing references: `uses: actions/checkout@v4` (line 11) and `uses: actions/setup-go@v5` (line 13). These should be pinned to their full SHA digests, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v4`.

Locations:

- `.github/workflows/ci.yml:11`
- `.github/workflows/ci.yml:13`

### missing-permissions (severity: medium)

The workflow file .github/workflows/ci.yml has no top-level `permissions:` key and the only job (`deploy_zip`) also has no job-level `permissions:` key. Without explicit permissions, the workflow inherits the default repository permissions (which may include `contents: write` and other broad scopes). A minimal permissions block such as `permissions: {}` or specific scopes (e.g. `contents: read`) should be added.

Locations:

- `.github/workflows/ci.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

In .github/workflows/ci.yml: (1) Added top-level `permissions: {}` to restrict default token permissions. (2) Pinned `actions/checkout@v4` to full SHA `34e114876b0b11c390a56381ad16ebd13914f8d5` with `# v4` comment. (3) Pinned `actions/setup-go@v5` to full SHA `40f1582b2485089dde7abd97c1529aa768e1baff` with `# v5` comment.

