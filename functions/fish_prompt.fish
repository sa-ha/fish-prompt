# by SHA-320
# prompt requires: git

# Options
set __fish_git_prompt_showcolorhints 'yes'
#set __fish_git_prompt_showuntrackedfiles "informative"
set __fish_git_prompt_char_dirtystate '+'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

function fish_prompt
    set -l last_status $status

    set -l right_prompt (set_color magenta)'['(date +%H:%M)']' (set_color cyan)(prompt_pwd)
    set_color normal

   	if git_is_repo
        # git user name
        #set git_user (git config --get user.name) 2> /dev/null
        # git current repository
        set git_repo basename -s .git (git config --get remote.origin.url) 2> /dev/null
    	set right_prompt $right_prompt (set_color normal)'['(set_color blue)(git config --get user.name 2> /dev/null)/($git_repo)(set_color normal)']'
        # offical git prompt
        set right_prompt $right_prompt (fish_git_prompt)
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

function fish_right_prompt
    
end
