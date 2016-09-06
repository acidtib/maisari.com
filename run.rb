require 'erb'
require 'parameterize'

def whatsNext(client)
  case client
  when "Miami Mini Maker Faire"
    return {prev: "The Plantain", next: "Lets Roam"}
  when "Lets Roam"
    return {prev: "Miami Mini Maker Faire", next: "Trust Women"}
  when "Trust Women"
    return {prev: "Lets Roam", next: "Being"}
  when "Being"
    return {prev: "Trust Women", next: "Pornify"}
  when "Pornify"
    return {prev: "Being", next: "Shoot My Travel"}
  when "Shoot My Travel"
    return {prev: "Pornify", next: "Bitstop"}
  when "Bitstop"
    return {prev: "Shoot My Travel", next: "Klangbox"}
  when "Klangbox"
    return {prev: "Bitstop", next: "Arts For Learning"}
  when "Arts For Learning"
    return {prev: "Klangbox", next: "MIA Underwater"}
  when "MIA Underwater"
    return {prev: "Arts For Learning", next: "The Plantain"}
  when "The Plantain"
    return {prev: "MIA Underwater", next: "Miami Mini Maker Faire"}
  end
end

@projects = [
  {
    client: "Miami Mini Maker Faire",
    description: "Miami Mini Maker Faire is an all-ages festival of creativity and innovation that celebrates the Maker Movement. My concept was to bring to life the spirit of maker culture through a robotic representation of the world of the faire.",
    url: "https://makerfairemiami.com/",
    categorys: [
      "Illustration",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Lets Roam",
    description: "Let’s Roam is an app that invites you to explore your neighborhood through curated events, food, and culture.",
    url: "http://findyouradventurenow.com/",
    categorys: [
      "Illustration",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Trust Women",
    description: "Trust Women is a movement powered by the Miami Workers Center to spread awareness of women’s rights and political voice.",
    url: "na",
    categorys: [
      "Branding",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Being",
    description: "Being is a concept I created for a self-help accountability app. It connects to a wristband, to monitor your vitals, and your technology to aid in the user’s journey of personal growth.",
    url: "na",
    categorys: [
      "Branding",
      "UI/UX",
      "Graphic Design",
      "Founder"
    ],
    images: true,
    icons: false
  },
  {
    client: "Pornify",
    description: "Pornify allows users to curate their porn, quickens access to content preferences, and improves overall user experience.",
    url: "http://pornify.ninja/",
    categorys: [
      "Branding",
      "Illustration",
      "UI/UX",
      "Graphic Design",
      "Founder"
    ],
    images: true,
    icons: false
  },
  {
    client: "Shoot My Travel",
    description: "Forget selfies, with Shoot My Travel anyone can book a personal photographer for a couple of hours to capture candid moments as they guide them through the city.",
    url: "http://www.shootmytravel.com/",
    categorys: [
      "UI/UX",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Bitstop",
    description: "Bitstop is the safest, easiest, and most reliable way to buy bitcoin with cash. They are the first ever bitcoin ATM in Florida. I redesigned their home page and designed the remaining pages of the site.",
    url: "http://bitstop.co",
    categorys: [
      "Illustration",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Klangbox",
    description: "Klangbox.fm is comprised of an all-star roster of local DJs, notable personalities, advocacy groups, artists, and more. The app serves as a place to tune in, check the program schedule, and connect to klanbox social.",
    url: "https://itunes.apple.com/us/app/klangbox/id1092363701?mt=8",
    categorys: [
      "UI/UX",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Arts For Learning",
    description: "Arts for Learning is a non-profit organization dedicated to advancing teaching and learning through the arts and community cultural resources. <br><br> As summer camp approached, they were looking to add art to their walls. I designed a button wall filled with words and illustrations representing Arts for Learning. Buttons are removable and replaceable.",
    url: "http://a4lmiami.org/",
    categorys: [
      "Illustration",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "MIA Underwater",
    description: "MIA Underwater is an app that shows how underwater user’s current location will be in the year 2050 based on scientific predictions. In an effort to spread awareness, it also serves as a hub for climate change related news, events, and tools.",
    url: "http://www.miaunderwater.com/",
    categorys: [
      "Branding",
      "Illustration",
      "UI/UX",
      "Graphic Design",
      "Founder"
    ],
    images: true,
    icons: true
  },
  {
    client: "The Plantain",
    description: "I am a co-founder, designer, and photoshop magic contributor to The Plantain. It is a Miami focused satirical news website created to spread awareness of local news through humor.",
    url: "http://www.theplantain.com/",
    categorys: [
      "Branding",
      "Graphic Design",
      "Founder"
    ],
    images: true,
    icons: false
  }
]

@projects.each do |project|
  puts "building: #{project[:client]}"
  project_erb = 'temp/project.html.erb'
  html_file = File.basename(project_erb, '.erb')
  erb_str = File.read(project_erb)
  @project = project

  @images = files = Dir.entries("assets/img/projects/#{project[:client].parameterize}").select {|f| !File.directory? f}
  if project[:icons] == true
    @icons = files = Dir.entries("assets/img/projects/#{project[:client].parameterize}/icons").select {|f| !File.directory? f}
  end

  renderer = ERB.new(erb_str)
  result = renderer.result()

  File.open("project/#{project[:client].parameterize}.html", 'w') do |f|
    f.write(result)
  end
end
