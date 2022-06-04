# suse-bci-kiwix-serve
*kiwix-serve image using Suse's bci as base image.*

<br>

```console
docker run --rm -it -e "DOWNLOAD=https://download.kiwix.org/zim/wikipedia_bm_all.zim" -p 8080:80  smuse/suse-bci-kiwix-serve:3.2.0
```

## Build

```console
VERSION=3.2.0
docker build . --build-arg VERSION=$VERSION -t smuse/suse-bci-kiwix-serve:$VERSION
```


### Todo

- Figure out why `COPY --chmod 755` is not working.