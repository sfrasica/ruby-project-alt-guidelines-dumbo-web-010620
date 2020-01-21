#Destroy all instances
ArtDealer.destroy_all
Bid.destroy_all
WorkOfGif.destroy_all

#ArtDealer instances
lei = ArtDealer.create(name: "Lei")
jezebel = ArtDealer.create(name: "Jezebel")
steven = ArtDealer.create(name: "Steven")

#WorkOfGif instances
pennywise = WorkOfGif.create(name: "Pennywise Dancing")
baby_yoda = WorkOfGif.create(name: "Baby yoda crying")
darth_vader = WorkOfGif.create(name: "Darth Vader Lightsaber")
captain_falcon = WorkOfGif.create(name: "Falcon! PAWNNNNNNNNNNCH!")


#Bid instances  amount,  art_dealer_id,  work_of_gif_id,
Bid.create(amount: 100, art_dealer_id: lei.id, work_of_gif_id: pennywise.id)

