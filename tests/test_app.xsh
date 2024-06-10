def test_say():
    out = $(xonsh --no-rc mycli say hello).strip()
    assert out == 'Username say: hello'
