# sslocal-rust
A backup image to start sslocal

![Docker Pulls](https://img.shields.io/docker/pulls/petermatthew/sslocal-rust)
![Docker Image Size](https://img.shields.io/docker/image-size/petermatthew/sslocal-rust)
![Docker Image Version](https://img.shields.io/docker/v/petermatthew/sslocal-rust)

Build via Docker Compose, Source Repo: [shadowsocks-rust](https://github.com/shadowsocks/shadowsocks-rust/).

> There is a solution to deploy ssserver-rust and sslocal-rust to the local machine at the same time, located in the branch [proxy-rust](https://github.com/WilliamPeterMatthew/sslocal-manager-alpine/tree/proxy-rust)

## Step 1
Clone this repo.
```bash
git clone https://github.com/WilliamPeterMatthew/sslocal-manager-alpine.git -b sslocal-rust
```
## Step 2
Modify `.ssconfig.json` file like this.
```
  {
    "server": "ss.example.com",
    "server_port": 10080,
    "local_address": "0.0.0.0",
    "local_port": 1080,
    "password": "Password",
    "timeout": 300,
    "method": "aes-256-gcm"
  }

```

## Step 3
Modify or keep the ports in `docker-compose.yml` file (use `docker-compose-prebuild.yml` file if you want to use a pre-build version of the image instead of building locally) .

## Step 4
Run the project by executing the following command in the directory.
```bash
docker-compose up -d
```

You can also use a pre-built version of the image instead of building locally.
```bash
docker-compose -f docker-compose-prebuild.yml up -d
```

## Congratulations
Now you can access the server on the port you set in Step 2.
