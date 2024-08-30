{ lib
, python3Packages
, fetchPypi
}:

python3Packages.buildPythonApplication rec {
  pname = "luigi";
  version = "2.7.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash  = "sha256-Pe229rT0aHwA98s+nTHQMEFKZPo/yw6sot8MivFDvAw=";
  };

  build-system = with python3Packages; [
    setuptools
  ];

  dependencies = with python3Packages; [
    tornado
    python-daemon
  ];

  meta = {
    # ...
  };
}