module SavingsAccount
  def self.interest_rate(balance)
    if balance >= 0 && balance < 1000
      0.5
    elsif balance >= 1000 && balance < 5000
      1.621
    elsif balance >= 5000
      2.475
    else 
      3.213
    end
  end

  def self.annual_balance_update(balance)
    balance + (interest_rate(balance) / 100) * balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    year = 0

    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      year += 1
    end

    return year
  end
end
