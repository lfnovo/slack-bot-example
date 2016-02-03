require 'simple-rss'
require 'open-uri'

module SlackBotServer
  module Commands
    class Headlines < SlackRubyBot::Commands::Base
      def self.call(client, data, match)

      	expression = match['expression'] if match.names.include?('expression')

      	if (expression == 'yc') 

      		client.say(channel: data.channel, text: "Here's today headlines for - #{expression}")
      		@rss = SimpleRSS.parse open('https://news.ycombinator.com/rss')

			@rss.entries.each do |r|
				client.say(channel: data.channel, text: "#{r.link}" )
			end
        else
        	client.say(channel: data.channel, text: "Sorry, I don't understand this source" )
        end		


        logger.info "HEADLINES: #{client.team}, user=#{data.user}"
      end
    end

  end
end
