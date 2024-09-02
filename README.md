# Devpod Dotfiles

Slimmed-down dotfiles to use in Devpods

## Setup

```bash
devpod ide use none # we will use neovim
devpod provider add docker # or any other provider
devpod context set-options default -o TELEMETRY=false # all your data
devpod context set-options default -o GPG_AGENT_FORWARDING=true
devpod context set-options default -o SSH_INJECT_GIT_CREDENTIALS=true
devpod context set-options -o DOTFILES_URL=git@github.com:storopoli/dotfiles-devpod.git
```

## Devcontainers

Choose a devcontainer from the [templates](https://github.com/devcontainers/images/tree/main/src):

- Minimal: `mcr.microsoft.com/devcontainers/base:[debian|ubuntu|alpine]`
- Python: `mcr.microsoft.com/devcontainers/python`
- Go: `mcr.microsoft.com/devcontainers/go`
- Rust: `mcr.microsoft.com/devcontainers/rust`
- Node: `mcr.microsoft.com/devcontainers/typescript-node`
- C++: `mcr.microsoft.com/devcontainers/cpp`
- Full Boat (Ubuntu): `mcr.microsoft.com/devcontainers/universal`

All of the above are Debian-based except the `minimal` and the `universal`.

Feature-wise you should have the
[`devcontainers-contrib/features/neovim-homebrew`](https://github.com/devcontainers-contrib/features/tree/main/src/neovim-homebrew):

```json
{
  "image": "mcr.microsoft.com/devcontainers/base:debian",
  "features": {
    "ghcr.io/devcontainers-contrib/features/neovim-homebrew:1": {}
  }
}
```

Then you can add any other [feature](https://containers.dev/features) you want.

## Deploy

Once you run [`devpod`](https://devpod.sh/docs) with something like:

```bash
devpod up . --provider docker --dotfiles git@github.com:storopoli/dotfiles-devpod.git
```

the `dotfiles` will be cloned and the [`setup`](./setup) script will be executed.


## Nix Option

If you are planning to run this setup in an Apple Silicon using a Docker provider,
you cannot install Homebrew since it is not supported on Linux ARM architectures.
Hence, you need [Nix](https://nixos.org).

Just replaced the `neovim-homebrew` feature with the `nix` feature:

```json
{
  "image": "mcr.microsoft.com/devcontainers/base:debian",
  "features": {
    "ghcr.io/devcontainers/features/nix:1": {}
  }
}
```

and make the proper changes in the [`setup`](./setup) script.
Just uncomment the:

```bash
nix-env -iA nixpkgs.myPackages
```

and comment out everything after that.

## Modifying the Environment

If you somehow want to modify the package list that you have available in your
environment, you can modify the [`config.nix`](./config.nix) file
(or change the list of `packages` in the [`setup`](./setup) script)
and run the [`setup`](./setup) script again.
