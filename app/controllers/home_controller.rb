class HomeController < ApplicationController
  def index
    quotes = [
      "reinvent wireless initiatives", "visualize dynamic niches",
      "revolutionize customized networks", "engage mission-critical schemas",
      "morph extensible networks", "evolve end-to-end eyeballs",
      "synthesize back-end supply-chains", "integrate customized schemas",
      "exploit vertical synergies", "harness B2B action-items",
      "orchestrate leading-edge models", "expedite virtual e-commerce",
      "unleash dot-com supply-chains", "engage strategic e-markets",
      "incentivize holistic functionalities", "reinvent bricks-and-clicks e-tailers",
      "empower bricks-and-clicks e-business", "synthesize cutting-edge web services",
      "implement frictionless relationships", "deliver transparent models",
      "revolutionize world-class markets", "engage intuitive e-markets",
      "streamline compelling web-readiness", "whiteboard e-business experiences",
      "utilize distributed solutions", "enable world-class e-commerce",
      "redefine proactive solutions", "monetize world-class supply-chains",
      "reinvent vertical e-services", "exploit ubiquitous e-markets",
      "syndicate B2B metrics", "revolutionize bricks-and-clicks functionalities",
      "optimize robust web-readiness", "incubate 24/7 web services",
      "transform e-business metrics", "orchestrate cross-platform partnerships",
      "aggregate robust channels", "innovate sticky e-business",
      "deploy seamless e-tailers", "incentivize cutting-edge ROI",
      "evolve 24/7 e-business", "enable open-source e-commerce",
      "syndicate frictionless niches", "reinvent e-business portals",
      "seize sticky action-items", "embrace enterprise ROI",
      "incentivize value-added schemas", "visualize bleeding-edge architectures",
      "utilize web-enabled content", "empower robust relationships"
    ]
    @quote = quotes.sample.capitalize
  end

  def weather
    @cameras = [
      {"Latitude"=>43.107018, "Longitude"=>-89.338768, "ID"=>"WisDOT-CCTV-13-0018", "Name"=>"East Washington Ave at WIS 30", "DirectionOfTravel"=>"Northbound", "RoadwayName"=>"East Washington Ave", "Url"=>"http://511wi.gov/map/Cctv/CCTV-13-0018--2", "Disabled"=>false, "Blocked"=>false},
      {"Latitude"=>43.078449, "Longitude"=>-89.378811, "ID"=>"WisDOT-CCTV-13-0021", "Name"=>"East Washington Ave at Blair St", "DirectionOfTravel"=>"Northbound", "RoadwayName"=>"East Washington Ave", "Url"=>"http://511wi.gov/map/Cctv/CCTV-13-0021--2", "Disabled"=>false, "Blocked"=>false},
      {"Latitude"=>43.040676, "Longitude"=>-89.37835, "ID"=>"WisDOT-CCTV-13-0049", "Name"=>"US 12/18 at Rimrock Rd", "DirectionOfTravel"=>"Northbound", "RoadwayName"=>"US 12", "Url"=>"http://511wi.gov/map/Cctv/CCTV-13-0049--2", "Disabled"=>false, "Blocked"=>false},
      {"Latitude"=>43.034922, "Longitude"=>-89.40676, "ID"=>"WisDOT-CCTV-13-0005", "Name"=>"US 12/18 at Fish Hatchery Rd", "DirectionOfTravel"=>"Northbound", "RoadwayName"=>"US 12", "Url"=>"http://511wi.gov/map/Cctv/CCTV-13-0005--2", "Disabled"=>false, "Blocked"=>false}
    ]
  end
end
