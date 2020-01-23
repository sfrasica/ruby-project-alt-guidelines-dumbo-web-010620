require_relative 'work_of_gif'
# Placeholder for methods in progress


# This method is currently in WorkOfGif class as a class method
# def visit_gif_shoppe
#     WorkOfGif.all.map {|workofgif| puts workofgif.name} #can view all available WOG
# end
pw = WorkOfGif.all.first
def gif_shoppe
  prompt.select("Which Gif are you intrested in?") do |menu|
      menu.choice "Pennywise", -> {pennywise}
      menu.choice "Exit", -> {lei.view_bids}
  end
end

def bid_sequence(wog)
  puts "Starting bid is: #{wog.starting_bid}"
  puts "How much would you like to bid?"

  first_bid = gets.chomp.to_i
  lei.create_bid(bid_amount, self.id, wog.id) #win defalt to false, #counter defalts to 1)
end




def pennywise
  puts "Pennywise the dancing clown!"
  puts "starting bid: #{pw.starting_bid}"

  # pennygif method

  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(pw)}
      menu.choice "Exit", -> {lei.view_bids}
  end

end
