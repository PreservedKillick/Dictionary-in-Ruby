require 'rspec'
require 'Term'

describe Term do
  before do
    Term.clear
  end

  it 'starts a new instance of a term' do
  new_term = Term.new("pen", "writing instrument")
  new_term.should be_an_instance_of Term
  end

  it 'consists of a word and a definition' do
    new_term = Term.new("pen", "writing instrument")
    new_term.word.should eq "pen"
    new_term.definition.should eq ["writing instrument"]
  end

  describe '#add_def' do
    it 'can can multiple definitions to a term' do
      new_term = Term.new("pen", "writing instrument")
      new_term.add_def("bic")
      new_term.definition.should eq ["writing instrument", "bic"]
    end
  end

  describe '.clear' do
    it "clears the list of terms" do
      new_term = Term.create("pen", "writing instrument")
      Term.clear
      Term.all.should eq []
    end
  end

  describe '.create' do
    it "creates a new instance of a term" do
      new_term = Term.create("pen", "writing instrument")
      new_term.should be_an_instance_of Term
    end
    it "saves the new instance of term" do
      new_term = Term.create("pen", "writing instrument")
      Term.all.should eq [new_term]
    end
  end

  describe '#save' do
    it 'saves a new instance of term to the global term array' do
      new_term = Term.new("pen", "writing instrument")
      new_term.save
      Term.all.should eq [new_term]
    end
  end

  describe '#full_term' do
    it 'lists out the new entry, word and definition, with a colon in between' do
      new_term = Term.create("pen", "writing instrument")
      new_term.full_term.should eq "pen: writing instrument"
    end
  end

  describe '.delete_term' do
    it "deletes an instance of a term" do
      new_term = Term.create("pen", "writing instrument")
      Term.delete_term("pen").should eq []
    end
  end

  describe '#edit_definition' do
    it 'allows user to edit the properties of a term object' do
      new_term = Term.create("monkey", "fun")
      new_term.edit_definition("unfun")
      new_term
      new_term.definition.should eq "unfun"
    end
  end

  describe ".search" do
    it 'allows user to search for and return the object for a given term' do
      mango = Term.create("mango", "tropical fruit")
      apple = Term.create("apple", "fruit")
      Term.search("mango").should eq mango
    end
  end
end

