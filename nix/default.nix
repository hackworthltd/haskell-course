{ system ? builtins.currentSystem
, crossSystem ? null
, config ? { }
, sourcesOverride ? { }
}:
let
  sources = import ./sources.nix // sourcesOverride;

  fixedHaskellHacknix =
    let
      try = builtins.tryEval <haskell-hacknix>;
    in
    if try.success
    then builtins.trace "Using <haskell-hacknix>" try.value
    else (sources.haskell-hacknix);

  haskellHacknix = import fixedHaskellHacknix {
    inherit system crossSystem config sourcesOverride;
  };
  inherit (haskellHacknix) fixedNixpkgs;
  inherit (haskellHacknix) nixpkgs;
  inherit (haskellHacknix) pkgs;

  self = {
    inherit sources;
    inherit fixedNixpkgs;
    inherit nixpkgs;
    inherit haskellHacknix;
    inherit pkgs;
  };

in
self
