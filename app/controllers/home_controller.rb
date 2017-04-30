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
end
