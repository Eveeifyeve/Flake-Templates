{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonApplication rec {
  pname = "name";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = lib.fakeHash;
  };

  build-system = with python3Packages; [
    setuptools
  ];

  dependencies = with python3Packages; [
    # Deps 
  ];

  meta = with lib; {
    description = "";
    homepage = "url";
    license = licenses.unlicense;
    maintainers = [];
  };
}