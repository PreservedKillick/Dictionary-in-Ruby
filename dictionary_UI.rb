require './lib/Term'

system "clear"

def main_menu
puts "\n\nCreate and Search Your Own Dictionary\n\n"
puts "Enter 'add' to add a new word to your dictionary."
puts "Enter 'list' to list all the words in your dictionary."
puts "Enter 'quit' to leave the dictionary.\n\n"

mm_input = gets.chomp
case mm_input
  when 'add'
    system "clear"
    add_term
  when 'list'
    system "clear"
    list_terms
  when 'quit'
    system "clear"
    puts "Ok!  Wallow in your ignorance.\n\n"
    exit
  else
    puts "Sorry, that was not a valid entry.\n\n"
    main_menu
  end
end

def add_term
  puts "Enter the word you would like to add:\n\n"
  word_input = gets.chomp
  puts "\n\nEnter the definition for the word:\n\n"
  def_input = gets.chomp
  new_term = Term.create(word_input, def_input)
  puts "\n\nYour new dictionary entry is\n"
  puts new_term.full_term
  puts "\n\n\n"

  new_term_index = Term.all.index(new_term)

  puts "Enter 'add' to add a new word to your dictionary."
  puts "Enter 'main' to return to the main menu."
  puts "Enter 'list' to list all the words in your dictionary."
  puts "Enter 'quit' to leave the dictionary.\n\n"
  at_input = gets.chomp
  case at_input
    when 'add'
      system "clear"
      add_term
    when 'main'
      system "clear"
      main_menu
    when 'list'
      system "clear"
      list_terms
    when 'quit'
      system "clear"
      puts "Ok!  Wallow in your ignorance.\n\n"
      exit
    else
      puts "Sorry, that was not a valid entry.\n\n"
      add_term
  end
end

def list_terms
  puts "\n\n\nHere are the words in your dictionary:\n\n"
  Term.all.each_with_index do |word, index|
    puts Term.all[index].word
  end
  puts "\n\n"
  puts "Enter 'add' to add a new word to your dictionary."
  puts "Enter 'edit' to edit a word in your dictionary."
  puts "Enter 'delete' to delete a word in your dictionary"
  puts "Enter 'main' to return to the main menu."
  puts "Enter 'quit' to leave the dictionary.\n\n"
  lt_input = gets.chomp
  case lt_input
    when 'add'
      system "clear"
      add_term

    when 'edit'
      puts "\n\nEnter the word you would like to edit.\n"
      term_to_edit = gets.chomp
      edit_entry(term_to_edit)

    when 'delete'
      puts "\n\nEnter the word you would like to delete.\n"
      term_to_delete = gets.chomp
      delete_term(term_to_delete)
    when 'main'
      system "clear"
      main_menu
    when 'quit'
      system "clear"
      puts "Ok!  Wallow in your ignorance.\n\n"
      exit
    else
      puts "\n\nSorry, that was not a valid entry.\n\n"
      list_terms
  end
end

def delete_term(term_to_delete)
  Term.delete_term(term_to_delete)
  Term.all.each_with_index do |word, index|
    puts Term.all[index].word
  list_terms
  end
end

def edit_entry(term_to_edit)
  system "clear"
  object = ''
  Term.all.each_with_index do |word, index|
    if Term.all[index].word == term_to_edit
      object = Term.all[index]
    end
  end
  puts "#{term_to_edit}:  #{object.definition}"
  puts "\n\nEnter the new definition for your term.\n"
  ed_input = gets.chomp
  object.edit_definition(ed_input)
  puts "\n\nYour edited entry is as follows:"
  puts object.full_term
  puts "\n\n\n"
  list_terms
end


main_menu
