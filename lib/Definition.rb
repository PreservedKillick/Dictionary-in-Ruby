class Definition
attr_reader :description

  def initialize (description)
    @description = description
  end

  def create(description)
    new_definition = Definition.new(description)
  end

  # def edit(description)
  # end

end
