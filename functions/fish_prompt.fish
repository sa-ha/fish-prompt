# by SHA-320
# prompt requires: git

# global settings
set -g __fish_git_prompt_showcolorhints 'yep'
set -g __fish_git_prompt_showdirtystate 'yep'
set -g __fish_git_prompt_showupstream 'auto'
set -g __fish_git_prompt_show_informative_status 'why not'

function fish_prompt
    set -l last_status $status

    set -l right_prompt (set_color magenta)'['(date +%H:%M)']' (set_color cyan)(prompt_pwd)

   	if git_is_repo
    	set -l stashed ''

    	if git_is_stashed
      		set stashed '(stashed)'
    	end

        if test $last_status -ne 0
            set pcolor $red
        end

    	set right_prompt $right_prompt (set_color green --bold)'('(git_branch_name)$stashed')'
  	end

    
    # line 1
  	echo $right_prompt

    # Git
    test $SSH_TTY
        and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test $USER = 'root'
        and echo (set_color red)"#"

    # line 2 (Main)
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
    set_color normal
end
