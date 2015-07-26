# Layman #

## Introduction ##
Layman is a tool designed to help automate management of your local repository of overlays you want included into your Gentoo system. Most of its documentation can be found on its [wiki](http://projects.gunnarwrobel.de/scripts/wiki/layman) or man page.

## Installing Layman ##
First thing you want to do is install layman if you haven't already got it installed.
```
emerge layman
```

In its default configuration Layman doesn't mangle your configuration files. However, telling portage where to find new overlays is a necessity (but will cause errors if you run portage with no overlays configured):
```
echo PORTDIR_OVERLAY=\"\" > /usr/portage/local/layman/make.conf
echo "source /usr/portage/local/layman/make.conf" >> /etc/make.conf
```

## Getting Layman to find gentoo-netscape ##
Once Layman is installed, you need to let it know the location of the gentoo-netscape layman config and add the overlay.
```
layman -f -o http://gentoo-netscape.googlecode.com/files/layman.xml -a netscape
```
The gentoo-netscape overlay is now available for you to use.

Check for future overlay updates by doing:
```
layman -s netscape
```
Now it is a case of installing your favourite Netscape software.  Doing the following will give you a listing
```
emerge -s netscape
```
Good Luck!

### Sources ###
Some of the information on this page was sourced from http://gentoo-wiki.com/TIP_Overlays which has more detail about Overlays in general and how to add additional overlays to your Gentoo installation.