require 'rubygems'
require 'rubygems/package_task'
require 'rdoc/task'

task :default => :package do
end

govuk_elements_version = `cd govuk_elements && git describe --tags`
tag_sha=`cd govuk_elements && git rev-parse HEAD`

change_log_url = "https://github.com/alphagov/govuk_elements/blob/#{tag_sha}/CHANGELOG.md"

spec = Gem::Specification.new do |s|
  s.name              = 'govuk_elements_rails'
  s.version           = govuk_elements_version.sub('v','')
  s.summary           = 'A gem wrapper around http://github.com/alphagov/govuk_elements that pulls stylesheet and javascript files into a Rails app.'
  s.description       = "A gem wrapper around govuk_elements #{(govuk_elements_version)} that pulls stylesheet and javascript files into a Rails app. Changelog: #{change_log_url}"

  s.authors           = ['Rob McKinnon', 'Government Digital Service']
  s.email             = 'robin.whittleton@digital.cabinet-office.gov.uk'
  s.homepage          = 'https://github.com/alphagov/govuk_elements_rails'

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.md)
  s.rdoc_options      = %w(--main README.md)

  # Add any extra files to include in the gem
  files = [ %w(LICENSE README.md) +
      Dir.glob('vendor/assets/**/*/**/*') +
      Dir.glob('app/**/*/**/*') +
      Dir.glob('config/**/*/**/*') +
      Dir.glob('lib/**/*') ].flatten.select {|x| !File.directory?(x) }

  s.files             = files
  s.require_paths     = ['lib', 'vendor']

  s.add_runtime_dependency 'rails', '>= 4.1.0'
  s.add_runtime_dependency 'sass', '>= 3.2.0'
  s.add_runtime_dependency 'govuk_frontend_toolkit', '>= 5.0.2'
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
#
# To publish your gem online, install the 'gemcutter' gem; Read more
# about that here: http://gemcutter.org/pages/gem_docs
Gem::PackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, 'w') {|f| f << spec.to_ruby }
end

# If you don't want to generate the .gemspec file, just remove this line. Reasons
# why you might want to generate a gemspec:
#  - using bundler with a git source
#  - building the gem without rake (i.e. gem build blah.gemspec)
#  - maybe others?
task :package => :gemspec

# Generate documentation
RDoc::Task.new do |rd|
  rd.main = 'README.md'
  rd.rdoc_files.include('README.md', 'lib/**/*.rb')
  rd.rdoc_dir = 'rdoc'
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end

desc 'Tag the repository in git with gem version number'
task :tag => [:gemspec, :package] do
  if `git diff --cached`.empty?
    if `git tag`.split("\n").include?("v#{spec.version}")
      raise "Version #{spec.version} has already been released"
    end
    `git add #{File.expand_path("../#{spec.name}.gemspec", __FILE__)}`
    `git commit -m "Released version #{spec.version}"`
    `git tag v#{spec.version}`
    `git push --tags`
    `git push`
  else
    raise 'Unstaged changes still waiting to be committed'
  end
end

desc 'Tag and publish the gem to rubygems.org'
task :publish => :tag do
  `gem push pkg/#{spec.name}-#{spec.version}.gem`
end
