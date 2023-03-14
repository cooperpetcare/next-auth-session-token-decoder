require 'openssl'
require 'jose'
require 'hkdf'

module NextAuthDecoder
  class InvalidDecryptionParams < StandardError; end
  class Token
    def initialize(token, info: '', secret: ENV['NEXT_AUTH_SECRET'], length: 32)
      @token = token
      @info = info
      @length = length
      @secret = secret
    end

    def decode
      raise error if invalid?
      JOSE::JWT
        .decrypt(jwk_secret, @token)
        .first
        .fields
        .to_h
    rescue OpenSSL::Cipher::CipherError
      puts 'Error: Decryption error.'
      nil
    end

    private

    def jwk_secret
      @jwk_secret ||= JOSE::JWK.from_oct(encrypted_secret)
    end

    def encrypted_secret
      @encrypted_secret ||=
        HKDF.new(@secret, info: @info).read(@length)
    end

    def invalid?
      @token.empty? || @info.nil? || @secret.nil?
    end

    def error
      InvalidDecryptionParams.new('Error: Invalid decryption params')
    end
  end
end
