Gem::Specification.new do |s|
  s.name     = 'devise-specs'
  s.version  = '0.0.1'
  s.authors  = ['Andrii Ponomarov']
  s.email    = 'andrii.ponomarov@gmail.com'
  s.summary  = 'Generates the Devise acceptance tests.'
  s.homepage = 'https://github.com/andrii/devise-specs'
  s.license  = 'MIT'
  s.files    = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features|fixtures)/}) }
  
  s.required_ruby_version = '>= 2.1.0'

  s.add_runtime_dependency 'devise', '~> 4.1'

  s.add_development_dependency 'rake', '~> 11.1'
  s.add_development_dependency 'aruba', '~> 0.14.1'
end
