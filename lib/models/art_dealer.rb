class ArtDealer < ActiveRecord::Base
    has_many :bids
    has_many :work_of_gifs, through: :bids

    def bids_won
      #returns an array of bids the ArtDealer won
      self.bids.where(win: true)
    end
end
