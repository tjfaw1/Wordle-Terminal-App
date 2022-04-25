class Router
    def intialize(controller)
        @controller = controller
        @running = true
    end

    def run
        puts "Welcome to Wordle"
        while @running
            display_tasks
            action = gets.chomp.to_i
            print `clear`
            route_action(action)
        end
    end


private

    def route_action(action)
        case action
        when 1 then @controller.start_game
        when 2 then @controller.rules
        when 3 then stop
        else
        puts "Wrong input do it again by selecting 1, 2 or 3!"
        end
    end

    def stop
        @running = false
    end

    def display_tasks
        puts ""
        puts "How would you like to proceed?"
        puts "1 - Start playing"
        puts "2 - See the rules"
        puts "3 - Exit the program"
    end
end
