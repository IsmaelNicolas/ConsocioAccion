package utils

import (
	"encoding/hex"

	"golang.org/x/crypto/sha3"
)

func GennerateSHA3(data string) string {
	buf := []byte(data)
	h := make([]byte, 64)
	sha3.ShakeSum256(h, buf)
	password := hex.EncodeToString(h)
	return password
}
