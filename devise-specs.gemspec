Gem::Specification.new do |s|
  s.name     = 'devise-specs'
  s.version  = '0.0.5'
  s.authors  = ['Andrii Ponomarov']
  s.email    = 'andrii.ponomarov@gmail.com'
  s.summary  = 'Generates the Devise acceptance tests.'
  s.homepage = 'https://github.com/ponosoft/devise-specs'
  s.license  = 'MIT'
  s.files    = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features|fixtures)/}) }

  s.required_ruby_version = '>= 2.5.0'

  s.add_runtime_dependency 'devise', '~> 4.8'

  s.add_development_dependency 'aruba', '~> 1.1', '>= 1.1.2'
  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
end
