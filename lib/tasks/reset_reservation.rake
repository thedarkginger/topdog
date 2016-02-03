namespace :topdog do
  desc 'Reset Reservation Records'
  task reset_reservations: :environment do
    Reservation.delete_all
    SpotCounter.update_all(count: 0)
    Participation.delate_all
    puts "reservation is refreshed"
  end
end