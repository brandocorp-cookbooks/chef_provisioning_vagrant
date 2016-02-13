include_recipe "#{cookbook_name}::default"

machine 'jenkins' do
  run_list [
    'jenkins::master'
  ]
end

machine 'jenkins' do
  action :destroy
end
