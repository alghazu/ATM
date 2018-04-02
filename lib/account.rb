require 'date'
class Account
  STANDARD_VALITDITY_YRS = 5

  attr_reader :pin_code, :exp_date, :account_status, :owner
  attr_accessor :balance

  def initialize(attrs={})
    @balance = 100
    @pin_code = rand(1000..9999)
    @exp_date = set_expire_date
    @account_status = :active
    set_owner(attrs[:owner])
  end

  def deactivate
    @account_status = :deactivated
  end

  private
  def set_expire_date
    Date.today.next_year(STANDARD_VALITDITY_YRS).strftime('%m/%y')
  end
  def set_owner(obj)
    obj == nil ? missing_owner : @owner = obj
  end
  def missing_owner
    raise "An Account owner is required"
  end

end
