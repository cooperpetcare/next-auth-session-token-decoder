# NextAuth.js Session Token Decoder

If you ever find yourself in a situation where you need to decrypt the [NextAuth.js](https://next-auth.js.org/) session token on your Ruby backend, look no further than this gem. It’s specifically designed to make the decryption process easy and seamless. The source code for this library has been extracted from [Cooper Pet Care](https://cooperpetcare.com/)’s code base.

## Installation

```bash
gem install next-auth-session-token-decoder
```

## Usage

```ruby
token = 'eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..VxVkx9tG5eLKexs-.GQ792tADkdL10q_EntQO6bu-QYgr2gIqx7RwfRzA7HkMMrQ8Bu5Bfgh5UjYnI6J9bnagd6C_eOoQTMypMkXynPX_ogEEwlxLZLTXgn2yFTIDZHFEyXlmV53_FRJ82BNoYLv76lVZuNJwYdID8R-2thjML2VE3AblcNn2KJNCreXMztPrN9-AwOlAHofK3Q.14-TZcu0Br4kS7IPWhlC8g'

options = {
  info: 'NextAuth.js Generated Encryption Key',
  secret: 'super-secret-key',
}

NextAuthDecoder::Token.new(token, options).decode
=>
{
  "email"=>"test@email.com",
  "username"=>"Test username",
  "iat"=>1678818018,
  "exp"=>1681410018,
  "sub"=>"2",
  "jti"=>"ef109254-6cc0-4939-8cd3-faf172cd790f"
}
```

## RSpec

First install dependencies:

```bash
bundle install
```

Now you're ready to test it:

```bash
bundle exec rspec spec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cooperpetcare/next-auth-session-token-decoder.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
