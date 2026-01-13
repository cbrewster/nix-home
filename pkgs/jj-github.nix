{
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule {
  pname = "jj-github";
  version = "0.0.0";

  src = fetchFromGitHub {
    owner = "cbrewster";
    repo = "jj-github";
    rev = "87e08d83eb4ff0dbd4079e79df43bbf97ca9282a";
    hash = "sha256-z4116ttpZmn66TyIGwQfOPBHJ3TZoqju9EPIheTsl0E=";
  };

  vendorHash = "sha256-lmcuaQ2yj/4CBQW4lwf2oKRfO6ip4MhBnI85dNqdfIw";

  doCheck = false;
}
