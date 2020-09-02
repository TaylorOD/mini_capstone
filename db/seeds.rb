# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.create([
  { name: "Huggle Hoodie" },
  { price: 26.95 },
  { image_url: "https://images-na.ssl-images-amazon.com/images/I/91YYqHQs6uL._AC_SL1500_.jpg" },
  { description: "Introducing huggle hoodie the world's most comfortable oversized hoodie that combines the warmth of a cozy blanket with the comfort of your favorite hoodie. Made from ultra-soft Fleece and lined with ultimate in warming Sherpa comfort!
" },
])
