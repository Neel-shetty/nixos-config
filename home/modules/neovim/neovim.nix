{ config, pkgs, ... }: {
  programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    extraPackages = with pkgs; [
      lua-language-server
      luajitPackages.lua-lsp
      gopls
      wl-clipboard
      rust-analyzer
      pyright
      marksman
    ];
    plugins = with pkgs.vimPlugins; [
      
    ];
  };

}
