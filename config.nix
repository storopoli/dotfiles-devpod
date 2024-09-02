{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "tools";
      paths = [
        bash-completion
        gnupg
        neovim
        nodejs_22
        fd
        ripgrep
        git
        fzf
        lazygit
        gh
	zellij
        just
        rustup
        python3
	rust-analyzer
        clang
        uv
        poetry
        pyright
        ruff
        bash-language-server
        shellcheck
        shfmt
        vscode-langservers-extracted
        typescript-language-server
        lua-language-server
        marksman
        taplo
        yaml-language-server
        codespell
      ];
    };
  };
}
