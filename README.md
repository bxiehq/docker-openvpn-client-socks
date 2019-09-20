# OpenVPN-client

This is a docker image of an OpenVPN client tied to a SOCKS proxy server.  It is
useful to isolate network changes (so the host is not affected by the modified
routing).

This supports directory style (where the certificates are not bundled together in one `.ovpn` file) and those that contains `update-resolv-conf`

## Usage

First, run `build` script to generate a Docker image which will be used in `start`.

Then, using `start` in this repository:
```bash
./start /path/to/openvpn-config-file
```

`/path/to/openvpn-config-file` will be mapped to `/openvpn.conf`. 

Alternatively, using `docker run` directly:

```bash
docker run -it --rm --device=/dev/net/tun --cap-add=NET_ADMIN \
    --name openvpn-client \
    --volume /your/openvpn/file:/openvpn.conf:ro -p 1081:1080 \
    openvpn-client-socks
```

Then connect to SOCKS proxy through through `localhost:1081`. For example:

```bash
curl --proxy socks5://localhost:1081 ipinfo.io
```
