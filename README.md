## Steps to reproduce

### (Re)Build proto definitions:
```
make proto
```

### Run main:
```
go run main.go
```

#### Output:
```
$ go run main.go
panic: proto: file "common/common.proto" is already registered
        previously from: "github.com/dragonator/protobuf-namespace-conflict/proto/v1/gen/common"
        currently from:  "github.com/dragonator/protobuf-namespace-conflict/proto/v2/gen/common"
See https://protobuf.dev/reference/go/faq#namespace-conflict


goroutine 1 [running]:
google.golang.org/protobuf/reflect/protoregistry.glob..func1({0x100634708?, 0x14000102090?}, {0x100634708?, 0x140001020d0})
        /Users/tdraganov/.gvm/pkgsets/go1.21.2/global/pkg/mod/google.golang.org/protobuf@v1.31.0/reflect/protoregistry/registry.go:56 +0x1fc
google.golang.org/protobuf/reflect/protoregistry.(*Files).RegisterFile(0x1400012a018, {0x100637de0?, 0x1400014a1c0?})
        /Users/tdraganov/.gvm/pkgsets/go1.21.2/global/pkg/mod/google.golang.org/protobuf@v1.31.0/reflect/protoregistry/registry.go:130 +0x2f8
google.golang.org/protobuf/internal/filedesc.Builder.Build({{0x1005fadb9, 0x45}, {0x100758b60, 0x60, 0x60}, 0x0, 0x1, 0x0, 0x0, {0x1006348c8, ...}, ...})
        /Users/tdraganov/.gvm/pkgsets/go1.21.2/global/pkg/mod/google.golang.org/protobuf@v1.31.0/internal/filedesc/build.go:112 +0x1a0
google.golang.org/protobuf/internal/filetype.Builder.Build({{{0x1005fadb9, 0x45}, {0x100758b60, 0x60, 0x60}, 0x0, 0x1, 0x0, 0x0, {0x0, ...}, ...}, ...})
        /Users/tdraganov/.gvm/pkgsets/go1.21.2/global/pkg/mod/google.golang.org/protobuf@v1.31.0/internal/filetype/build.go:138 +0x15c
github.com/dragonator/protobuf-namespace-conflict/proto/v2/gen/common.file_common_common_proto_init()
        /Users/tdraganov/code/protobuf-reproduce/proto/v2/gen/common/common.pb.go:137 +0x144
github.com/dragonator/protobuf-namespace-conflict/proto/v2/gen/common.init.0()
        /Users/tdraganov/code/protobuf-reproduce/proto/v2/gen/common/common.pb.go:105 +0x1c
exit status 2
```

### With error as warning:
```
$ GOLANG_PROTOBUF_REGISTRATION_CONFLICT=warn go run main.go 
WARNING: proto: file "common/common.proto" is already registered
        previously from: "github.com/dragonator/protobuf-namespace-conflict/proto/v1/gen/common"
        currently from:  "github.com/dragonator/protobuf-namespace-conflict/proto/v2/gen/common"
See https://protobuf.dev/reference/go/faq#namespace-conflict

name:"v1"
name:"v2"
```