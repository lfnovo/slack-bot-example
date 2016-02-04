module SlackBotServer
  module Commands
    class Link < SlackRubyBot::Commands::Base
  		#percebemos que o usuario postou um link
  		#todo: só ta funcionando com o primeiro link da mensagem, mas acho que dá pra fazer com os outros tambem
  		match URI.regexp do |client, data, match|

  			#extraimos o link 
  			link = URI.extract(match.to_s)

  			#por enquanto o bot responde no canal só pra gente saber que esta funcionando
  			#todo: o que a gente tem que fazer aqui é salvar isso em um repositorio para gerar o jornalzinho depois
			client.say(channel: data.channel, text: "_Hey <@#{data.user}> - great link: _\n#{link}" )

  		end
  	end

  end
end



