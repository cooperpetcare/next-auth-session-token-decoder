# -*- encoding: utf-8 -*-

$:.push File.expand_path('../lib', __FILE__)
require 'next_auth_decoder/version'
require 'next_auth_decoder/token'

Gem::Specification.new do |spec|
  spec.name = 'next-auth-session-token-decoder'
  spec.version = NextAuthDecoder::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ['Andrey Bayburin']
  spec.email = ['hello@cooperpetcare.com']

  spec.summary = 'NextAuth session token decoder'
  spec.description = 'NextAuth session token decoder'
  spec.homepage = 'https://cooperpetcare.com/engineering/next-auth-session-token-decoder/'
  spec.license = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org/'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/cooperpetcare/next-auth-session-token-decoder'
  # spec.metadata['changelog_uri'] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .github])
    end
  end
  spec.bindir = 'bin'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.7.5'

  spec.add_dependency('jose', '~> 1.1.3')
  spec.add_dependency('hkdf', '~> 1.0.0')
  spec.add_development_dependency('rake', '~> 13.0')
  spec.add_development_dependency('rspec', '~> 3.12')
end
