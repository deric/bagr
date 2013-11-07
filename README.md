# Bagr

A simple DSL for building software packages. Which might look like this:

```ruby

set :application, 'my_package'
set :package, 'deb'
set :repo_url, 'git@example.com:me/my_repo.git'

namespace :build do

  desc 'Create directory structure'
  task :structure do
    pkg_path do
      mkdir [ 'etc/init.d', 'var/log' ]
      # execute :touch, 'README'
    end
  end

  before :building, :structure

end
```

## Workflow

A typical workflow for building packages looks like this:

  1. Fetch source code (git, tar)
  2. Create fakeroot for new package, directory structure
  3. Build: make, mvn install
  4. Copy files into fakeroot
  5. Create package (deb, rpm) with FPM


## Warning: still under development

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
