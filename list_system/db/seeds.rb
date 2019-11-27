#Creating App
android = App.where(title: 'Android').first_or_create do |a|
  a.auth_token =  SecureRandom.base64(15).tr('+/=lIO0', 'pqrsxyz')
end
p "Application: #{android.auth_token}"

t = Tenant.create(title: 'amazon', subdomain: 'amazon')
Apartment::Tenant.switch!('amazon')

#Item
inception           = Item.where(title: 'Inception').first_or_create           
blood_diamond       = Item.where(title: 'Blood Diamond').first_or_create       
catch_me_if_you_can = Item.where(title: 'Catch Me If You Can').first_or_create 
departed            = Item.where(title: 'Departed').first_or_create            
shutter_island      = Item.where(title: 'Shutter Island').first_or_create      

android.items = [inception, blood_diamond, catch_me_if_you_can, departed, shutter_island]

#List
tabs              = List.where(title: 'tab').first_or_create               
all               = List.where(title: 'All').first_or_create               
hollywood_movies  = List.where(title: 'HollyWood Movies').first_or_create  
series            = List.where(title: 'Series').first_or_create            
entertainment     = List.where(title: 'Entertainment').first_or_create     
featured          = List.where(title: 'Feature').first_or_create           
popular           = List.where(title: 'Popular').first_or_create           
classic           = List.where(title: 'Classic').first_or_create           



tabs.sublists = [ all, hollywood_movies, series, entertainment]
all.sublists  = [ featured, popular, classic]

#Layout
carousal_one_layouts      = Layout.where(title: 'carousal-one-layouts').first_or_create     
carousal_two_layouts      = Layout.where(title: 'carousal-two-layouts').first_or_create     
carousal_three_layouts    = Layout.where(title: 'carousal-three-layouts').first_or_create 
carousal_four_layouts     = Layout.where(title: 'carousal-four-layouts').first_or_create   
carousal_five_layouts     = Layout.where(title: 'carousal-five-layouts').first_or_create   
gallery_one               = Layout.where(title: 'gallery-one').first_or_create                       
gallery_two               = Layout.where(title: 'gallery-two').first_or_create                       
newsfeeds_layouts         = Layout.where(title: 'newsfeeds-layouts').first_or_create           
newsfeeds_two_layouts     = Layout.where(title: 'newsfeeds-two-layouts').first_or_create   
project_one_layouts       = Layout.where(title: 'project-one-layouts').first_or_create       
project_two_layouts       = Layout.where(title: 'project-two-layouts').first_or_create       
project_three_layouts     = Layout.where(title: 'project-three-layouts').first_or_create   
project_four_layouts      = Layout.where(title: 'project-four-layouts').first_or_create     
vertical_cards_layouts    = Layout.where(title: 'vertical-cards-layouts').first_or_create 
zig_zag_layout            = Layout.where(title: 'zig-zag-layout').first_or_create                 

featured.layouts << carousal_one_layouts
popular.layouts << vertical_cards_layouts
classic.layouts << gallery_one

inception_media = Medium.where(title: 'inception').first_or_create do |m|
  #m.url = 'https://s4.aconvert.com/convert/p3r68-cdx67/cbonh-7r0qd.jpg'
  m.url = "https://glamourfame.com/uploads/movies-tv-shows/2019/06/09/will-we-ever-see-inception-sequel-heres-why-inception-2-will-never-happen-1560094041.jpg"
  m.media_type = 'image'
end
inception.media << inception_media

blood_diamond_media = Medium.where(title: 'blood_diamond').first_or_create do |m|
  #m.url = 'https://s4.aconvert.com/convert/p3r68-cdx67/cbp08-g0qxl.jpg'
  m.url = "https://occ-0-1001-999.1.nflxso.net/dnm/api/v6/0DW6CdE4gYtYx8iy3aj8gs9WtXE/AAAABe12njpIGTJcC_fluZbTLouZWZ7W0iLg_Vd5KmOF5EwRgZHRO1GL61hhroPfFQNdhULg6qzm0QzmAit5AarspEbA4Qfv.jpg?r=fbf"
  m.media_type = 'image'
end
blood_diamond.media << blood_diamond_media

catch_me_if_you_can_media = Medium.where(title: 'catch_me_if_you_can').first_or_create do |m|
  #m.url = 'https://s4.aconvert.com/convert/p3r68-cdx67/cbn7h-htab8.jpg'
  m.url = "https://images.justwatch.com/backdrop/8707269/s1440/catch-me-if-you-can"
  m.media_type = 'image'
end
catch_me_if_you_can.media << catch_me_if_you_can_media

departed_media = Medium.where(title: 'departed').first_or_create do |m|
  #m.url = 'https://s4.aconvert.com/convert/p3r68-cdx67/cbp35-2xj1u.jpg'
  m.url = "https://thelistlove.com/wp-content/uploads/2014/12/212.jpg"
  m.media_type = 'image'
end
departed.media << departed_media

shutter_island_media = Medium.where(title: 'shutter_island').first_or_create do |m|
  #m.url = 'https://s4.aconvert.com/convert/p3r68-cdx67/cbkk2-0vmnr.jpg'
  m.url = "https://i.redd.it/0kly44f4z0e31.jpg"
  m.media_type = 'image'
end
shutter_island.media << shutter_island_media


featured.items = [inception, departed, catch_me_if_you_can]
popular.items  = [blood_diamond, shutter_island, inception]
classic.items  = [catch_me_if_you_can, departed, shutter_island]


