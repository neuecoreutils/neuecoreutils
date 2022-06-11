#!/usr/bin/env python3

# nc.tool - compile, clean, or install neuecoreutils.

import os
import subprocess
import sys

prefix = "/usr"

Target = [
    "cat",
    "cp",
    "ln",
    "ls",
    "mkdir",
    "mv",
    "rm",
    "touch",
    "uname",
    "whoami"]

def Clean():
    os.system("rm -r -f ./Binaries")
    for t in Target:
        os.system("rm -r -f ./{}/.build".format(t))
        print("removed {}.build".format(t))
print("Cleanup successful.")


def Compile():
    print("[*] Compiling neueCoreutils.")
    os.rmdir("./Binaries")
    os.mkdir("./Binaries")

    for t in Target:
        os.system('echo "Working on directory: $PWD"')
        os.chdir("./{}".format(t))
        print("[] changed directory to {}".format(t))
        os.system("swift build >/dev/null 2>&1")
        print("[] building {}".format(t))
        os.chdir(".build/debug")
        print("[] changed directory to .build/debug")

        os.system("cp -rf {} ../../../../Binaries >/dev/null 2>&1".format(t))
        print("[] copying file to Binaries")
        print("[+] Compiled {}".format(t))
        os.chdir("../../../../")

    print("[*] Compiled neueCoreutils.")
    exit(0)

def Install():
    print("Install beginning.")
    os.chdir("./Binaries")
    for t in Target:
        os.system("install -m 0755 {}/bin/{} >/dev/null 2>&1".format(prefix, t))

def Checks():
    print("[*] checking for a valid swift install...")
    rc = subprocess.call(['which', 'swift'])
    if rc == 0:
        print("Swift not found in PATH!")
        exit(1)
    else:
        print("    [+] Swift found.")
    
    print("[*] checking for a valid version of install...")
    rc = subprocess.call(['which', 'install'])
    if rc == 0:
        print("install not found in PATH!")
        exit(1)
    else:
        print("    [+] install found.")
    
av = sys.argv
ac = len(sys.argv)

if ac == 2 and av[1] == "clean":
    Clean()
elif ac == 2 and av[1] == "compile":
    Compile()
elif ac == 2 and av[1] == "install":
    Install()
elif ac == 2 and av[1] == "checks":
    Checks()
else:
    print("""
Usage:
    {} clean
    {} compile
    {} checks
    {} install
    """.format(av[0], av[0], av[0], av[0]))
    exit(1)

