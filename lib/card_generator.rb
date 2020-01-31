require_relative 'card'
class CardGenerator

  def initialize(file_name)
    @file_name = file_name
  end

  def cards
    new_cards = []
    File.foreach(@file_name) do |line|
      line_split = line.split(',')
      question =  line_split.first
      answer = line_split[1]
      category = line_split.last.delete("\n")
      new_cards << Card.new(question, answer, category)
    end
    new_cards
  end
end