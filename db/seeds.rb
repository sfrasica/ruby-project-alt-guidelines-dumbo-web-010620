#Destroy all instances to prevent duplicates but primary key ids will continue incrementing
ArtDealer.destroy_all
Bid.destroy_all
WorkOfGif.destroy_all


#WorkOfGif instances
penny_balloon = WorkOfGif.create(name: "Pennywise Float", available: true, stolen: false, starting_bid: 7_000, jezebel: false)
squidward = WorkOfGif.create(name: "Squidward dancing 🤢", available: true, stolen: false, starting_bid: 200_000, jezebel: false)
darth_vader = WorkOfGif.create(name: "Darth vader choke", available: true, stolen: false, starting_bid: 5_000, jezebel: true)
penywave = WorkOfGif.create(name: "Pennywise says hi!", available: true, stolen: false, starting_bid: 6_500, jezebel: false)
pika = WorkOfGif.create(name: "Pika Pika ⚡️", available: true, stolen: true, starting_bid: 60_000, jezebel: false)
lank = WorkOfGif.create(name: "Zelda from Link", available: true, stolen: false, starting_bid: 1337, jezebel: false)
dad = WorkOfGif.create(name: "Darth Dad", available: true, stolen: false, starting_bid: 10_000, jezebel: false)
persona = WorkOfGif.create(name: "Mask off", available: true, stolen: false, starting_bid: 10_000, jezebel: true)

#Bid instances  amount,  art_dealer_id,  work_of_gif_id,
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: pennywise.id, win: true)
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: baby_yoda.id, win: false)
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: darth_vader.id, win: false)
# Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: captain_falcon.id, win: true)
