{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Connor Brewster";
    userEmail = "cbrewster@hey.com";

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };

    ignores = [
      ".venv"
      ".direnv"
      ".cache"
      "**/.claude/settings.local.json"
    ];

    aliases = {
      fixup = "!f() { TARGET=$(git rev-parse \"$1\"); git commit --fixup=$TARGET \${@:2} && EDITOR=true git rebase -i --autostash --autosquash $TARGET^; }; f";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --numstat";
      dl = "!git ll -1";
      dlc = "diff --cached HEAD^";
      co = "checkout";
      cob = "checkout -b";
      ec = "config --global -e";
      ac = "!git add -A && git commit -m";
      amend = "commit -a --amend";
      s = "status";
      f = "fetch -p";
      bclean = "!f() { git branch --merged \${1-master} | grep -v '\\\${1-master}' || xargs -n 1 git branch -d; }; f";
    };
  };
}
