# Proxify
 
Provides a simple proxy for developing web apps on non-standard ports.

### Usage

Docker needs to be installed on the client machine. See for install instructions: https://docs.docker.com/engine/getstarted/step_one/

Run the following on the client machine:
```sh
git clone https://github.com/brennentsmith/proxify.git
cd proxify
./build.sh
./run.sh localhost:6379 
```

Ta-da! You now are able to access http://localhost and https://localhost on their native ports. 

### Backends

You can also use non-localhost entries for your backend. Essentially it has to follow the standard format of hostname:port. The port is optional, and please don't include the protocol. As of right now, Proxify doesn't support SSL backends.

```sh
./run.sh speedtest.net
./run.sh imgur.com:443
./run.sh 10.0.0.10:80
```

Proxify binds on all interfaces - so you can, assuming your firewall allows it, connect from an other device on your network to the proxy. *Likewise, if you are in a coffee shop, make sure your firewall is locked down!*

### Hostname Spoofing

Say you want to have speedtest.net direct to proxify, simply add the following entry to `/etc/hosts`:

```sh
127.0.0.1  www.speedtest.net speedtest.net
```

Now you can go to speedtest.net, and your requests will be routed through proxify (and thus, your backend).
