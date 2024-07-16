# Devpod Dotfiles

Slimmed-down dotfiles to use in Devpods

## Setup

```bash
devpod ide use none # we will use neovim
devpod provider add docker
devpod context set-options default -o TELEMETRY=false
devpod context set-options default -o GPG_AGENT_FORWARDING=true
devpod context set-options -o DOTFILES_URL=https://github.com/storopoli/dotfiles-devpod
```

All your `devcontainers.json` should have Nix:

```json
"features": {
  "ghcr.io/devcontainers/features/nix:1": {}
}
```

