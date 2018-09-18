
## Tor Proxy

Create a http gateway between a public service and a tor node, this is need because
it's not possible to create connections between a mobile device and a tor node.

Once this service is running, the mobile devices can make normal http request
to this service, and this requests will be redirect to the tor device configured.

### Usage


#### Build

```sh
docker build -t tor-proxy
```

#### Run


```sh
docker run -e TOR_NODE=<decodebox.onion> -p 9090:80 tor-proxy
```

*<decodebox.onion>* is the onion address of the decode box we want to connect.
