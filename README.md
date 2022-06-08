# suse-bci-kiwix-serve
*kiwix-serve image using Suse's bci as base image.* [Docker Hub](https://registry.hub.docker.com/r/smuse/suse-bci-kiwix-serve)

<br>

Serve remote zim file, this will download the file first.
```console
docker run --rm -it -e "DOWNLOAD=https://download.kiwix.org/zim/ \
 wikipedia_bm_all.zim" -p 8080:80  smuse/suse-bci-kiwix-serve:3.2.0
```

Serve local zim file. 
```console
docker run --rm -it -v /path-to-your-zim-files:/data \
 -w /data -p 8080:80 smuse/suse-bci-kiwix-serve:3.2.0 \
  ethiopianfolktales.zim
```

Serve all zim files in the current directory . 
```console
docker run --rm -it -v $(pwd):/data \
 -w /data -p 8080:80 smuse/suse-bci-kiwix-serve:3.2.0 *
```


Serve local zim file in the background. 
```console
docker run -d --restart=on-failure -v /path-to-your-zim-files:/data \
 -w /data  -p 8080:80 --name=kiwix-serve \
 smuse/suse-bci-kiwix-serve:3.2.0 ethiopianfolktales.zim
```

## Build

```console
VERSION=3.2.0
docker build . --build-arg VERSION=$VERSION -t smuse/suse-bci-kiwix-serve:$VERSION
```

Multi arch build (x64 and aarch64)
```console
VERSION=3.2.0
docker buildx build . --push --platform linux/arm64/v8,linux/amd64 \
 --build-arg VERSION=$VERSION --tag smuse/suse-bci-kiwix-serve:$VERSION
```

- Currently there is no `arm 32` image support for `smuse/suse-bci-kiwix-serve` as the base image we used doesn't provide an arm 32 arch image.

### todo

- Figure out why `COPY --chmod 755` is not working.