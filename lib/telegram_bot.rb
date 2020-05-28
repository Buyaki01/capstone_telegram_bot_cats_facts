# rubocop:disable Layout/LineLength

require 'telegram/bot'
require_relative 'cats_facts.rb'

class TeleBot
  def initialize
    token = '1217252476:AAH8xub4tZEh9Y09f1p4sD2p4N8ZIsH9-ys'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}, welcome to wahengabot. To start enter /start, to get a fact about cats, enter /cats and to stop, enter /stop")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}, hope you have learnt a lot about cats")
        when '/cats'
          cats = Cats.new
          cat_fact = cats.random_fact_about_cats
          bot.api.send_message(chat_id: message.chat.id, text: (cat_fact['text']).to_s)
        else
          bot.api.send_message(chat_id: message.chat.id, text: "#{message.from.first_name}, you need to use  /start,  /stop or /cats")
        end
      end
    end
  end
end
# rubocop:enable Layout/LineLength
