class Term
  @@all_terms = []
  attr_reader :word, :definition

  def Term.all
    @@all_terms
  end

  def Term.create(word, definition)
    new_term = Term.new(word, definition)
    new_term.save
    new_term
  end

  def Term.clear
    @@all_terms = []
  end

  def Term.delete_term(term_to_delete)
    @@all_terms.each_with_index do |word, index|
      if  @@all_terms[index].word == term_to_delete
        @@all_terms.delete_at(index)
      end
    end
  end

  def initialize(word, definition)
    @word = word
    @definition = definition
  end

  def edit_definition (new_definition)
    @definition = new_definition
  end

  def save
    @@all_terms << self
  end

  def full_term
    @word + ": " + @definition
  end

end
