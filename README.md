# My dotfiles

Inspiration was taken from a variety of sources.  Many thanks to them all, and to the entire [dotfiles community](https://dotfiles.github.io/)!

After considerable research and experimentation, I have settled on a hybrid of the approaches described by [Dries Vints](https://driesvints.com/) in [this post](https://driesvints.com/blog/getting-started-with-dotfiles/) and his [dotfiles repository](https://github.com/driesvints/dotfiles), [Kevin Jalbert](https://kevinjalbert.com/) in [this post](https://kevinjalbert.com/synchronizing-my-dotfiles/) and his [dotfiles repository](https://github.com/kevinjalbert/dotfiles), and [Justin Searls](https://github.com/searls) in his [dotfiles repository](https://github.com/searls/icloud-dotfiles).

All of my configurations are stored in iCloud Drive to manage synchronization between machines.  This repository represents the subset of those configurations that I wish to publically share, made availble using [whitelisting in the .gitignore](.gitignore).

I use [Mackup](https://github.com/lra/mackup) to manage symlinking configuration files appropriately on each machine (via `mackup restore`), as well as backing up any new configurations (via `mackup backup`).  Mackup's concept of [custom configurations](https://github.com/lra/mackup/tree/master/doc#add-support-for-an-application-or-any-file-or-directory) allows incredible flexibility on what is backed up and syncronized.  Handling of supported applications can be overridden, and unsuported applications and/or files/directories can be added easily.

## Backup

To consider before a re-install:

- Commit and push any work in progress
- Save documents/files from non-iCloud directories
- Save data from apps not synced through iCloud
- Ensure that the [Brewfile](Brewfile) is up to date (_cf._ `brew bundle dump`)
- Update Mackup to the latest version and run `mackup backup`
- Ensure that any/all SSH keys are backed up and securely stored
- As a just-in-case last resort, clone the machine to an external drive ([SuperDuper!](https://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html) is fantastic)

## A Clean Install

Once everything is backed up, follow [this article](https://support.apple.com/en-us/HT201372) to make a do a clean install of the latest macOS version.

## Setting Up A New/Clean Mac

To get set up on a fresh macOS install:

- Perform any system updates
- Install Xcode

## References

In addition to those mentioned above, additional inspiration was drawn from the following:

- [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
- [Zach Holman](https://zachholman.com/) and his [dotfiles repository](https://github.com/holman/dotfiles)
- [Gareth Rees](https://zachholman.com/) and his [dotfiles repository](https://github.com/garethrees/dotfiles) plus [this gist](https://gist.github.com/garethrees/2470157)
