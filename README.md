基于 Ubuntu 22.04 构建的 Docker 中 Laravel 运行环境。

## 编译

`docker-compose build`

## 启动镜像

1：在宿主机上创建一个目录用于持久化 Laravel 程序，例如：`mkdir ~/laravel`。

2：`docker run -p 8000:8000 -v ~/laravel:/var/www/html/laravel --name laravel -itd celaraze/laravel-docker`

3：宿主机的 `~/laravel` 中放置你的 Laravel 程序文件即可，例如：

```shell
cd ~/laravel
git clone https://github.com/foo/bar.git .
cp .env.example .env
```

4：访问 `http://localhost:8000`。

## 自定义镜像

根据 `Dockerfile` 中的提示修改后执行 `docker-compose build` 即可。