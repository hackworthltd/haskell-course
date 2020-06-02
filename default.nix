{ system ? builtins.currentSystem
, crossSystem ? null
, config ? {
    allowBroken = true;
    allowUnfree = true;
  }
, sourcesOverride ? { }
, pkgs ? (import nix/default.nix {
    inherit system crossSystem config sourcesOverride;
  }
  ).pkgs
}:
let
  inherit (pkgs.haskell-hacknix.lib)
    collectTests collectChecks filterByPrefix;

  inherit (pkgs.haskell-hacknix)
    cabalProject cache shellFor;

  src = pkgs.gitignoreSource ./.;


  isLocalPackage = filterByPrefix "haskell-course";

  mkSet = args:
    let
      haskellPackages = cabalProject args;
      shell = shellFor haskellPackages { };
      cachedShell = cache shell;
      tests = collectTests isLocalPackage haskellPackages;
      checks = collectChecks isLocalPackage haskellPackages;
    in
    pkgs.recurseIntoAttrs {
      inherit haskellPackages shell cachedShell tests checks;
    };

  args = {
    compiler-nix-name = "ghc883";
    inherit src;
    pkg-def-extras =
      [ (hackage: { alex = hackage.alex."3.2.5".revisions.default; }) ];
  };
  ghc883 = mkSet args;

in
{
  inherit ghc883;
}
