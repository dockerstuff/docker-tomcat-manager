# Tomcat with Manager-GUI

Tomcat-8 containers do not the Manager app enables by default.
This container simply activates the default `webapps` and enables an admin user
to access those apps (e.g., `manager`).
The reason why the `manager`, `host-manager` and other interfaces are not
enabled by default is security. Very reasonable.

To not expose wildly sensitive information/apps through this container,
a simple system for assigning user/password to those management apps has
been implemented. See **How to use** section.

For more information about Tomcat and its Manager interface, check
* https://tomcat.apache.org/tomcat-8.5-doc/manager-howto.html

The actual modifications were based on the SO answers:
* https://stackoverflow.com/a/21743777/687896
* https://stackoverflow.com/a/36773669/687896

## How to use

The image created by this Dockerfile is at `chbrandt/tomcat-manager`,
it inherits from `tomcat:8` and so it exposes port `8080` by default.

When you run the image you will notice an output message providing
`user` and `password` strings. Those are the credentials to use in
`http://localhost:8080/manager` for instance. The default `user` name
is `tomcat`, `password` is randomly generated each time the container runs.

Simple example binding port `8080` to localhost:
```
$ docker run -it -p 8080:8080 chbrandt/tomcat-manager
```

### Give custom credentials

If you want to use your own credentials -- `user`/`password` -- you can
user variables:
* `TOMCAT_USER`
* `TOMCAT_PASSWORD`
during `docker run` call:

```
$ docker run -it -p 8080:8080 \
  -e TOMCAT_USER=admin \
  -e TOMCAT_PASSWORD=good-password \
  chbrandt/tomcat-manager
```
Where you set `admin` and `good-password` as username and password, resp.


# Further discussions

About tomcat default image not providing default webapps anymore
(which is undone by this container -- default apps are back here):
* https://github.com/docker-library/tomcat/issues/124
* https://github.com/docker-library/tomcat/pull/181

/.\

