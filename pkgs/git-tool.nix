{ pkgs, lib, fetchFromGitHub, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "git-tool";
  version = "v3.4.0";

  src = fetchFromGitHub {
    owner = "SierraSoftworks";
    repo = pname;
    rev = version;
    sha256 = "3mkJRRNVCyASYPk0AevzB7WoGf1jiawMUkZ5nIVk51o=";
  };

  doCheck = false;

  nativeBuildInputs = [pkgs.protobuf pkgs.pkg-config];

  buildInputs = [pkgs.openssl]
    ++ lib.optionals pkgs.stdenv.isDarwin [pkgs.darwin.apple_sdk.frameworks.Security];

  PROTOC = "${pkgs.protobuf}/bin/protoc";

  cargoHash = "sha256-s5QAt8w1nC+9s+cQS3XlMZRKBuwCwBRU5KWh4dDTo0k=";

  meta = with lib; {
    description = "Simplified Git repository management from your command line.";
    homepage = "https://git-tool.sierrasoftworks.com";
    license = licenses.mit;
    maintainers = [ maintainers.notheotherben ];
  };
}