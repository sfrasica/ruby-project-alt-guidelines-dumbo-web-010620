class Bid < ActiveRecord::Base
    belongs_to :art_dealer
    belongs_to :work_of_gif
end