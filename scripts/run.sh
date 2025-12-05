#!/usr/bin/env bash

export QEMU_NET_OPTS="hostfwd=tcp::2222-:22,hostfwd=tcp::3000-:3000,hostfwd=tcp::4317-:4317,hostfwd=tcp::4318-:4318,hostfwd=tcp::55680-:55680,hostfwd=tcp::55681-:55681,hostfwd=tcp::9411-:9411,hostfwd=tcp::14250-:14250,hostfwd=tcp::14268-:14268,hostfwd=tcp::9090-:9090,hostfwd=tcp::9095-:9095,hostfwd=tcp::9096-:9096,hostfwd=tcp::3100-:3100,hostfwd=tcp::3200-:3200,hostfwd=tcp::8080-:8080,hostfwd=tcp::8081-:8081"
nix run .#nixosConfigurations.otlp-server.config.system.build.vm -- -nographic
