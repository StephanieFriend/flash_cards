require_relative 'card'
class CardGenerator

  def initialize(file_name)
    @file_name = file_name
  end

  def cards
    new_cards = []
    File.foreach(@file_name) do |line|
      question =  line.partition(',').first
      answer = line.partition(',').last.partition(',').first
      category = line.partition(',').last.partition(',').last.delete("\n")
      new_cards << Card.new(question, answer, category)
    end
    new_cards
  end
end