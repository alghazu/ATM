class Person
  attr_reader :name, :cash, :account
  def initialize (name=nil, cash = 0, account = nil)
    name_exist?(name)
    @cash = cash
    @account = account
  end

  private
  def name_exist?(name)
    if name != nil
      @name = name
    else
      raise 'A name is required'
    end
  end

end
