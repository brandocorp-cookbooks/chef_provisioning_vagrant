desc 'provision the test VM'
task :provision => :vendor do
  Dir.chdir 'test/fixtures'
  sh 'chef-client -z -o "chef_provisioning_vagrant::jenkins"'
end

task :vendor do
  sh 'berks vendor test/fixtures/cookbooks'
end
