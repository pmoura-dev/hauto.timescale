IMAGENAME=hauto.timescale
CONTAINERNAME=hauto.timescale
PORT=5432

.PHONY: build run exec stop clean all

build:
	@docker build -t ${IMAGENAME} .

run:
	@docker run -d --name ${CONTAINERNAME} -p ${PORT}:${PORT} ${IMAGENAME}

exec:
	@docker exec -it ${CONTAINERNAME} bash

stop:
	@docker stop ${CONTAINERNAME}

clean:
	@docker rm ${CONTAINERNAME}
	@docker rmi ${IMAGENAME}

deploy:
	git tag -d $(tag)
	git push -d origin $(tag)
	git tag $(tag)
	git push origin $(tag)

