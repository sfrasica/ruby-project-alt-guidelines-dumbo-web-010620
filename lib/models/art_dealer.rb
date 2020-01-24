class ArtDealer < ActiveRecord::Base
    has_many :bids
    has_many :work_of_gifs, through: :bids


    def bids_won
      # returns an array of bids the ArtDealer won
      array_of_true_bids = self.bids.where(win: true)
      array_of_wog_won = array_of_true_bids.map { |bid| 
        WorkOfGif.all.find(bid.work_of_gif_id)
      }

      array_of_wog_won.map { |wog|
        Bid.all.find_by(work_of_gif_id: wog.id)
      }
    end

    def view_your_won_works
      # returns array of your bid amounts and work of gifs
      bids_won.map { |bid|
        puts bid.amount
        puts WorkOfGif.find(bid.work_of_gif_id).name
        #spacing
        puts "----------------------------------------------------"
        puts ""
      }
    end

    def view_bids
      bids_won.map do |bid| 
        # if WorkOfGif.all.find(bid.work_of_gif_id).stolen == false 
          if bid.win == true
          puts "Bid Status: won"
          puts "$#{bid.amount}"
          else bid.win == false
          puts "Bid Status: lost"
          puts "$#{bid.amount}"
          end
         # puts bid.count - which will show how many times you bid for that bid instance
      puts WorkOfGif.find(bid.work_of_gif_id).name
      # these are for spacing
      puts "----------------------------------------------------"
      puts ""
      
      # else
      end
    end
      
    

    # def update()
      # Takes an argument of a WOGs id
      # call bid.update and pass the param work_of_gif_id: with the variable

    # end

    def create_bid(amount, wog)
      # Take an argument of desired bid amount and WorkOfGif
      bids.create(amount: amount, art_dealer_id: self.id, work_of_gif_id: wog.id, win: false)
    end





end
