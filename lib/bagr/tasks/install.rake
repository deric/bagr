require 'erb'
require 'pathname'
desc 'Install Bagr, bagr install'
task :install do

  config_dir = Pathname.new('config')
  build_dir = config_dir.join('build')

  build_rb = File.expand_path("../../templates/build.rb.erb", __FILE__)
  bagrfile = File.expand_path("../../templates/Bagrfile", __FILE__)

  mkdir_p build_dir

  template = File.read(build_rb)
  file = config_dir.join('build.rb')
  File.open(file, 'w+') do |f|
    f.write(ERB.new(template).result(binding))
    puts I18n.t(:written_file, scope: :bagr, file: file)
  end

  FileUtils.cp(bagrfile, 'Bagrfile')

  puts I18n.t :bargified, scope: :bagr
end
