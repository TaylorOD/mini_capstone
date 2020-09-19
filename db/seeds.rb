# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Supplier.create!(name: "Big John Records", email: "bigjohnr@gmail.com", phone_number: "901-857-9823")
Supplier.create!(name: "Small Joe Records", email: "smalljoerecords@gmail.com", phone_number: "802-232-3280")
Supplier.create!(name: "Amazon Records", email: "amazonr@amazon.com", phone_number: "444-485-8930")

Product.create([
  { supplier_id: 1, name: "The Beatles - Abbey Road", price: 20.64, description: "The new Abbey Road release features the new stereo album mix, sourced directly from the original eight-track session tapes." },
  { supplier_id: 2, name: "Michael Jackson - Thriller", price: 17.18, description: "Michael Jackson - Thriller - LP Vinyl Album" },
  { supplier_id: 3, name: "Pink Floyd - Dark Side of the Moon", price: 23.49, description: "PINK FLOYD / DARK SIDE OF MOON - Vinyl LP. The Dark Side of the Moon is the eighth album by the English rock band Pink Floyd." },
  { supplier_id: 1, name: "Fleetwood Mac - Rumours", price: 23.50, description: "This 1975 multi-platimum album, Rumours became Fleetwood Mac's most celebrated album and one of the best-selling albums of all time." },
  { supplier_id: 2, name: "J. Cole - Forest Hill Drive", price: 17.40, description: "J. Cole - 2014 Forest Hills Drive 2LP Disc 1 Side 1   1. Intro   2. January 28th   3. Wet Dreamz   4. 03' Adolescence Disc 1 Side 2" },
  { supplier_id: 3, name: "Tame Impala - Currents", price: 22.99, description: "Limited double vinyl LP pressing. 2015 release, the highly anticipated third full length album from the much loved Australian band." },
  { supplier_id: 1, name: "Miles Davis - Kind Of Blue", price: 20.69, description: "Miles said that he had wanted to draw closer to African and Gospel music as well as the blues, but admitted that he had failed in this intention." },
  { supplier_id: 2, name: "Tyler, The Creator - IGOR", price: 22.43, description: "Vinyl LP pressing in gatefold jacket. 2019 release. Igor is the fifth studio album by rapper Tyler, The Creator." },
  { supplier_id: 3, name: "Weezer - Blue Album", price: 12.98, description: "Weezer, with its simple blue cover featuring a group band shot, was not like anything most kids in 1994 had heard before." },
  { supplier_id: 1, name: "Nirvana - Nevermind", price: 20.33, description: "Limited 180gm vinyl pressing of this classic 1991 album from Kurt Cobain and the boys." },
  { supplier_id: 2, name: "Adele - 21", price: 17.09, description: "21 is the eagerly awaited sophomore album from British singer-songwriter Adele." },
  { supplier_id: 3, name: "Kendrick Lamar - Good Kid, m.A.A.d City", price: 17.90, description: "Double vinyl LP pressing. 2012 release from the Compton-based Hip Hop artist." },
  { supplier_id: 1, name: "Tom Petty & the Heartbreakers - Greatest Hits", price: 25.98, description: "The album is the biggest selling in the band's illustrious catalog." },
  { supplier_id: 2, name: "Johnny Cash - The Essential Johnny Cash", price: 21.96, description: "2LP set with 28 golden period classic hits including all his signature tunes in a fully authorized, high quality package" },
  { supplier_id: 3, name: "Pearl Jam - Ten", price: 14.49, description: "180g vinyl reissue. 2017 remaster of the 1991 grunge classic from original mix with original artwork!" },
  { supplier_id: 1, name: "Bob Marley - Legend", price: 18.95, description: "Bob Marley & The Wailers - Legend Vinyl LP. Bob Marley & The Wailers - Legend Vinyl LPDisc 1Side 11: Is This Love2: No Woman, No Cry3: Could You Be Loved" },
])

Image.create!(product_id: 1, url: "https://images-na.ssl-images-amazon.com/images/I/81dUVKQDBEL._SL1200_.jpg")
Image.create!(product_id: 2, url: "https://images-na.ssl-images-amazon.com/images/I/81wfye0hsDL._SL1500_.jpg")
Image.create!(product_id: 3, url: "https://images-na.sPsl-images-amazon.com/images/I/61hw9WloObL._SL1500_.jpg")
Image.create!(product_id: 4, url: "https://images-na.ssl-images-amazon.com/images/I/71HWqbh0BLL._SL1425_.jpg")
Image.create!(product_id: 5, url: "https://images-na.ssl-images-amazon.com/images/I/71XstPLx8PL._SL1500_.jpg")
Image.create!(product_id: 6, url: "https://images-na.ssl-images-amazon.com/images/I/91sqAJFwmJL._SL1400_.jpg")
Image.create!(product_id: 7, url: "https://images-na.ssl-images-amazon.com/images/I/81CP1j-zprL._SL1500_.jpg")
Image.create!(product_id: 8, url: "https://images-na.ssl-images-amazon.com/images/I/71udX8iRBsL._SL1200_.jpg")
Image.create!(product_id: 9, url: "https://images-na.ssl-images-amazon.com/images/I/61%2BYFnKqzgL._SL1400_.jpg")
Image.create!(product_id: 10, url: "https://images-na.ssl-images-amazon.com/images/I/71VZjASx2kL._SL1400_.jpg")
Image.create!(product_id: 11, url: "https://images-na.ssl-images-amazon.com/images/I/71ipksWZcjL._SL1500_.jpg")
Image.create!(product_id: 12, url: "https://images-na.ssl-images-amazon.com/images/I/51R0mNJpZbL.jpg")
Image.create!(product_id: 13, url: "https://images-na.ssl-images-amazon.com/images/I/91xCpe6mIgL._SL1500_.jpg")
Image.create!(product_id: 14, url: "https://images-na.ssl-images-amazon.com/images/I/817VZsCODgL._SL1500_.jpg")
Image.create!(product_id: 15, url: "https://images-na.ssl-images-amazon.com/images/I/813p1x7Vc8L._SL1200_.jpg")
Image.create!(product_id: 16, url: "https://images-na.ssl-images-amazon.com/images/I/71EFb-BEAeL._SL1400_.jpg")

Category.create!(name: "Pop")
Category.create!(name: "Country")
Category.create!(name: "Rap")
Category.create!(name: "Rock")
Category.create!(name: "House")
