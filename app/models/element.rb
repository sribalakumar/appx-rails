class Element < ActiveRecord::Base
  has_many :extensions

  AUTHENTICATION_TYPE = [
    [:basic, "Basic", 1],
    [:oauth1, "OAuth1", 2],
    [:oauth2, "OAuth2", 3]
  ]

  serialize :configs, Hash
end
