module SlackBotServer
  module Commands
    class PingMe < SlackRubyBot::Commands::Base
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: "pong you")
        logger.info "PING: #{client.team}, user=#{data.user}"
      end
    end

  end
end
