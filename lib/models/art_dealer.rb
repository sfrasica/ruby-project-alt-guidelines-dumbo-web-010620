class ArtDealer < ActiveRecord::Base
    has_many :bids
    has_many :work_of_gifs, through: :bids
end