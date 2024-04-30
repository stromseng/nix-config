{ buildGoModule
, cacert
, cairo
, cargo
, cargo-tauri
, esbuild
, fetchFromGitHub
, gdk-pixbuf
, gobject-introspection
, jq
, lib
, libsoup
, makeBinaryWrapper
, moreutils
, nodePackages
, openssl
, pango
, pkg-config
, rustc
, rustPlatform
, stdenv
, stdenvNoCC
, webkitgtk
}:

let

  esbuild-20-2 = let version = "0.20.2";
  in esbuild.override {
    buildGoModule = args:
      buildGoModule (args // {
        inherit version;
        src = fetchFromGitHub {
          owner = "evanw";
          repo = "esbuild";
          rev = "v${version}";
          hash = "sha256-h/Vqwax4B4nehRP9TaYbdixAZdb1hx373dNxNHvDrtY=";
        };
        vendorHash = "sha256-+BfxCyg0KkDQpHt/wycy/8CTG6YBA/VJvJFhhzUnSiQ=";
      });
  };

in stdenv.mkDerivation (finalAttrs: {
  pname = "surrealist";
  version = "2.0.3";

  src = fetchFromGitHub {
    owner = "surrealdb";
    repo = "surrealist";
    rev = "surrealist-v${finalAttrs.version}";
    hash = "sha256-+uOv/HyUitX4+XQc7SeueT0StEnI0v2Q9BgKyjH0m0k=";
  };

  sourceRoot = "${finalAttrs.src.name}/src-tauri";

  pnpm-deps = stdenvNoCC.mkDerivation {
    inherit (finalAttrs) src version;
    pname = "${finalAttrs.pname}-pnpm-deps";

    nativeBuildInputs = [ cacert jq moreutils nodePackages.pnpm ];

    installPhase = ''
      runHook preInstall

      export HOME=$(mktemp -d)
      pnpm config set store-dir $out
      pnpm install --frozen-lockfile --ignore-script

      # Remove timestamp and sort the json files
      rm -rf $out/v3/tmp
      for f in $(find $out -name "*.json"); do
        sed -i -E -e 's/"checkedAt":[0-9]+,//g' $f
        jq --sort-keys . $f | sponge $f
      done

      runHook postInstall
    '';

    outputHashMode = "recursive";

    # pnpm installs different native depenencies for rollup.js, depending on the platform
    outputHash = {
      x86_64-linux = "sha256-9QP48AK97694PE9ISD719BdNfzG+0/9JYkZJK6yStA8=";
      aarch64-linux = "sha256-2nr2RR4M6uRF3sne73DRvy+Kx1IC31KFkWx/KTmw0Mo=";
    }."${stdenv.hostPlatform.system}" or (throw
      "Unsupported system: ${stdenv.hostPlatform.system}");
  };

  ui = stdenvNoCC.mkDerivation {
    inherit (finalAttrs) src version;
    pname = "${finalAttrs.pname}-ui";

    ESBUILD_BINARY_PATH = "${lib.getExe esbuild-20-2}";

    nativeBuildInputs = [ nodePackages.pnpm ];

    buildPhase = ''
      runHook preBuild

      export HOME=$(mktemp -d)
      pnpm config set store-dir ${finalAttrs.pnpm-deps}
      pnpm install --offline --frozen-lockfile --ignore-script
      pnpm pkg set version=${finalAttrs.version}
      pnpm build

      runHook postBuild
    '';

    installPhase = ''
      runHook preInstall

      cp -r dist $out

      runHook postInstall
    '';
  };

  cargoDeps = rustPlatform.fetchCargoTarball {
    inherit (finalAttrs) src sourceRoot version;
    name = "${finalAttrs.pname}-${finalAttrs.version}";
    hash = "sha256-ZRdg4mNkw/kpi2R5CNBLuy6M4mPY2hy4jjMHelt8K7A=";
  };

  nativeBuildInputs = [
    cargo
    cargo-tauri
    makeBinaryWrapper
    pkg-config
    rustc
    rustPlatform.cargoSetupHook
  ];

  buildInputs =
    [ cairo gdk-pixbuf gobject-introspection libsoup openssl pango webkitgtk ];

  postPatch = ''
    substituteInPlace ./tauri.conf.json \
      --replace '"distDir": "../dist",' '"distDir": "${finalAttrs.ui}",' \
      --replace '"beforeBuildCommand": "pnpm build",' '"beforeBuildCommand": "",'
  '';

  postBuild = ''
    cargo tauri build --bundles deb
  '';

  postInstall = ''
    install -Dm555 target/release/bundle/deb/surrealist_${finalAttrs.version}_*/data/usr/bin/surrealist -t $out/bin
    cp -r target/release/bundle/deb/surrealist_${finalAttrs.version}_*/data/usr/share $out
  '';

  postFixup = ''
    wrapProgram "$out/bin/surrealist" --set WEBKIT_DISABLE_COMPOSITING_MODE 1
  '';

  meta = with lib; {
    description = "Surrealist is the ultimate way to visually manage your SurrealDB database";
    homepage = "https://surrealdb.com/surrealist";
    license = licenses.mit;
    mainProgram = "surrealist";
    maintainers = with maintainers; [ frankp ];
    platforms = platforms.linux;
  };
})