{ stdenv, fetchzip
, autoconf, automake, libtool, pkgconfig, autoreconfHook
}:

stdenv.mkDerivation rec {
  name = "sfork-${version}";
  version = "0.1.0";

  # needed for building from source
  buildInputs = [ autoconf automake libtool pkgconfig autoreconfHook ];

  src = ~/.local/src/sfork/c;

  meta = with stdenv.lib; {
    homepage = https://github.com/catern/sfork;
    description = "A synchronous, single-threaded interface for starting and customizing processes.";
    platforms = platforms.linux;
    license = licenses.gpl3;
    maintainers = with stdenv.lib.maintainers; [ catern ];
  };
}
