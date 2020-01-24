require_relative 'work_of_gif'
# Placeholder for methods in progress


# This method is currently in WorkOfGif class as a class method
# def visit_gif_shoppe
#     WorkOfGif.all.map {|workofgif| puts workofgif.name} #can view all available WOG
# end
pw = WorkOfGif.all.first
sw = WorkOfGif.all.second
dv = WorkOfGif.all.third
# captain_falcon = WorkOfGif.create(name: "Falcon! PAWNNNNNNNNNNCH!")
def gif_shoppe
  prompt.select("Which Gif are you interested in?") do |menu|
      menu.choice "Pennywise", -> {pennywise}
      menu.choice "Squidward", -> {squidward}
      menu.choice "darth_vader", -> {darth_vader}
      menu.choice "Exit", -> {ad.view_bids}
  end
end

def bid_sequence(wog)
  puts "Starting bid is: #{wog.starting_bid}"
  puts "How much would you like to bid?"

  bid_amount = gets.chomp.to_i
  #bid_check(bid, wog.starting_bid)

  bid_amount = bid_check(bid_amount, wog.starting_bid)
# changed @ad back to ad line 26
  initial_ad_bid = ad.create_bid(bid_amount, wog) #initial_ad_bid is being created using the user's bid amount(which is the first bid the user inputs)
                                            # from gets.chomp
                                            #and the wog instance (pennywise)
  # sleep(1.5)
  op_bid = bid_amount + 1000
  puts "You've been outbid! The new winning bid is #{op_bid}." # we need the method bc we want our bid to surpass bid + 100

  # sleep(1.5)
  puts "What's your next bid?"
  bid_amount = gets.chomp.to_i
  bid_amount = bid_check(bid_amount, op_bid) #This should stop user's bid until it's greater than "new winning bid"
  initial_ad_bid.update(amount: bid_amount) #initial_ad_bid amount is now equal to user's next bid input

  op_bid = bid_amount + 1000

  # sleep(1.5)
  puts "You've been outbid again! The new winning bid is #{op_bid}."
  # sleep(1.5)
  puts "Quit being cheap and bid harder!"
  bid_amount = gets.chomp.to_i
  bid_amount =  bid_check(bid_amount, op_bid)
  initial_ad_bid.update(amount: bid_amount)


  if wog.jezebel == true
    puts "You've lost to Jezebel, notorious gif enthusiast. Give up, she has more money than you. She didn't even want the gif."
  else
   puts "You've won! Your new workofgif will be available to view in your gifgallery."
   wog.you_won
   @ad.bids.map {|bid|
     bid.win = true
     bid.save
   }
  end

  wog.stolen?
end

# checks if your bid is greater than the opposing bid
def bid_check(bid, opposing_bid)
  until bid > opposing_bid
    puts "You must bid higher than the current winning bid!"
    # sleep (2)

    puts "What's your next bid?"
    bid = gets.chomp.to_i

  end
  bid
  # binding.pry
end


def pennywise
  puts "Pennywise the dancing clown!"
  puts "starting bid: #{pw.starting_bid}"

  # pennygif method

  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(pw)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def squidward
  puts "Squidward dancing"
  puts "starting bid: #{sw.starting_bid}"

  # pennygif method

  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(sw)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def darth_vader
  puts "Darth dad into choking!"
  puts "starting bid: #{dv.starting_bid}"

  # pennygif method

  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(dv)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end
