require "tty-prompt"

class CommandLineInterface
    attr_accessor :prompt, :user, :art_dealer

    def initialize()
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "************** Welcome to the GifShoppe! ************************"
        puts "World renowned one stop shop for all things GIF!"
        answer = self.prompt.select("Have you been to the GifShoppe in a past life?", [
            "Yes",
            "No"
        ])
    
        welcome_handler(answer)
    end

    
    def welcome_handler(choice)
        case choice
        when "No"
            puts "Excellent, we hope you enjoy this lovely experience."
        when "Yes"
            puts "Welcome back."
        end
        main_menu
    end

    def main_menu
        system "clear" # Clears the page user is on, like going to the next screen
        # user.reload <- most likely including later
        prompt.select("Welcome prospective ArtDealer! What strikes your fancy?") do |menu|
            menu.choice "Visit the GifShoppe", -> {WorkOfGif.visit_gif_shoppe}
            menu.choice "View your bids"
            menu.choice "Peruse your GifGallery"
        end
    end


end

