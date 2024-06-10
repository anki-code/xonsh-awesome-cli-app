def test_say():
    out = $(xonsh mycli say hello).strip()
    assert out == 'Username say: hello'
