namespace :sessions do
  desc 'Delete expired sessions'
  task delete_expired: :environment do
    Session.delete_expired
  end
end
