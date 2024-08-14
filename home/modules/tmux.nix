{ pkgs, config, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    terminal = "screen-256color";
    baseIndex = 1;
    historyLimit = 406000;
    shortcut = "a";
    mouse = true;
    sensibleOnTop = true;
    extraConfig = ''
      # bind -r h select-pane -l  # move left
      # bind -r j select-pane -d  # move down
      # bind -r k select-pane -u  # move up
      # bind -r l select-pane -r  # move right
      bind > swap-pane -D       # swap current pane with the next one
      bind < swap-pane -U       # swap current pane with the previous one

      # Use Alt-arrow keys WITHOUT PREFIX KEY to switch panes
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D
      bind -n S-h previous-window
      bind -n S-l next-window
      bind -n C-T new-window

      bind -r H resize-pane -L 2
      bind -r J resize-pane -D 2
      bind -r K resize-pane -U 2
      bind -r L resize-pane -R 2

      set -g pane-base-index 1

      # splitting panes
      bind '|' split-window -h -c '#{pane_current_path}'
      bind - split-window -v -c '#{pane_current_path}'
      unbind '"'
      unbind %

      # open new panes in current path
      # bind c new-window -c ' #{pane_current_path}'
      bind-key c new-window -c "#{pane_current_path}"

      # Set window name to folder name
      set-option -g status-interval 5
      set-option -g automatic-rename on
      set-option -g automatic-rename-format '#{b:pane_current_path}'
    '';
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];
    
  };
}
