{ llm-agents, pkgs, ... }:

{
  home.packages = with llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    opencode
    claude-code
    claude-agent-acp
    codex
    codex-acp
    pi
  ];
}


