namespace "data" do

  desc 'Remove colons from category names.'
  task :remove_colons => :environment do
    Category.all.each do |cat|
      name = cat.name
      new_name = name.sub(/:$/,'')
      cat.update_attributes name: new_name
    end
  end
end
