{
  lib,
  rustPlatform,
}:
rustPlatform.buildRustPackage {
  pname = "tun-rs";
  version = "0.1.0";

  src = with lib.fileset; toSource {
    root = ../..;
    fileset = unions [
      ../../src
      ../../Cargo.lock
      ../../Cargo.toml
    ];
  };

  cargoLock.lockFile = ../../Cargo.lock;

  meta = with lib; {
    license = licenses.agpl3Plus;
    maintainers = with maintainers; [ frontear ];
    platforms = platforms.linux;
  };
}