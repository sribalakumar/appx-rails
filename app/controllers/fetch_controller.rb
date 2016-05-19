class FetchController < ApplicationController

  #should introduce a shared secret authentication layer.

  before_filter :fetch_installed_extension, :source_configs, :dest_configs, :only => [:simple_get]

  # params should have ticket_id, token for installed extension, lambda_action.
  def simple_get
    call_lambda_action
  end

  private

    def fetch_installed_extension
      @installed_extension = InstalledExtension.where(:token => params["token"])
    end

    def source_configs
      @source_configs = @installed_extension.source_configs.to_json
    end

    def dest_configs
      @dest_configs = @installed_extension.dest_configs.to_json
    end

    def call_lambda_action
      labmda_url = "http://aws.com/lambda" #@installed_extension.extension.options[:lambda_url] #hard code for now.
      auth_header = request.headers['HTTP_AUTHORIZATION'] #can be changed later
      user_agent = request.headers['HTTP_USER_AGENT'] #can be changed later
      options = Hash.new
      options[:body] = {
        "source_configs" => @source_configs, #secured payload sending, handle later.
        "dest_configs" => @dest_configs, #secure payload sending, handle later.
        "method_to_invoke" => params["lambda_action"],
       }
      options[:headers] = { "Authorization" => auth_header,
        "Accept" => "application/json",
        "Content-Type" => "application/json",
        "User-Agent" => user_agent
      }
      options[:timeout] = 10
      method = Net::HTTP::Get
      proxy_request   = HTTParty::Request.new(method, labmda_url, options)
    end

end
