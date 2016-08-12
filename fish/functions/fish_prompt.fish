function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

	set -l normal (set_color normal)

	# Hack; fish_config only copies the fish_prompt function (see #736)
	if not set -q -g __fish_classic_git_functions_defined
		set -g __fish_classic_git_functions_defined
		
		function __fish_repaint_status --on-variable fish_color_status --description "Event handler; repaint when fish_color_status changes"
			if status --is-interactive
				commandline -f repaint ^/dev/null
			end
		end

		function __fish_repaint_bind_mode --on-variable fish_key_bindings --description "Event handler; repaint when fish_key_bindings changes"
			if status --is-interactive
				commandline -f repaint ^/dev/null
			end
		end

		# initialize our new variables
		if not set -q __fish_classic_git_prompt_initialized
			set -qU fish_color_user; or set -U fish_color_user -o green
			set -qU fish_color_host; or set -U fish_color_host -o cyan
			set -qU fish_color_status; or set -U fish_color_status red
			set -U __fish_classic_git_prompt_initialized
		end
	end

	set -l color_cwd
	set -l prefix
	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
		set suffix '#'
	case '*'
		set color_cwd $fish_color_cwd
		set suffix '>'
	end

	set -l prompt_status
	if test $last_status -ne 0
		set prompt_status ' ' (set_color $fish_color_status) "[$last_status]" "$normal"
	end

  git_branch
  set -l git_color white
  if test $git_dirty_count -gt 0
    set git_color red
  end

	set -l mode_str
	switch "$fish_key_bindings"
	case '*_vi_*' '*_vi' '*vi*'
		# possibly fish_vi_key_bindings, or custom key bindings
		# that includes the name "vi"
		set mode_str (
			echo -n " "
			switch $fish_bind_mode
			case default
				set_color --bold green
				echo -n "[N]"
			case insert
				set_color --bold white
				echo -n "[I]"
			case visual
				set_color --bold magenta
				echo -n "[V]"
			end
			set_color normal
		)
	end

	echo -n -s $normal ' ' (set_color $color_cwd) (prompt_pwd) $normal 
  echo -n -s (set_color $git_color) (__fish_git_prompt) $normal $prompt_status "> "
end
