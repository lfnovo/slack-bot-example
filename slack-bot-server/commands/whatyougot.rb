module SlackBotServer
  module Commands
    class WhatYouGot < SlackRubyBot::Commands::Base
		match  /^latest$/  do |client, data, match|
			client.say(channel: data.channel, text: "Sure, let me grab that for you.")
			#to do: segurar uns 2 segundos e mandar um evento de typing
			#to do: deveria trazer apenas os links de hoje
			links = ChatLink.all.where(team_id: client.team.team_id)
			if links.size > 5 
				client.say(channel: data.channel, text: "Plenty of stuff today..")
				#to do: segurar uns 2 segundos e mandar um evento de typing
			elsif links.size == 0
				client.say(channel: data.channel, text: "Nothing shared today. Be the first! ")
			else
				client.say(channel: data.channel, text: "OK, found a handful here.. ")
				#to do: segurar uns 2 segundos e mandar um evento de typing
			end
			links.each do |l|
				client.say(channel: data.channel, text: "<@#{data.user}> posted #{l.uri}")
			end
  		end
		
      match /^latest from (?<time>.*)$/ do |client, data, match|


			client.say(channel: data.channel, text: "Sure, let me grab stuff from *#{match[:time]}*.")
			#to do: segurar uns 2 segundos e mandar um evento de typing
			#to do: deveria trazer apenas os links de hoje
			links = ChatLink.all.where(team_id: client.team.team_id)
			if links.size > 5 
				client.say(channel: data.channel, text: "Plenty of stuff today..")
				#to do: segurar uns 2 segundos e mandar um evento de typing
			elsif links.size == 0
				client.say(channel: data.channel, text: "Nothing shared today. Be the first! ")
			else
				client.say(channel: data.channel, text: "OK, found a handful here.. ")
				#to do: segurar uns 2 segundos e mandar um evento de typing
			end
			links.each do |l|
				client.say(channel: data.channel, text: "<@#{data.user}> posted #{l.uri}")
			end
  		end


  	end
  end
end