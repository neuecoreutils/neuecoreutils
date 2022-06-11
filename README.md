# neuecoreutils

![NCMainImage](./MediaAssets/NCHeader.svg)

neueCoreutils is a suite of utilities written in Swift meant to feel and act like bsdutils and the GNU coreutils.

neueCoreutils aims to be POSIX-compliant with some modifications.

## Compilation instructions

Attention: neuecoreutils is **beta software.** We will not offer warranty for any system-wide errors that has been caused by the installation of this software.

### **Prerequisites**
* Swift 5.6 toolchain
* Python 3 (for the script)
* Git (obviously)

First, clone the repository **in recursive mode.**.

```sh
$ git clone --recursive https://github.com/neuecoreutils/neuecoreutils.git
```
git will automatically fetch the different utility repositories on its own.

With the help of the given `nc.tool` script, we can then just invoke this script to compile automatically.

```sh
$ python3 nc.tool compile
```

And then to install, type `sudo nc.tool install`.

```
$ python3 nc.tool install
```
