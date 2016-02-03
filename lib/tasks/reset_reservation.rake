namespace :topdog do
  desc 'Reset Reservation Records'
  task reset_reservations: :environment do
    Reservation.delete_all
    puts "reservation is refreshed"
  end

end