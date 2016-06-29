#!/usr/bin/env bats

@test "elixir bin exists and is in the PATH" {
  command -v elixir
}

@test "iex bin exists and is in the PATH" {
  command -v iex
}

@test "simple elixir command test" {
  result="$(elixir /vagrant/tests/two_plus_two.exs)"
  [ "$result" = "4" ]
}
