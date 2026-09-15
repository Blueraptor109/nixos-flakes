{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    zen-browser.url = "github:youwen5/zen-browser-flake";

    # optional, but recommended if you closely follow NixOS unstable so it shares
    # system libraries, and improves startup time
    # NOTE: if you experience a build failure with Zen, the first thing to check is to remove this line!
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    # ...
};
  outputs = { self, nixpkgs, zen-browser }: {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
         modules = [ ./configuration.nix ];
    };
  };
}
