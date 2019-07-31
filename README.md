# EDirectInsure System

## Table of Contents

1. [Setup](#setup)
1. [Usage](#usage)
1. [Available Graphical Resources](#available-graphical-resources)
1. [Debug Mode](#debug-mode)
1. [Useful Commands](#useful-commands)
    1. [Removing all containers and volumes](#removing-all-containers-and-volumes)
    1. [Remove all images](#remove-all-images)
    1. [Running tests in all services](#running-tests-in-all-services)
    1. [Reinstall dependencies in all services](#reinstall-dependencies-in-all-services)

## Setup

- Create local config file:

```bash
$ cp fuge/env/system.env.sample fuge/env/system.env
```

- Install dependencies:

```bash
$ npm i
```

- Pre-requisite:

[Generate a SSH key for your GitHub account](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)

- Download services:

```bash
$ npm run services:download # or make
```

After running the command above, all services will be placed in `../edirectinsure-services/`

- Install services (running its dependencies):

```bash
$ npm run services:install # or make install
```

- Pull images and create containers and volumes:

```bash
$ npm run setup
```

## Usage

- Start Fuge process:

```bash
$ npm start
```

## Available Graphical Resources

- [Swagger Documentation](http://localhost:3000/documentation)

- [Redis Commander](http://localhost:8081/)

## Debug Mode

All services once up come with an IP address for debugging through **Chrome Dev Tools**.

Check out this [link](https://nodejsp.org/en/docs/guides/debugging-getting-started/) in order to see how it works.

For better usage through **Chrome Dev Tools** follow the steps below:

- Open a new tab on Chrome and write: `chrome://inspect`
- Click on `Open dedicated DevTools for Node`
- Go to `Connection` tab
- Click on `Add Connection` and add each IP address that comes with a service as a target
- Go to `Source` tab
- Click on `Filesystem` > `Add folder to workspace`, then select `edirectinsure-services` folder

## Useful Commands

### Removing all containers and volumes

```bash
$ npm run clean:docker:data
```

### Remove all images

```bash
$ npm run infra:down
```

### Running tests in all services

```bash
$ make test
```

### Reinstall dependencies in all services

```bash
$ npm run services:reinstall # or make reinstall
```
