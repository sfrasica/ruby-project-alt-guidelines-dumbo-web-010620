
class CommandLineInterface
#added last night
# attr_accessor :prompt, :user

#     def initialize()
#         @prompt = TTY::Prompt.new
#     end
# Intro message 
    def greet
        puts "************** Welcome to the GifShoppe! ************************"
        puts "World renowned one stop shop for all things GIF!"
        # answer = self.prompt.select("Have you been to the GifShoppe in a past life?", [
        #     "Yes",
        #     "No"
        # ])
    
        # welcome_handler(answer)
    end

    # added last night 1/21
    # def welcome_handler(choice)
        # case choice
        # when "No"
        #     puts "Excellent, we hope you enjoy this lovely experience."
        # when "Yes"
        #     puts "Welcome back."
        # end
    # end



end
