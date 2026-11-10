#!/usr/bin/env bash
# Claude Code status line — mirrors oh-my-posh theme (os / path / git / model / context)

input=$(cat)

# Path: shorten to last 2 segments, replace $HOME with ~
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
cwd="${cwd/#$HOME/~}"
# Keep last 2 path components (agnoster_short style)
path_display=$(echo "$cwd" | awk -F'/' '{
  n=NF
  if (n<=2) print $0
  else print $(n-1)"/"$n
}')

# Git branch from workspace (use git if available, fallback to worktree)
git_branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || echo "")
worktree_branch=$(echo "$input" | jq -r '.worktree.branch // empty')
branch="${git_branch:-$worktree_branch}"

# Model display name (shorten)
model=$(echo "$input" | jq -r '.model.display_name // ""')

# Context remaining
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Colors (ANSI, will appear dimmed in status line)
pink='\033[38;2;245;189;230m'
lavender='\033[38;2;183;189;248m'
blue='\033[38;2;138;173;244m'
gray='\033[38;2;172;176;190m'
yellow='\033[38;2;238;212;132m'
reset='\033[0m'

# Build status line
line=""

# Path segment
line+="${pink}${path_display}${reset}"

# Git branch segment
if [ -n "$branch" ]; then
  line+=" ${lavender} ${branch}${reset}"
fi

# Model segment
if [ -n "$model" ]; then
  line+=" ${gray}${model}${reset}"
fi

# Context segment
if [ -n "$remaining" ]; then
  remaining_int=$(printf '%.0f' "$remaining")
  if [ "$remaining_int" -le 20 ]; then
    ctx_color='\033[38;2;237;135;150m'  # red — low context
  elif [ "$remaining_int" -le 50 ]; then
    ctx_color="$yellow"
  else
    ctx_color="$blue"
  fi
  line+=" ${ctx_color}ctx:${remaining_int}%${reset}"
fi

printf "%b" "$line"
