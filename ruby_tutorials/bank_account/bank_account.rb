class BankAccount

  attr_reader :name

  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end

  def credit(d, amount)
    add_transaction(d, amount)
  end

  def debit(d, amount)
    add_transaction(d, -amount)
  end

  def add_transaction(d, amount)
    @transactions.push(description: d, amount: amount)
  end

  def balance
    balance = 0.0
    @transactions.each do |transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  def to_s
    "Name: #{name}, Balance: $#{sprintf("%0.2f", balance)}"
  end

  def print_register
    puts "#{name}'s Bank Account"
    puts "-" * 50
    puts "Description".ljust(30) + "Amount".rjust(10)
    @transactions.each do |transaction|
      puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount].to_s).rjust(10)
    end
    puts "-" * 50
    puts "Balance:".ljust(30) + "$#{sprintf("%0.2f", balance)}".rjust(10)
  end

end

bank_account = BankAccount.new("Natan Chawalitcheewin")
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)
bank_account.debit("Gas", 10.53)
bank_account.print_register