class WorkOfGif < ActiveRecord::Base
    has_many :bids
    has_many :art_dealers, through: :bids

    def self.visit_gif_shoppe
        WorkOfGif.all.map {|workofgif| puts workofgif.name} #can view all available WOG 
    end
end