{...}:
{
	programs.nixvim = {
		enable = true;
		plugins = {
			# Editor
			which-key.enable = true;
			telescope = {
				enable = true;
				keymaps = {
					"<leader> " = { action = "find_files"; };
				};
			};
			neo-tree = {
				enable = true;
				window = {
					mappings = {
						"l" = "open";
						"h" = "close_node";
					};
				};
			};
			notify.enable = true;
			noice.enable = true;


			# Code
			todo-comments.enable = true;
			indent-blankline.enable = true;

			lsp = {
				enable = true;
				servers = {
					nil_ls.enable = true;
					rust_analyzer.enable = true;
					lua_ls.enable = true;
					arduino_language_server.enable = true;
				};
				keymaps = {
					lspBuf = {
						"K" = { action = "hover"; };
						"<leader>ca" = { action = "code_action"; };
					};
				};
			};

			cmp = {
				enable = true;
				autoEnableSources = true;
				settings = {
					sources = [
						{ name = "nvim_lsp"; }
						{ name = "path"; }
						{ name = "buffer"; }
					];
					mapping = {
						"<C-Space>" = "cmp.mapping.complete()";
						"<C-d>" = "cmp.mapping.scroll_docs(-4)";
						"<C-e>" = "cmp.mapping.close()";
						"<C-f>" = "cmp.mapping.scroll_docs(4)";
						"<Tab>" = "cmp.mapping.confirm({ select = true })";
						"<S-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
						"<S-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
					};
				};
			};
			

			# Other
			web-devicons.enable = true;
		};
		keymaps = [
			{
				mode = "n";
				key = "<leader>e";
				action = "<cmd>Neotree<CR>";
			}
		];
		
		opts = {
			tabstop = 2;
			shiftwidth = 2;

			number = true;
			relativenumber = true;
		};
		globals.mapleader = " ";
		clipboard.providers.wl-copy.enable = true;
		clipboard.register = "unnamedplus";
	};
}
