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

  def withdraw(arg)
    if arg[:atm] !=nil
      arg[:atm].withdraw(arg[:amount],arg[:pin],arg[:account])
      @cash +=arg[:amount]
    else
      raise 'An ATM is required'
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
