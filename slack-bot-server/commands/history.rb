module SlackBotServer
  module Commands
    class History < SlackRubyBot::Commands::Base
  		#exemplo de robo reconhecendo frases
      match /^What was I reading watching (?<time>.*)\?$/ do |client, data, match|
    		client.say(channel: data.channel, text: "I dont know what you were reading #{match[:time]}. YET. Hahaha. ")
  		end
  	end
  end
end