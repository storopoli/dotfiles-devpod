{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "tools";
      paths = [
        bash-completion
	zellij
        neovim
	rust-analyzer
        nodejs_22
        fd
        ripgrep
        lazygit
      ];
    };
  };
}
