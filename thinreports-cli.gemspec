lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'thinreports/cli/version'

Gem::Specification.new do |spec|
  spec.name          = 'thinreports-cli'
  spec.version       = Thinreports::Cli::VERSION
  spec.authors       = ['Katsuya HIDAKA']
  spec.email         = ['hidakatsuya@gmail.com']
  spec.licenses      = ['MIT']

  spec.platform      = Gem::Platform::RUBY

  spec.summary       = 'Unofficial and Experimental Thinreports command-line tool'
  spec.description   = 'Unofficial and Experimental Thinreports command-line tool.'
  spec.homepage      = 'https://github.com/hidakatsuya/thinreports-cli'

  spec.files         = `git ls-files`.split("\n")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths = ['lib']

  spec.add_dependency 'thinreports', '~> 0.9.0'
  spec.add_dependency 'thor', '>= 0.19.0'

  spec.add_development_dependency 'bundler', '>= 1.0.0'
  spec.add_development_dependency 'rake', '>= 0'
end
