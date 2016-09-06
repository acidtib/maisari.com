require 'erb'
require 'parameterize'

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
    description: "",
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
    description: "",
    url: "na",
    categorys: [
      "UI/UX",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Bitstop",
    description: "",
    url: "na",
    categorys: [
      "Illustration",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Klangbox",
    description: "",
    url: "na",
    categorys: [
      "UI/UX",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "Arts For Learning",
    description: "",
    url: "na",
    categorys: [
      "Illustration",
      "Graphic Design"
    ],
    images: true,
    icons: false
  },
  {
    client: "MIA Underwater",
    description: "",
    url: "na",
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
    description: "",
    url: "na",
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
