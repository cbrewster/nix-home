{ llm-agents, pkgs, ... }:

{
  home.packages = with llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    opencode
    claude-code
    claude-code-acp
    codex
    codex-acp
  ];
}


