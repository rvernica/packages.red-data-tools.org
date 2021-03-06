# README

https://packages.red-data-tools.org/ provides packages for Red Data
Tools related projects including Apache Arrow and Apache Parquet.

## Supported packages

  * Apache Arrow C++
  * Apache Arrow GLib (C API)
  * Apache Parquet C++
  * Parquet GLib (C API)

## Supported platforms

There are packages for the following platforms:

  * Debian GNU/Linux stretch
  * Ubuntu 14.04 LTS
  * Ubuntu 16.04 LTS
  * Ubuntu 17.04
  * Ubuntu 17.10
  * CentOS 6
  * CentOS 7

## Package repository

https://packages.red-data-tools.org/ provides packages. You need to
enable the package repository before you install packages.

### Debian GNU/Linux

Install `apt-transport-https` to support HTTPS APT repository:

```console
% sudo apt install -y -V apt-transport-https
```

Run the following command lines to add apt-lines for APT repository on
packages.red-data-tools.org:

```console
% sudo apt install -y -V lsb-release
% cat <<APT_LINE | sudo tee /etc/apt/sources.list.d/red-data-tools.list
deb https://packages.red-data-tools.org/debian/ $(lsb_release --codename --short) main
deb-src https://packages.red-data-tools.org/debian/ $(lsb_release --codename --short) main
APT_LINE
```

Run the following command lines to enable APT repositories on
packages.red-data-tools.org:

```console
% sudo apt update --allow-insecure-repositories
% sudo apt install -y -V --allow-unauthenticated red-data-tools-keyring
% sudo apt update
```

### Ubuntu

Install `apt-transport-https` to support HTTPS APT repository:

```console
% sudo apt install -y -V apt-transport-https
```

Run the following command lines to add apt-lines for APT repository on
packages.red-data-tools.org:

```console
% sudo apt install -y -V lsb-release
% cat <<APT_LINE | sudo tee /etc/apt/sources.list.d/red-data-tools.list
deb https://packages.red-data-tools.org/ubuntu/ $(lsb_release --codename --short) universe
deb-src https://packages.red-data-tools.org/ubuntu/ $(lsb_release --codename --short) universe
APT_LINE
```

Run the following command lines to enable APT repositories on
packages.red-data-tools.org:

```console
% sudo apt update --allow-insecure-repositories || sudo apt update
% sudo apt install -y -V --allow-unauthenticated red-data-tools-keyring
% sudo apt update
```

### CentOS

```console
% sudo yum install -y https://packages.red-data-tools.org/centos/red-data-tools-release-1.0.0-1.noarch.rpm
```

## Apache Arrow C++

This section describes how to install
[Apache Arrow C++](https://github.com/apache/arrow/tree/master/cpp)
package.

### Debian GNU/Linux

```console
% sudo apt install -y -V libarrow-dev
```

### Ubuntu

```console
% sudo apt install -y -V libarrow-dev
```

### CentOS

```console
% sudo yum install -y --enablerepo=epel arrow-devel
```

## Apache Arrow GLib (C API)

This section describes how to install
[Apache Arrow GLib](https://github.com/apache/arrow/tree/master/c_glib)
package.

### Debian GNU/Linux

```console
% sudo apt install -y -V libarrow-glib-dev
```

### Ubuntu

```console
% sudo apt install -y -V libarrow-glib-dev
```

### CentOS 7

```console
% sudo yum install -y --enablerepo=epel arrow-glib-devel
```

## Apache Parquet C++

This section describes how to install
[Apache Parquet C++](https://github.com/apache/parquet-cpp) package.

### Debian GNU/Linux

```console
% sudo apt install -y -V libparquet-dev
```

### Ubuntu

```console
% sudo apt install -y -V libparquet-dev
```

### CentOS

```console
% sudo yum install -y --enablerepo=epel parquet-devel
```

## Parquet GLib

This section describes how to install
[Parquet GLib](https://github.com/red-data-tools/parquet-glib) package.

### Debian GNU/Linux

```console
% sudo apt install -y -V libparquet-glib-dev
```

### Ubuntu

```console
% sudo apt install -y -V libparquet-glib-dev
```

### CentOS 7

```console
% sudo yum install -y --enablerepo=epel parquet-glib-devel
```

## For packages.red-data-tools.org administrator

### How to deploy

```console
% sudo apt install -V ansible
% rake deploy
```

## For package creators

### Debian GNU/Linux and Ubuntu

Here are command lines to build .deb files and update APT repository:

```console
% git submodule update --init
% rake apt
```

### CentOS

Here are command lines to build .rpm files and update Yum repository:

```console
% git submodule update --init
% rake yum
```

## License

Apache-2.0

Copyright 2017 Kouhei Sutou \<kou@clear-code.com\>

See LICENSE and NOTICE for details.
