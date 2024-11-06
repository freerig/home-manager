{ pkgs, lib, inputs, secrets, ... }:

{
	imports = [
		./modules/modules.nix
	];
	
	# Oh yeah
	stylix.enable = true;
	stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
	stylix.image = ./WindowsXP.jpg;
	stylix.polarity = "dark";
	stylix.autoEnable = true;
	stylix.cursor.size = 24;
	
	# Home Manager needs a bit of information about you and the paths it should
	# manage.
	home.username = "${secrets.username}";
	home.homeDirectory = "/home/${secrets.username}";


	# The home.packages option allows you to install Nix packages into your

	# environment.
	home.packages = with pkgs; [
		lf
		fira-code-nerdfont
		radicale
		playerctl
		# blender
		docker-compose
		rustup

		spotify
		signal-desktop
		atlauncher

		tor-browser
		brave

		wl-clipboard-rs
		# clipboard-jh 	# didn't tried but it seems good

		ags
	];
	programs = {
		waybar.enable = true;
		bash.enable = true;
		kitty.enable = true;
	};

	gtk.enable = true;

	# Unfree packages
	nixpkgs.config.allowUnfreePredicate = pkg:
		builtins.elem (lib.getName pkg) [
			"spotify"
		];


	home.sessionVariables = {
		EDITOR = "nvim";
		BROWSER = "${pkgs.brave}/bin/brave";
		TERMINAL = "kitty";
	};


	# This value determines the Home Manager release that your configuration is
	# compatible with. This helps avoid breakage when a new Home Manager release
	# introduces backwards incompatible changes.
	#
	# You should not change this value, even if you update Home Manager. If you do
	# want to update the value, then make sure to first check the Home Manager
	# release notes.
	home.stateVersion = "24.05"; # Please read the comment before changing.
	programs.home-manager.enable = true;
}
