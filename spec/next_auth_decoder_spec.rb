require_relative '../lib/next_auth_decoder/version'

RSpec.describe NextAuthDecoder do
  it 'has a version number' do
    expect(described_class::VERSION).not_to be nil
  end

  context 'correct decoding' do
    let(:token) { 'eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..VxVkx9tG5eLKexs-.GQ792tADkdL10q_EntQO6bu-QYgr2gIqx7RwfRzA7HkMMrQ8Bu5Bfgh5UjYnI6J9bnagd6C_eOoQTMypMkXynPX_ogEEwlxLZLTXgn2yFTIDZHFEyXlmV53_FRJ82BNoYLv76lVZuNJwYdID8R-2thjML2VE3AblcNn2KJNCreXMztPrN9-AwOlAHofK3Q.14-TZcu0Br4kS7IPWhlC8g' }
    let(:options) do
      {
        info: 'NextAuth.js Generated Encryption Key',
        secret: 'super-secret-key',
      }
    end

    subject { described_class::Token.new(token, options).decode }

    it 'should not raise errors' do
      expect { subject }.not_to raise_error
    end

    it 'should return correct `iat`' do
      expect(subject['iat']).to eql 1678818018
    end

    it 'should return correct `exp`' do
      expect(subject['exp']).to eql 1681410018
    end

    it 'should return correct `username`' do
      expect(subject['username']).to eql 'Test username'
    end

    it 'should return correct `email`' do
      expect(subject['email']).to eql 'test@email.com'
    end

    it 'should return correct `sub`' do
      expect(subject['sub']).to eql '2'
    end

    it 'should return correct `jti`' do
      expect(subject['jti']).to eql 'ef109254-6cc0-4939-8cd3-faf172cd790f'
    end
  end
end
