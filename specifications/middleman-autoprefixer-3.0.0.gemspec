# -*- encoding: utf-8 -*-
# stub: middleman-autoprefixer 3.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "middleman-autoprefixer".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dominik Porada".freeze, "Thomas Reynolds".freeze]
  s.date = "2021-05-18"
  s.email = ["dominik@porada.co".freeze, "me@tdreyno.com".freeze]
  s.homepage = "https://github.com/middleman/middleman-autoprefixer".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2.0".freeze)
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Automatically vendor-prefix stylesheets served by Middleman.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<middleman-core>.freeze, [">= 4.0.0"])
  s.add_runtime_dependency(%q<autoprefixer-rails>.freeze, ["~> 10.0"])
end
