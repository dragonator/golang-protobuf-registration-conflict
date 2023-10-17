clean:
	rm -rf proto/v1/gen
	rm -rf proto/v2/gen
	

proto: clean v1 v2

v1: PROTO_DIR:=proto/v1
v1: SOURCES:=$(shell find ${PROTO_DIR} -type f -iname "*.proto")
v1:
	mkdir -p ${PROTO_DIR}/gen
	protoc --go_out=${PROTO_DIR}/gen \
		--go_opt=paths=source_relative  \
		--go-grpc_out=${PROTO_DIR}/gen \
		--go-grpc_opt=paths=source_relative \
		-I ${PROTO_DIR} $(SOURCES)


v2: PROTO_DIR:=proto/v2
v2: SOURCES:=$(shell find ${PROTO_DIR} -type f -iname "*.proto")
v2:
	mkdir -p ${PROTO_DIR}/gen
	protoc --go_out=${PROTO_DIR}/gen \
		--go_opt=paths=source_relative  \
		--go-grpc_out=${PROTO_DIR}/gen \
		--go-grpc_opt=paths=source_relative \
		-I ${PROTO_DIR} $(SOURCES)