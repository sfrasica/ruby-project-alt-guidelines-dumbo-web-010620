class WorkOfGif < ActiveRecord::Base
    has_many :bids
    has_many :art_dealers, through: :bids
end