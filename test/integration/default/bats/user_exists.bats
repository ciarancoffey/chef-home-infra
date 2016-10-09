#!/usr/bin/env bats

@test "user should exist" {
  run id bobl
  [ "$status" -eq 0 ]
}


@test "user home_dir should exist" {
  run stat /home/bobl
  [ "$status" -eq 0 ]
}

@test "user is part of uucp" {
  run bash -c "id  bobl| grep uucp"
  [ "$status" -eq 0 ]
}
