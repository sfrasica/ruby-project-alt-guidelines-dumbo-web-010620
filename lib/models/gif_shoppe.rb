require_relative 'work_of_gif'
require_relative 'gifs/pika'
require_relative 'gifs/squidward'
require_relative 'gifs/pennywise'
require_relative 'gifs/pennywave'
require_relative 'gifs/lank_swing'
require_relative 'gifs/darthdad'
require_relative 'gifs/darthchoke'



# Placeholder for methods in progress


# This method is currently in WorkOfGif class as a class method
# def visit_gif_shoppe
#     WorkOfGif.all.map {|workofgif| puts workofgif.name} #can view all available WOG
# end
# pwf = WorkOfGif.all.find_by(name: "Pennywise Float")
# sw = WorkOfGif.all.find_by(name: "Squidward dancing 🤢")
# dvc = WorkOfGif.all.find_by(name: "Darth vader choke")
# pw = WorkOfGif.all.find_by(name: "Pennywise says hi!")
# pika = WorkOfGif.all.find_by(name: "Pika Pika ⚡️")
# lk = WorkOfGif.all.find_by(name: "Zelda from Link")
# dad = WorkOfGif.all.find_by(name: "Darth Dad")

# captain_falcon = WorkOfGif.create(name: "Falcon! PAWNNNNNNNNNNCH!")
def gif_shoppe
  prompt.select("Which Gif are you interested in?") do |menu|
      menu.choice "Pennywise Float", -> {pennywise}
      menu.choice "Squidward dancing 🤢", -> {squidward}
      menu.choice "Darth vader choke", -> {darth_vader}
      menu.choice "Pennywise says hi!", -> {penny_wave}
      menu.choice "Pika Pika ⚡️", -> {pikachu}
      menu.choice "Zelda from Link", -> {lank}
      menu.choice "Darth Dad", -> {darth_dad}
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
  op_bid = bid_amount + rand(5000)
  puts "You've been outbid! The new winning bid is #{op_bid}." # we need the method bc we want our bid to surpass bid + 100

  # sleep(1.5)
  puts "What's your next bid?"
  bid_amount = gets.chomp.to_i
  bid_amount = bid_check(bid_amount, op_bid) #This should stop user's bid until it's greater than "new winning bid"
  initial_ad_bid.update(amount: bid_amount) #initial_ad_bid amount is now equal to user's next bid input

  op_bid = bid_amount + rand(5000)

  # sleep(1.5)
  puts "You've been outbid again! The new winning bid is #{op_bid}."
  # sleep(1.5)
  puts "Quit being cheap and bid harder!"
  bid_amount = gets.chomp.to_i
  bid_amount =  bid_check(bid_amount, op_bid)
  initial_ad_bid.update(amount: bid_amount)
  
  
  if wog.jezebel == true
    puts "You've lost to Jezebel, notorious gif enthusiast. Give up, she has more money than you. She didn't even want the gif."
  elsif wog.stolen == true
    Bid.all.find_by(work_of_gif: wog.id).destroy
    puts "cat burg"
  else
    puts "You've won! Your new workofgif will be available to view in your gifgallery."
    sleep(1.0)
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
  Pennywise.go
  # pennygif method
  
  #bid and exit options
  puts "starting bid: #{pw.starting_bid}"

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(pw)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def squidward
  Squidward.go
  # pennygif method
  
  puts "starting bid: #{sw.starting_bid}"
  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(sw)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def darth_vader
  Vaderchoke.go
  # pennygif method
  
  puts "starting bid: #{dvc.starting_bid}"
  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(dvc)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def penny_wave
  Pennywave.go
  # pennygif method
  
  puts "starting bid: #{pw.starting_bid}"
  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(pw)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def pikachu
  Pikabounce.go
  # pennygif method
  
  puts "starting bid: #{pika.starting_bid}"
  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(pika)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def lank
  Lankswing.go
  # pennygif method
  
  puts "starting bid: #{lk.starting_bid}"
  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(lk)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end

def darth_dad
  Darthdad.go
  # pennygif method
  
  puts "starting bid: #{dad.starting_bid}"
  #bid and exit options

  prompt.select("Do you feel lucky?") do |menu|
      menu.choice "Bid", -> {bid_sequence(dad)}
      menu.choice "Exit", -> {ad.view_bids}
  end

end