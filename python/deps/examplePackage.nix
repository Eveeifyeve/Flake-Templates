{ lib
, buildPythonPackage
, fetchPypi

# build-system
, setuptools-scm

# dependencies
, attrs
, pluggy
, py
, setuptools
, six

# tests
, hypothesis
 }:

buildPythonPackage rec {
  pname = "pytest";
  version = "3.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-z4Q23FnYaVNG/NOrKW3kZCXsqwDWQJbOvnn7Ueyy65M=";
  };

  postPatch = ''
    # don't test bash builtins
    rm testing/test_argcomplete.py
  '';

  build-system = [
    setuptools-scm
  ];

  dependencies = [
    attrs
    py
    setuptools
    six
    pluggy
  ];

  nativeCheckInputs = [
    hypothesis
  ];

  meta = {
    changelog = "https://github.com/pytest-dev/pytest/releases/tag/${version}";
    description = "Framework for writing tests";
    homepage = "https://github.com/pytest-dev/pytest";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ domenkozar lovek323 madjar lsix ];
  };
}