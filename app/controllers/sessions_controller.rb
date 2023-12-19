class SessionsController < Devise::SessionsController
    def create
      puts "=== DEBUG: SessionsController#create ==="
      puts "Params: #{params.inspect}"
  
      super do |resource|
        if resource.errors.any?
          puts "Login failed with errors: #{resource.errors.full_messages.join(', ')}"
        end
      end
    end
  end
  