mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir := $(dir $(mkfile_path))

build_image:
	docker build --tag patents_playground_image .

run:
	docker run --name patents_playground \
	           -p 8888:8888 -v ${mkfile_dir}/src:/home/patents/src \
			   --platform linux/amd64 \
			   -d patents_playground_image 

	timeout 3
	docker logs --tail 50 patents_playground

stop:
	docker stop patents_playground

start:
	docker start patents_playground