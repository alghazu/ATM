require 'date'
class Atm
  attr_accessor :funds

  def initialize
    @funds = 1000
  end

  def withdraw(amount,pin_code, account)
    case
    when insufficient_funds_in_account?(amount,account)
      {status: false, message: 'insufficient funds', date: Date.today}
    when insufficient_funds_in_atm?(amount)
      {status: false, message: 'insufficient funds in ATM',date: Date.today}
    when incorrect_pin?(pin_code, account.pin_code)
      {status: false, message: 'wrong pin', date: Date.today}
    when card_expired?(account.exp_date)
      {status: false, message: 'card expired', date: Date.today}
    when account_disabled?(account.account_status)
      {status: false, message: 'account disabled', date: Date.today}
    else
      perform_transaction(amount, account)
    end
  end

    private
    def insufficient_funds_in_account?(amount,account)
      amount > account.balance
    end
    def perform_transaction(amount,account)
      @funds -=amount
      account.balance -= amount
      {status: true, message: 'success', date: Date.today, amount: amount, bills: add_bills(amount)}
    end
    def add_bills(amount)
      bills = []
      twenties = amount/20
      tens = (amount%20)/10
      fives = (amount%10)/5
      twenties.times {bills << 20}
      tens.times {bills << 10}
      fives.times {bills << 5}
      bills
    end
    def insufficient_funds_in_atm?(amount)
      amount > @funds
    end
    def incorrect_pin?(pin_code, actual_pin)
      pin_code != actual_pin
    end
    def card_expired?(exp_date)
      Date.strptime(exp_date, '%m/%y')<Date.today
    end
    def account_disabled?(status)
      status != :active
    end
end
