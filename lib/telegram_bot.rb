require 'telegram/bot'
require_relative 'cats_facts.rb'

class Bot
  def initialize
    token = '1217252476:AAH8xub4tZEh9Y09f1p4sD2p4N8ZIsH9-ys'
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        when '/cats'
          values = Cats.new
          value = values.select_random
          bot.api.send_message(chat_id: message.chat.id, text: "#{value['text']}", date: message.date)
        else
          bot.api.send_message(chat_id: message.chat.id, text: "Invalid entry, #{message.from.first_name}, you need to use  /start,  /stop or /cats")
        end
      end
    end
  end
end