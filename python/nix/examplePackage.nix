{ lib
, buildPythonPackage
, fetchPypi

# build-system
, setuptools-scm
 }:

buildPythonPackage rec {
  pname = "pytest";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = lib.fakeHash;
  };

  postPatch = ''
    # don't test bash builtins
    rm testing/test_argcomplete.py
  '';

  build-system = [
    setuptools-scm
  ];

  dependencies = [
    # Deps
  ];

  nativeCheckInputs = [
    # Testing PyTest
  ];

  meta = with lib; {
    description = "";
    homepage = "url";
    license = licenses.unlicense;
    maintainers = [];
  };
}