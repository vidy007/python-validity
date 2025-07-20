# Python-validity for Gentoo
# Development paused -- not enough knowledge

## How to add using eselect/repository
```
# install app-eselect/eselect-repository
emerge --ask app-eselect/eselect-repository
mkdir -p /etc/portage/repos.conf
# enable vidy overlay
eselect repository enable vidy-overlay
# sync vidy overlay
emaint sync -r vidy-overlay
```
## How to use without systemd
Tested only on Gentoo OpenRC!
See issues [#80](https://github.com/uunicorn/python-validity/issues/80) and [#67](https://github.com/uunicorn/python-validity/issues/67#issuecomment-1682346902) (from the original uunicorn's repo)
