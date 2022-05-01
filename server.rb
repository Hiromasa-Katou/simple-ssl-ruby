require 'sinatra'
require 'thin'

class MyThinBackend < ::Thin::Backends::TcpServer
  def initialize(host, port, options)
    super(host, port)
    @ssl = true
    @ssl_options = options
  end
end

configure do
  set :environment, :production
  set :bind, '0.0.0.0'
  set :port, 443
  set :server, "thin"
  class << settings
    def server_settings
      {
        :backend          => MyThinBackend,
        :private_key_file => "private.key",
        :cert_chain_file  => "certificate.crt",
        :verify_peer      => false
      }
    end
  end
end

get '/' do
  "Hello, SSL."
end