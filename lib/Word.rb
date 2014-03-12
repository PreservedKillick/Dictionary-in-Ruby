class Word
attr_reader :entry

  def initialize(entry)
    @entry = entry
  end

  def create(entry)
    new_word = Word.new(entry)
  end
end
