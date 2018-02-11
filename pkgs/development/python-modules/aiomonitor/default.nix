{ stdenv, buildPythonPackage, fetchPypi
, aioconsole, terminaltables}:

buildPythonPackage rec {
  pname = "aiomonitor";
  version = "0.3.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0yq7zvqbp3pmgazi4l8pl14kd09rcby364aw3k5kdrp9bn7pmxzl";
  };

  # tests require uvloop which isn't packaged yet
  doCheck = false;

  propagatedBuildInputs = [ aioconsole terminaltables ];

  meta = with stdenv.lib; {
    description = "aiomonitor adds monitor and python REPL capabilities for asyncio application";
    homepage = https://github.com/aio-libs/aiomonitor;
    license = licenses.apache2;
    maintainers = with lib.maintainers; [ catern ];
  };
}
