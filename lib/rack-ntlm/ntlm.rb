require 'net/ntlm'

module Rack
  class Ntlm

    def initialize(app, config = {})
      @app = app
      @config = config
    end

    def auth(username)
      # Ignore the password. We should probably do something about this
      begin
        if @config[:auth]
          username == @config[:auth][:username]
        else
          true
        end
      rescue => e
        false
      end
    end

    def call(env)
      if env['PATH_INFO'] =~ @config[:uri_pattern] && (env['HTTP_AUTHORIZATION'].nil? || env['HTTP_AUTHORIZATION'] == "")
        return [401, {'WWW-Authenticate' => "NTLM"}, []]
      end

      if /^(NTLM|Negotiate) (.+)/ =~ env["HTTP_AUTHORIZATION"]

        message = Net::NTLM::Message.decode64($2)

        if message.type == 1 
          type2 = Net::NTLM::Message::Type2.new
          return [401, {"WWW-Authenticate" => "NTLM " + type2.encode64}, []]
        end

        if message.type == 3 && env['PATH_INFO'] =~ @config[:uri_pattern]
          user = Net::NTLM::decode_utf16le(message.user)
          if auth(user)
            env['REMOTE_USER'] = user
          else
            return [401, {}, ["You are not authorized to see this page"]]
          end
        end
    	end

      @app.call(env)
    end

  end

end
