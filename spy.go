package main

import (
	"flag"
	"net"
	"os"
	"time"
)

var network = flag.String(
	"network",
	"tcp",
	"network type to dial with (e.g. unix, tcp)",
)

var addr = flag.String(
	"addr",
	":8080",
	"address to dial",
)

var timeout = flag.Duration(
	"timeout",
	1*time.Second,
	"dial timeout",
)

func main() {
	flag.Parse()

	port := os.Getenv("NETIN_PORT")
	if len(port) != 0 {
		*addr = "127.0.0.1:" + port
	}

	conn, err := net.DialTimeout(*network, *addr, *timeout)
	if err != nil {
		println(err.Error())
		os.Exit(1)
	}

	conn.Close()

	println("ok")
	os.Exit(0)
}
