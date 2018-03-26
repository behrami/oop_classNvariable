class BankAccount

  @@interest_rate= 2.0
  @@accounts=[]

  def initialize
    @balance=0
  end

  def balance
    return @balance
  end

  def balance=(balance)
    @balance=balance

  end

  def deposit(amount)
    @balance +=amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def self.create
    new_account=BankAccount.new
    @@accounts.push(new_account)
    return new_account
  end

  def self.total_funds
    total=0.0
    @@accounts.each do |accOBJ|
      total+=accOBJ.balance
    end
    return total
  end

  def self.interest_time
    @@accounts.each do |accOBJ|
      p accOBJ
      accOBJ.balance += (accOBJ.balance*@@interest_rate/100)
    end
  end
end


myACC=BankAccount.create
myACC.deposit(20)

seanACC=BankAccount.create
seanACC.deposit(10)

p myACC
p seanACC

p BankAccount.total_funds
p BankAccount.interest_time
