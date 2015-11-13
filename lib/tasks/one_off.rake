namespace :one_off do
  desc 'it associates owners with their restaurants'
  task :associate_owners, [] => :environment do
    Restaurant.all.each do |restaurant|
      begin
        restaurant.owners << restaurant.owner
        print '.'
      rescue => error
        binding.pry
      end
    end
    puts
    puts 'Finished.'
  end
end
