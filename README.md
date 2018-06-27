# OpenWrt Docker image

Start OpenWrt in a container. The init process is performed to start `ubusd` so
other applications may access the service.

## Tags

* `latest`: uses latest snapshot
* `stable`: uses latest release (17.03)
* `arm-latest`: uses latest arm64 snapshot


## root.tar.gz

The archive is needed to perform the following tasks:

* Create at least the folders `/var/lock` and `var/run` which cause e.g. `opkg`
  to fail when missing
* Manipulate `/var/preinit/00_preinit.conf` to stop the init process messing
  with the interface setup by Docker

Recreation of the tar archive via `tar czf root.tar.gz -C root .`.

## Using travis for rebuilds

Activate travis in your GitHub settings and setup `DOCKER_USERNAME` and
`DOCKER_PASSWORD`.
