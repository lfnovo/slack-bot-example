module SlackBotServer
  module Commands
    class Weather < SlackRubyBot::Commands::Base
  		#exemplo de robo reconhecendo frases
      match /^How is the weather in (?<location>.*)\?$/ do |client, data, match|
    		client.say(channel: data.channel, text: "The weather in #{match[:location]} is nice.")
  		end
  	end
  end
end