# ssserver-rust
A backup image to start ss-server

![Docker Pulls](https://img.shields.io/docker/pulls/petermatthew/ssserver-rust)
![Docker Image Size](https://img.shields.io/docker/image-size/petermatthew/ssserver-rust)
![Docker Image Version](https://img.shields.io/docker/v/petermatthew/ssserver-rust)

Build via Docker Compose, Source Repo: [shadowsocks-rust](https://github.com/shadowsocks/shadowsocks-rust/).

> There is a solution to deploy ss-rust and ss-manager to the local machine at the same time, located in the branch [proxy_local](https://github.com/WilliamPeterMatthew/sslocal-manager-alpine/tree/proxy_local)

## Step 1
Clone this repo.
```bash
git clone https://github.com/WilliamPeterMatthew/sslocal-manager-alpine.git -b ssserver-rust
```

## Step 2
Modify or keep the ports in `docker-compose.yml` file (use `docker-compose-prebuild.yml` file if you want to use a pre-build version of the image instead of building locally) .

## Step 3
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
