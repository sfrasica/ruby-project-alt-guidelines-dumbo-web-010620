class ArtDealer < ActiveRecord::Base
    has_many :bids
    has_many :work_of_gifs, through: :bids


    def bids_won
      # returns an array of bids the ArtDealer won
      self.bids.where(win: true)
      
    end

    def view_your_won_works
      # returns array of your bid amounts and work of gifs
      bids_won.map { |bid|
        puts bid.amount
        puts WorkOfGif.find(bid.work_of_gif_id).name

        puts "----------------------------------------------------"
      }
    end

    def view_bids
      self.bids.map do |bid|
        if bid.win == true
          puts "Bid Status: won"
        else bid.win == false
          puts "Bid Status: lost"
        end
          # puts bid.count - which will show how many times you bid for that bid instance
          puts WorkOfGif.find(bid.work_of_gif_id).name
      end
    end
  


    


end
