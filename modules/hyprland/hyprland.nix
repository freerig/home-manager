{pkgs, ...}: {
	home.packages = with pkgs; [
		grim
		swappy
		slurp

		hyprpicker
		hyprsunset
		# hyprpaper
	];
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;
		settings = {
			"$mod" = "SUPER";

			general = {
			};

			monitor = ["DVI-D-1,preferred,auto,auto,transform,0"];

			env = [
				"HYPRCURSOR_SIZE,48"
			];

			input = {
				kb_layout = "fr";
				numlock_by_default = true;
			};

			animations = {
				bezier = "windows, 0.05, 0.9, 0.1, 1.05";
				animation = [
					"windows, 1, 3, windows"
					"windowsOut, 1, 7, default, popin 80%"
					"border, 1, 10, default"
					"borderangle, 1, 8, default"
					"fade, 1, 7, default"
					"workspaces, 1, 2, default, slidevert"
				];
			};

			misc = {
				force_default_wallpaper = false;
			};

			dwindle = {
				preserve_split = true;
			};

			bind = [
				"$mod, Return, exec, kitty --hold fastfetch"
				"$mod, B, exec, $BROWSER"
				", Print, exec, grim -g \"$(slurp -d)\" - | swappy -f -"

				# Windows managing

				"$mod, Backspace, killactive,"
				"$mod, V, togglefloating,"
				"$mod, P, pseudo,"
				"$mod, H, togglesplit,"

				# Workspaces navigation

				"$mod, mouse_down, workspace, e-1"
				"$mod, mouse_up, workspace, e+1"

				"$mod, page_up, workspace, e-1"
				"$mod, page_down, workspace, e+1"

				"$mod SHIFT, page_up, movetoworkspace, e-1"
				"$mod SHIFT, page_down, movetoworkspace, e+1"
				
				"$mod, K, workspace, -1"
				"$mod, J, workspace, +1"

				"$mod SHIFT, K, movetoworkspace, -1"
				"$mod SHIFT, J, movetoworkspace, +1"

				"$mod, left, movefocus, l"
				"$mod, right, movefocus, r"
				"$mod, up, movefocus, u"
				"$mod, down, movefocus, d"

				# Misc

				"$mod, C, exec, hyprpicker -a"
			]
			++ (
				# workspaces
				# binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
				builtins.concatLists (builtins.genList (i:
					let ws = i + 1;
					in [
						"$mod, code:1${toString i}, workspace, ${toString ws}"
						"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
					]
				)
				9)
			);

			bindm = [
				# Windows managing

				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
				"$mod SHIFT, mouse:273, resizewindow 1"
			];
		};
	};
	services.hyprpaper.enable = true;
}
