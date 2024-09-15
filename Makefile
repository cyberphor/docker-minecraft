.SILENT: build destroy

all: build

build:
	docker build --platform linux/arm64 -t minecraft-server:latest docker/ &&\
	docker run -d --name minecraft-server -p 1337:1337 -v ./docker/server.properties:/opt/minecraft-server/server.properties -v minecraft-server-world:/opt/minecraft-server/world minecraft-server:latest

destroy:
	docker container stop minecraft-server &&\
	docker system prune -af
