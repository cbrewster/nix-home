{ pkgs, jj-github, ... }:

{
  home.packages = with pkgs; [
    jjui
    difftastic
    mergiraf
    jj-github.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Connor Brewster";
        email = "cbrewster@hey.com";
      };
      ui = {
        default-command = "log";
        diff-formatter = ["difft" "--color=always" "$left" "$right"];
        conflict-marker-style = "git";
      };
      template-aliases = {
        "format_short_change_id(id)" = "id.shortest(4)";
        "format_short_commit_id(id)" = "id.shortest(4)";
        prompt = ''
        separate(" ",
          format_short_change_id_with_hidden_and_divergent_info(self),
          format_short_commit_id(commit_id),
          if(empty, label("empty", "(empty)"), ""),
          if(description == "", label("description placeholder", "(no description)"), ""),
          if(description.contains("megamerge"), label("mega", "(mega)"), ""),
          if(description.starts_with("wip"), label("wip", "(wip)"), ""),
          if(description.starts_with("todo"), label("todo", "(todo)"), ""),
          if(description.starts_with("vibe"), label("vibe", "(vibe)"), ""),
          if(description.starts_with("mega"), label("mega", "(mega)"), ""),
          if(conflict, label("conflict", "(conflict)"), "")
        )
        '';
      };
      revset-aliases = {
        "closest_bookmark(to)" = "heads(::to & bookmarks())";
        "active(rev)" = "(ancestors(rev) | descendants(rev)) ~ immutable() ~ empty()";
        "stack" = "active(@-)";
      };
      templates = {
        git_push_bookmark = ''"cbrewster/push-" ++ change_id.short()'';
      };
      remotes = {
        origin = {
          auto-track-bookmarks = "glob:cbrewster/*";
        };
      };
      ui = {
        pager = "less -FRX";
      };
      aliases = {
        github = ["util" "exec" "--" "jj-github"];
      };
    };
  };
}
