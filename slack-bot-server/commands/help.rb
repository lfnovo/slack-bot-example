module SlackBotServer
  module Commands
    class Help < SlackRubyBot::Commands::Base
      HELP = <<-EOS
```
I am your friendly slack-bot-server, here to help.

General
-------

help               - get this helpful message
whoami             - print your username
feedback           - sends any comment, suggestion or bug report straight to us
ping               - just so you know I'm alive. :)


```
EOS
      def self.call(client, data, _match)
        client.say(channel: data.channel, text: HELP)
        logger.info "HELP: #{client.team}, user=#{data.user}"
      end
    end
  end
end
