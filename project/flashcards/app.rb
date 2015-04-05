require 'active_record'

require_relative 'db/connection'
require_relative 'lib/deck'
require_relative 'lib/card'

def get_user_input(prompt)
  puts prompt
  return gets.chomp.capitalize
end

def get_deck
  puts "Which deck?"
  puts Deck.all
  deck_category = gets.chomp.capitalize
  return Deck.find_by(category:deck_category)
end

def get_deck_input
  deck_attr = {}
  puts "What is the category of deck?"
  deck_attr[:category] = gets.chomp.capitalize
  return deck_attr
end

def create_card(deck_id)
  card_attr = {}
  card_attr[:question] = get_user_input ("What is the question?").capitalize
  card_attr[:answer] = get_user_input ("What is the answer?").capitalize
  card_attr[:deck_id] = deck_id
  return card_attr
end

def get_card(deck)
  puts "Which card? Choose by id"
  puts deck.cards
  card_edited = gets.chomp
  return deck.cards.find_by(id: card_edited)
end

def play (deck_to_play)
  deck_to_play.each do |deck|
    user_choice = get_user_input("Question: #{deck.question}").capitalize

    if user_choice == deck.answer.capitalize
      puts "You got it right!"

    elsif user_choice != deck.answer.capitalize
      puts "Sorry, you got it wrong!"
      puts "The right answer is #{deck.answer}"
    end
  end
end

puts "Welcome to StudyBuddy!"
puts "********************"

def menu
  puts "Please choose an option:
  1. View Decks
  2. Create Deck
  3. Create Flashcards
  4. Edit Flashcard
  5. Delete Flashcard
  6. Delete Deck
  7. View Score
  8. Play!
  9. View Flashcards
  0. Exit"

  return gets.chomp
end

while true
  choice = menu
  case choice
  when "1"
    puts Deck.all
  when "2"
    Deck.create(get_deck_input)
  when "3"
    deck = get_deck
    new_card = Card.create(create_card(deck.id))
    new_card.deck = deck
    deck.save
  when "4"
    deck = get_deck
    edited_card = get_card(deck)
    puts "What is the new question?"
    new_question = gets.chomp
    edited_card.question = new_question
    edited_card.save
    puts "What is the new answer?"
    new_answer = gets.chomp
    edited_card.answer = new_answer
    edited_card.save
  when "5"
    deck = get_deck
    delete_card = get_card(deck)
    delete_card.destroy
  when "6"
    get_deck.destroy
  when "7"
    puts "Under Construction. Coming Soon!"
  when "8"
    play(get_deck.cards)
  when "9"
    deck = get_deck
    puts deck.cards
  when "0"
    puts "Thank you for using StudyBuddy. Bye!! :)"
    break
  end
end
