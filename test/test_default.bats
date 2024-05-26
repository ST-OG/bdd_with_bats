setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'

    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    PATH="$DIR/../:$PATH"
}


@test "can run file" {
   run demo_code.sh
   assert_output 'Im Good'
}

@test "can ping a website " {
   run demo_code.sh test_ping "www.google.com"
   assert_output --partial "0% packet loss"
}


@test "failure pinging a website " {
   run demo_code.sh test_ping "www.lhhbjkhggc.com"
   refute_output --partial "0% packet loss"
}