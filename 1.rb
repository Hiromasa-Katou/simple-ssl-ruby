require 'sinatra/base'

class MyServer  < Sinatra::Base
    get '/' do
      "Hello, world!\n"
    end
end
class MyServer2  < Sinatra::Base
    get '/' do
      "Hello, world!2\n"
    end
end

Rack::Server.start app: MyServer, Host: "ssl://0.0.0.0:443?key=private.key&cert=certificate.crt"
Rack::Server.start app: MyServer, Host: "0.0.0.0:80"