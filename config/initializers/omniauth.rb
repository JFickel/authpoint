# Bring in ProviderInfo class that interfaces with config/providers.yml.
require 'provider_info'

# Load providers module
require 'providers'

# Bring in libraries we need for API's
require 'google/api_client'
require 'httpadapter/adapters/net_http'

# Instantiate ProviderInfo class.
# YAML data is returned by the settings method.
pinfo = ProviderInfo.new.settings

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, pinfo['google']['key'], pinfo['google']['secret'], {
    :scope => pinfo['google']['scope']
  }
  
  provider :facebook, pinfo['facebook']['key'], pinfo['facebook']['secret'], {
    :scope => pinfo['facebook']['scope']
  }
  
  provider :twitter, pinfo['twitter']['key'], pinfo['twitter']['secret'], {
    :scope => pinfo['twitter']['scope']
  }
  
  provider :tumblr, pinfo['tumblr']['key'], pinfo['tumblr']['secret'], {
    :scope => pinfo['tumblr']['scope']
  }
end