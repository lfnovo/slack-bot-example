module SlackBotServer
  module Commands
    class Ping < SlackRubyBot::Commands::Base
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: "pong")
        logger.info "PING: #{client.team}, user=#{data.user}"
      end
    end

  end
end
