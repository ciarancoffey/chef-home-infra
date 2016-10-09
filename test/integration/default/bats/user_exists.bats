#!/usr/bin/env bats

@test "user should exist" {
  run id bobl
  [ "$status" -eq 0 ]
}
