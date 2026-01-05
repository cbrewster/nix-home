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
    rev = "fa01211bc95ee3ca3863617aee2b84758115f4ee";
    hash = "sha256-HVr3DIphl1M+jM5ZPko3mBggA92yeHUMHj8rAavcz6Q=";
  };

  vendorHash = "sha256-RcoDXBsVMMJnGdAv0b8iNxcOhf/rnNZ8PDBx0w4u/kE=";

  doCheck = false;
}
