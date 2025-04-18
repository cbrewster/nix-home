{
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "tcld";
  version = "0.39.0";

  src = fetchFromGitHub {
    owner = "temporalio";
    repo = "tcld";
    rev = "v${version}";
    hash = "sha256-sDd1honohCOAak2LKknHXWUIoZBv7+p6gTWKjMnb5fM=";
  };

  vendorHash = "sha256-GOko8nboj7eN4W84dqP3yLD6jK7GA0bANV0Tj+1GpgY=";

  doCheck = false;
}
