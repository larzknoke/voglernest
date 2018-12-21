def prompt(message)
  print(message)
  STDIN.gets.chop
end

namespace :bootstrap do
  desc "CREATE FIRST USER (ADMIN)"
  task first_user: :environment do

    if User.all.size == 0
      name = prompt('Name: ')
      email = prompt('Email: ')
      password = prompt('Password: ')

      user = User.new(name: name, email: email, password: password)
      unless user.save
        STDERR.puts('Cannot create a new user:')
        user.errors.full_messages.each do |message|
          STDERR.puts(" * #{message}")
        end
      end
    else
      STDERR.puts('Users already exists!')
    end

  end

end
