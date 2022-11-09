{ pkgs, lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "grey";
  version = "v1.2.0";

  src = fetchFromGitHub {
    owner = "SierraSoftworks";
    repo = pname;
    rev = version;
    sha256 = "4Qj3c6CmkNlR1dp+WyvS9UlsydcN+rvo31gyRN4BKns=";
  };

  buildInputs = [pkgs.protobuf pkgs.openssl pkgs.pkg-config]
    ++ lib.optionals pkgs.stdenv.isDarwin [pkgs.darwin.apple_sdk.frameworks.Security];

  PROTOC = "${pkgs.protobuf}/bin/protoc";

  cargoHash = "sha256-fOMyyL+rlYNhloNhvwfJkj/iDq5alOoJYamwhxXJVTI=";

  meta = with lib; {
    description = "A lightweight, OpenTelemetry native, external synthetic probing agent.";
    homepage = "https://github.com/SierraSoftworks/grey";
    license = licenses.mit;
    maintainers = [ maintainers.notheotherben ];
  };
}