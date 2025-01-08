{ stdenv
, fetchurl
, lib
, dpkg
}:

stdenv.mkDerivation rec {
  pname = "Replit";
  version = "1.0.7";

  src = fetchurl {
    url = "https://desktop.replit.com/download/deb";
    hash = "sha256-QAR5a6Jn1Ion/qtpd39/ZEOCVfNvOeSM8s2/Om6+dKk=";
  };

  unpackCmd = "${dpkg}/bin/dpkg-deb -x $curSrc .";

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -R usr $out/
    runHook postInstall
  '';

  preFixup = ''
    patchelf \
      --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
      $out/bin/replit
  '';
}
