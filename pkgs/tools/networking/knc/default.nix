{ stdenv, fetchurl, libkrb5 }:

stdenv.mkDerivation rec {
  name = "knc-${version}";
  version = "1.7.1";

  src = fetchurl {
    url = "http://oskt.secure-endpoints.com/downloads/knc-${version}.tar.gz";
    sha256 = "03z47pkzivdfly2wyqrnyswknr3xsvncpgj98y0y2a2j58zqf90f";
  };

  buildInputs = [ libkrb5 ];
  configureFlags = [ "--enable-developer" ];

  meta = with stdenv.lib; {
    homepage = http://oskt.secure-endpoints.com/knc.html;
    description = "KNC is Kerberised NetCat";
    license = licenses.mit;
    maintainers = with maintainers; [ catern ];
    platforms = platforms.linux;
  };
}
