{ stdenv, fetchurl }:

stdenv.mkDerivation rec {

  name = "supervise-${version}";
  version = "1.0.0";

  src = fetchurl {
    url = "https://github.com/catern/supervise/archive/v${version}.tar.gz";
    sha256 = "0xjsn782bkw01brnk1cqh8l9isp6nxkl2cv2a9d7l7ci2d5gyi8f";
  };

  builder = builtins.toFile "builder.sh" ''
    source $stdenv/setup
    tar xvfz $src
    cd supervise-${version}
    make
    mkdir -p $out/bin
    cp supervise unlinkwait -t $out/bin
  '';


  meta = {
    homepage = https://github.com/catern/supervise;
    description = "A minimal unprivileged process supervisor making use of modern Linux features";
    platforms = stdenv.lib.platforms.linux;
    license = stdenv.lib.licenses.gpl3;
  };
}
