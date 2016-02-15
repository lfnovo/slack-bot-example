module SlackBotServer
  module Commands
    class PostedLink < SlackRubyBot::Commands::Base
  		#percebemos que o usuario postou um link
  		#todo: só ta funcionando com o primeiro link da mensagem, mas acho que dá pra fazer com os outros tambem
  		match URI.regexp do |client, data, match|

  			#extraimos o link 
  			uri = URI.extract(match.to_s)[0] #to do: só estamos pegando a primeira - pegar todas depois

        link = ChatLink.new
        #to do: pegar o titulo batendo na URL
        #to do: reconhecer a mesma URL postada varias vezes e aumentar sua popularidade?

        link.uri = uri
        link.team_id = client.team.team_id
        link.title = "This is a temporary title for this link"
        link.author = data.user
        link.channel = data.channel
        link.description = "This is a temporary description for this link"
        link.save!

  

        if link then
          client.say(channel: data.channel, text: "_Hey <@#{data.user}> - great link: _\n#{uri}" )    
        else
          client.say(channel: data.channel, text: "Something is wrong with me! Can't save this link. Why God, why?\n#{uri}" )    
        end

  			#por enquanto o bot responde no canal só pra gente saber que esta funcionando
  			#todo: o que a gente tem que fazer aqui é salvar isso em um repositorio para gerar o jornalzinho depois


  		end
  	end

  end
end






