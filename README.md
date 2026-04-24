# Welcome to Freedesktop SDK

[Freedesktop SDK](https://freedesktop-sdk.io/) is a free, community-developed, and open-source project with a number of components that help you simplify the process of creating different software artifacts. More common use cases include building containers, Flatpak runtimes, snaps, or complete operating systems.

The Freedesktop SDK project is not an endorsement of a particular platform or selection of technologies by the Freedesktop organization.
The SDK aims to support a common interoperable platform for projects such as GNOME, KDE, and Flatpak by providing integration and validation of a shared set of dependencies.

## Documentation

Visit the [Freedesktop SDK documentation portal](https://freedesktop-sdk.gitlab.io/documentation/) to find out more about the project and its use cases:

- [Getting started](https://freedesktop-sdk.gitlab.io/documentation/getting-started/)
- [Using the SDK](https://freedesktop-sdk.gitlab.io/documentation/using-the-sdk/)
- [Contributing to the SDK](https://freedesktop-sdk.gitlab.io/documentation/contributing/)
- [Troubleshooting](https://freedesktop-sdk.gitlab.io/documentation/troubleshooting/)

## Acknowledgements

This project wouldn't be possible without the work of a few individuals and
groups, and we would like to take a moment to thank them:

- Alex Larsson, who not only gave us [Flatpak](https://flatpak.org) but also the original [Freedesktop SDK](https://github.com/flatpak/freedesktop-sdk-images) (versions 1.2 to 1.6).
- The wider Flatpak community, of which we are only a small part, and who constantly help us.
- The [BuildStream](https://buildstream.build/) community, who gave the world this amazing tool that makes building and maintaining our project so easy and fun.
- Dodji Seketeli, who wrote [libabigail](https://sourceware.org/libabigail/), which allows us to ensure we do not break apps, and tirelessly works with us on fixing any bug we encounter.
- [Codethink](https://www.codethink.co.uk/), for assigning some of their engineers' time to this project.
- [OSU Open Source Lab](https://osuosl.org/) for the x86 runners.
- [Equinix (formerly packet)](https://www.equinix.com/) for the aarch64 runners.

## Building with buildstream (cause it's weird)

First you need to [install buildstream.](https://buildstream.build/install.html)

On Arch I also needed to install `python-tomlkit`. You might need to install other things as well, my system already had a lot of build tools and whatnot.

Now you can actually build. Get ready, because this is going to use at least 20GB of storage :)

When I did it, I just ran `make` and it worked. `¯\_(ツ)_/¯`

I probably could have set 
```
MAKE_OPTS="-j`nproc`"
```
but whatever.

Hope you're okay with leaving your machine running for a while, cause this took 3 hours and 20 minutes on a machine that takes ~20 minutes to compile a fully featured linux kernel (With ThinLTO) for the PS4. 3 hours of that was apparently just downloading??? The 20 minutes was the actual build.

Now that the build is finally done, you get to export the built files to a flatpak repository. Don't worry, it's easy.

Just run `bst artifact checkout flatpak-release-repo.bst --directory repo`

Now there's a `repo` folder that you can copy to your PS4 and add as a flatpak source with `flatpak remote-add --user --no-gpg-verify ps4mesa repo`

Then it's pretty easy to install the patched mesa files by running `flatpak install --user ps4mesa org.freedesktop.Platform.GL.default`
You probably want both `25.08` and `25.08-extra`.

Flatpak will probably complain that you already have org.freedesktop.Platform.GL.default installed. It's fine, just remove the flathub one and then installed the patched one. It (probably) won't make you uninstall all your flatpak apps :) 
## I am not responsible if it uninstalls your apps btw.
