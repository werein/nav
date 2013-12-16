SimpleCov.start('rails') do
  add_group "Dummy", "test/dummy"
  filters.clear
  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}/) unless src.filename =~ /\/nav\//
  end
end