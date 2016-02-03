module SlackBotServer
  module Commands
    class Weather < SlackRubyBot::Commands::Base
  		match /^How is the weather in (?<location>\w*)\?$/ do |client, data, match|
    		client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
  		end
  	end

  end
end

