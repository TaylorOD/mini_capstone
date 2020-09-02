# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.create([
  { name: "Huggle Hoodie - As Seen On TV" },
  { price: 26.95 },
  { image_url: "https://images-na.ssl-images-amazon.com/images/I/91YYqHQs6uL._AC_SL1500_.jpg" },
  { description: "Introducing huggle hoodie the world's most comfortable oversized hoodie that combines the warmth of a cozy blanket with the comfort of your favorite hoodie. Made from ultra-soft Fleece and lined with ultimate in warming Sherpa comfort!
" },
])
product = Product.create([
  { name: "Ontel 5 Second Fix - Liquid-Plastice Welding Tool - As Seen On TV" },
  { price: 19.99 },
  { image_url: "https://images-na.ssl-images-amazon.com/images/I/71LbFXEuC3L._AC_SL1000_.jpg" },
  { description: "5 Second Fix is a super powered liquid plastic welding compound that you can use to quickly and easily make permanent seals and repairs." },
])
product = Product.create([
  { name: "Pillow Pad - As Seen On TV" },
  { price: 19.99 },
  { image_url: "https://images-na.ssl-images-amazon.com/images/I/81eoHEEZGWL._AC_SL1498_.jpg" },
  { description: "Are you tired of trying to hold up your device or book while sitting or lying down? As soon as you're able to find a comfortable position and relax, it falls over! Introducing pillow pad, The multi-angle tablet soft stand!" },
])
product = Product.create([
  { name: "Miracle Copper Socks - As Seen On TV" },
  { price: 8.48 },
  { image_url: "https://images-na.ssl-images-amazon.com/images/I/71tcHh8t0GL._AC_SL1500_.jpg" },
  { description: "Miracle Copper Socks use copper-infused fibers and graduated mild (8-15 mmHg) compression to soothe swollen feet and legs, boost circulation, reduce swelling and help relieve aches and soreness. Breathable fabric controls odor and keeps feet dry." },
])
