{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, sfork
, cffi
, pkgconfig
}:

buildPythonPackage {
  pname = "sfork";
  version = "0.1.0";
  disabled = pythonOlder "3.6";

  src = ~/.local/src/sfork/python;

  buildInputs = [ sfork pkgconfig ];
  propagatedBuildInputs = [ cffi ];

  meta = {
    description = "A Python API for starting and initializing processes using a contextmanager.";
    homepage = https://github.com/catern/sfork;
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ catern ];
  };
}
