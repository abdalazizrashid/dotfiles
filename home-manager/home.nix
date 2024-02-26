{ config, pkgs, lib, ... }:

let
  fromGitHub = ref: repo:
    pkgs.vimUtils.buildVimPlugin {
      pname = "${lib.strings.sanitizeDerivationName repo}";
      version = ref;
      src = builtins.fetchGit {
        url = "https://github.com/${repo}.git";
        ref = ref;
      };
    };
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    # If you are not running an unstable channel of nixpkgs, select the corresponding branch of nixvim.
    ref = "nixos-23.11";
  });
  user = builtins.getEnv ("USER");

in {
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
    }))
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = user;
  home.homeDirectory = builtins.getEnv ("HOME");

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    awscli
    python3
    ripgrep
    sd
    fd
    tree
    fzf
    docker
    curl
    bat
    man
    tmux
    tree-sitter
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/aziz/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "nvim"; LC_ALL="en_US.UTF-8"; LANG="en_US.UTF-8"; };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.bash.enable = false;
  programs.zsh.enable = false;
  programs.starship.enable = true;

  programs.git = {
    enable = true;
    userEmail = "abdalaziz.rashid@outlook.com";
    userName = "abdalazizrashid";
    delta.enable = true;

    extraConfig.alias = {
      st = "status --short --untracked-files=no";
      fuckme = "reset --hard HEAD";
      fuckyou = "push --force";
      please = "push --force-with-lease";
    };
  };

  imports = [
    # For home-manager
    nixvim.homeManagerModules.nixvim
    # For NixOS
    #nixvim.nixosModules.nixvim
    # For nix-darwin
    #nixvim.nixDarwinModules.nixvim
    #    "${home.homeDirectory}/.config/tmux.nix"
  ];
  # Neovim settings
  programs.nixvim = {
    enable = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      updatetime = 100;
      fileencoding = "utf-8";
    };
    filetype.extension.typ = "typst";
    highlight = { Comment.fg = "#ff0000"; };
    #colorscheme.gruvbox = true;
    keymaps = [
      {
        key = ";";
        action = ":";
      }
      {
        mode = "n";
        key = "<leader>m";
        options.silent = true;
        action = "<cmd>!make<CR>";
      }
      #      {
      #        key = "jk";
      #        action = "<Esc>";
      #      }
    ];
    plugins = {
       lsp = {
       enable = true;
        servers = {
          lua-ls.enable = true;
          pyright.enable = true;
          rnix-lsp.enable = true;
          html.enable = true;
          tsserver.enable = true;
        };
        keymaps = {
          diagnostic = {
            "<leader>j" = "goto_next";
            "<leader>k" = "goto_prev";
          };
          lspBuf = {
            K = "hover";
            gD = "references";
            gd = "definition";
            gi = "implementation";
            gy = "type_definition";
          };
        };
      };

      harpoon = {
        enable = true;
        keymaps = {
          addFile = "<leader>a";
          toggleQuickMenu = "<C-e>";
        };
      };
      telescope = {
        enable = true;
        defaults.file_ignore_patterns = [ "^.git/" ];
#        keymaps = {
#          "<leader>ff" = "find_file";
#          "<leader>fg" = "live_grep";
#          "<leader>fb" = "buffers";
#          "<leader>fh" = "help_tags";
#          "<C-p>" = {
#            action = "git_files";
#            desc = "Telescope Git Files";
#          };
#        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      ctrlp
      editorconfig-vim
      nerdtree
      tabular
      vim-nix
      vim-markdown
      nvim-treesitter.withAllGrammars
      plenary-nvim
    ];
    extraConfigLua = ''

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
      
      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
      
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
      
      -- Telescope
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    '';
  };
  programs.tmux = {
    enable = true;
    keyMode = "vi";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      gruvbox
      cpu
      pain-control
      fpp
      {
        plugin = resurrect;
        extraConfig = let
          resurrectPrograms' =
            [ "vi" "~vim->vim" "~nvim->nvim" "less" "more" "man" ];
          sep = " ";
          hasWhiteSpaces = p:
            (builtins.match ''
              .*[ 
              	].*'' p) != null;
          escapeProg = p: if (hasWhiteSpaces p) then ''"${p}"'' else p;
          resurrectPrograms =
            lib.concatMapStringsSep sep escapeProg resurrectPrograms';
        in ''
          set -g @ressurect-processes '${resurrectPrograms}'
          set -g @resurrect-strategy-vim 'session'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '30'
        '';
      }
    ];
  };
  # TODO: what if this is defined in another file? Merge it!
  programs.fish = {
      enable = true;
      shellInit = ''
      '';
    };
  #
  # Let Home Manager install and manage itself.
  # users.users.${user} = { programs.fish.enable = true; };
  programs.home-manager = {
    enable = true;
    # TODO: find a way to not hardcode the username
    #   users.aziz = {
    #     programs.fish.enable = true;
    #   };
  };
}
