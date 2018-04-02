require './lib/account'

class Person
  attr_accessor :name, :cash, :account

  def initialize (name=nil, cash = 0, account = nil)
    @name = name_exist?(name)
    @cash = cash
    @account = account
  end
  def create_account
    @account = Account.new(owner: self)
  end
  def deposit(amount)
    if self.account != nil
      @account.balance +=amount
      @cash -=amount
    else
      raise 'No account present'
    end 
  end
  private
  def name_exist?(name)
    if name != nil
      name
    else
      raise 'A name is required'
    end
  end



end
