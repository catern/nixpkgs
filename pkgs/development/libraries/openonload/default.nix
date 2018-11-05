{ stdenv, fetchurl, writeText, python, nettools, perl, autoconf, automake, libtool, which }:

stdenv.mkDerivation rec {
  name = "openonload-${version}";
  version = "201805-u1";
  buildInputs = [ python nettools perl autoconf automake libtool which ];
  src = fetchurl {
    url    = "https://www.openonload.org/download/openonload-${version}.tgz";
    sha256 = "0mcl5bqva5srmnxjgj3sszqa1vgw6di7njhiymqa2f73gmj1k61i";
  };
  patches = [./install_dir.patch];
  postPatch = ''
  find . -type f -execdir sed -i s@/bin/pwd@pwd@ {} \;
  find . -type f -execdir sed -i s@/bin/ls@$(command -v ls)@ {} \;
  find . -type f -execdir sed -i 's@\#! \/@\#!/@' {} \;
  patchShebangs .
  '';
  buildPhase = ''
  ./scripts/onload_build --user
  '';
  installPhase = ''
  export i_prefix=$out
  export i_usrlibexec=$out/libexec/onload
  export i_libexec=$out/libexec/onload
  export i_sbin=$out/sbin
  export i_usrbin=$out/bin
  export i_usrsbin=$out/sbin
  export i_etc=$out/etc
  export i_include=$out/include
  export i_lib32=$out/lib32
  export i_lib64=$out/lib
  ./scripts/onload_install --userfiles --nosetuid rpm_install
  '';
}
