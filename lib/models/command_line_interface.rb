require "tty-prompt"


class CommandLineInterface
    attr_accessor :prompt, :user, :art_dealer, :lei

    def initialize()
        @prompt = TTY::Prompt.new
        @art_dealer = ArtDealer.create
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
        get_seeds
        system "clear" # Clears the page user is on, like going to the next screen
        # user.reload <- most likely including later
        prompt.select("Welcome prospective ArtDealer! What strikes your fancy?") do |menu|
            menu.choice "Visit the GifShoppe", -> {WorkOfGif.visit_gif_shoppe}
            menu.choice "View your bids", -> {lei.view_bids}
            menu.choice "Peruse your GifGallery"
        end
    end

    def get_seeds
        @lei = ArtDealer.create(name: "Lei")
        jezebel = ArtDealer.create(name: "Jezebel")
        steven = ArtDealer.create(name: "Steven")

        #WorkOfGif instances
        pennywise = WorkOfGif.create(name: "Pennywise Dancing")
        baby_yoda = WorkOfGif.create(name: "Baby yoda crying")
        darth_vader = WorkOfGif.create(name: "Darth Vader Lightsaber")
        captain_falcon = WorkOfGif.create(name: "Falcon! PAWNNNNNNNNNNCH!")


        #Bid instances  amount,  art_dealer_id,  work_of_gif_id,
        Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: pennywise.id, win: true)
        Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: baby_yoda.id, win: false)
        Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: darth_vader.id, win: false)
        Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: captain_falcon.id, win: true)
    end


end

