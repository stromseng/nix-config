Read https://github.com/Misterio77/nix-starter-configs?tab=readme-ov-file

### TODO

- Move packages to home manager
- Use zsh with p10k

# Usage

-   Run `sudo nixos-rebuild switch --flake .#hostname` to apply your system
    configuration.
    -   If you're still on a live installation medium, run `nixos-install --flake
.#hostname` instead, and reboot.
-   Run `home-manager switch --flake .#username@hostname` to apply your home
    configuration.
    -   If you don't have home-manager installed, try `nix shell nixpkgs#home-manager`.



# Getting started

Assuming you have a basic NixOS booted up (either live or installed, anything
works). [Here's a link to the latest NixOS downloads, just for
you](https://nixos.org/download#download-nixos).

Alternatively, you can totally use `nix` and `home-manager` on your existing
distro (or even on Darwin). [Install nix](https://nixos.org/download.html#nix)
and follow along (just ignore the `nixos-*` commands).

## I like your funny words, magic man

Not sure what this all means?

Take a look at [the learn hub on the NixOS
website](https://nixos.org/learn.html) (scroll down to guides, the manuals, and
the other awesome learning resources).

## The repo

- [Install git](https://nixos.wiki/wiki/git), if you haven't already.
- Create a repository for your config, for example:
```bash
cd ~/
git init nix-config
cd nix-config
```
- Make sure you're running Nix 2.4+, and opt into the experimental `flakes` and `nix-command` features:
```bash
# Should be 2.4+
nix --version
export NIX_CONFIG="experimental-features = nix-command flakes"
```
- Pull the repo
```
https://github.com/stromseng/nix-config.git
```

## Usage

- Run `sudo nixos-rebuild switch --flake .#hostname` to apply your system
  configuration.
    - If you're still on a live installation medium, run `nixos-install --flake
      .#hostname` instead, and reboot.
- Run `home-manager switch --flake .#username@hostname` to apply your home
  configuration.
  - If you don't have home-manager installed, try `nix shell nixpkgs#home-manager`.

And that's it, really! You're ready to have fun with your configurations using
the latest and greatest nix3 flake-enabled command UX.

## Adding more hosts or users

You can organize them by hostname and username on `hosts` and `home-manager`
directories, be sure to also add them to `flake.nix`.

You can take a look at this 
[configuration repo](https://github.com/misterio77/nix-config) for ideas.

## User password and secrets

You have basically two ways of setting up default passwords:
- By default, you'll be prompted for a root password when installing with
  `nixos-install`. After you reboot, be sure to add a password to your own
  account and lock root using `sudo passwd -l root`.
- Alternatively, you can specify `initialPassword` for your user. This will
  give your account a default password, be sure to change it after rebooting!
  If you do, you should pass `--no-root-passwd` to `nixos-install`, to skip
  setting a password on the root account.

If you don't want to set your password imperatively, you can also use
`passwordFile` for safely and declaratively setting a password from a file
outside the nix store.

There's also [more advanced options for secret
management](https://nixos.wiki/wiki/Comparison_of_secret_managing_schemes),
including some that can include them (encrypted) into your config repo and/or
nix store, be sure to check them out if you're interested.

## Dotfile management with home-manager

Besides just adding packages to your environment, home-manager can also manage
your dotfiles. I strongly recommend you do, it's awesome!

For full nix goodness, check out the home-manager options with `man
home-configuration.nix`. Using them, you'll be able to fully configure any
program with nix syntax and its powerful abstractions.

Alternatively, if you're still not ready to rewrite all your configs to nix
syntax, there's home-manager options (such as `xdg.configFile`) for including
files from your config repository into your usual dot directories. Add your
existing dotfiles to this repo and try it out!

## Adding custom packages

Something you want to use that's not in nixpkgs yet? You can easily build and
iterate on a derivation (package) from this very repository.

Create a folder with the desired name inside `pkgs`, and add a `default.nix`
file containing a derivation. Be sure to also `callPackage` them on
`pkgs/default.nix`.

You'll be able to refer to that package from anywhere on your
home-manager/nixos configurations, build them with `nix build .#package-name`,
or bring them into your shell with `nix shell .#package-name`.

See [the manual](https://nixos.org/manual/nixpkgs/stable/) for some tips on how
to package stuff.

## Adding overlays

Found some outdated package on nixpkgs you need the latest version of? Perhaps
you want to apply a patch to fix a behaviour you don't like? Nix makes it easy
and manageble with overlays!

Use the `overlays/default.nix` file for this.

If you're creating patches, you can keep them on the `overlays` folder as well.

See [the wiki article](https://nixos.wiki/wiki/Overlays) to see how it all
works.

## Adding your own modules

Got some configurations you want to create an abstraction of? Modules are the
answer. These awesome files can expose _options_ and implement _configurations_
based on how the options are set.

Create a file for them on either `modules/nixos` or `modules/home-manager`. Be
sure to also add them to the listing at `modules/nixos/default.nix` or
`modules/home-manager/default.nix`.

See [the wiki article](https://nixos.wiki/wiki/Module) to learn more about
them.

# Troubleshooting / FAQ

Please [let me know](https://github.com/Misterio77/nix-starter-config/issues)
any questions or issues you face with these templates, so I can add more info
here!

## Nix says my repo files don't exist, even though they do!

Nix flakes only see files that git is currently tracked, so just `git add .`
and you should be good to go. Files on `.gitignore`, of course, are invisible
to nix - this is to guarantee your build won't depend on anything that is not
on your repo.