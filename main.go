package main

import (
	"fmt"

	v1 "github.com/dragonator/protobuf-namespace-conflict/proto/v1/gen/common"
	v2 "github.com/dragonator/protobuf-namespace-conflict/proto/v2/gen/common"
)

func main() {
	var v1 v1.A
	var v2 v2.A

	v1.Name = "v1"
	v2.Name = "v2"

	fmt.Println(&v1)
	fmt.Println(&v2)
}
