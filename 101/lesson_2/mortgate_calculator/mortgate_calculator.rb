# mortage_calculator.rb

def prompt(message)
  puts ">> #{message}"
end

def valid_int?(num)
  num.to_i.to_s == num
end

def valid_num?(num)
  !num.empty? && num.to_f > 0
end

def valid_duration?(num)
  (num.to_i.to_s == num) && num.to_i > 0
end

puts('Welcome to the Mortgage / Car Loan Calculator.')

loan_dollars = ''
loop do
  prompt('Please enter the loan amount in USD:')
  loan_dollars = gets.chomp
  break if valid_num?(loan_dollars)
  puts 'Must be a valid number (ex: 10000.00 or 10000)'
end

loan_APR = ''
loop do
  prompt("Please enter the APR (ex: enter 1.5 for 1.5% APR):")
  loan_APR = gets.chomp
  break if valid_num?(loan_APR)
  puts "APR must be a positive number (ex: enter 1.5 for 1.5% APR)"
end

loan_duration = ''
loop do
  prompt('Please enter the loan length in years:')
  loan_duration = gets.chomp
  break if valid_duration?(loan_duration)
  puts 'Loan length must be a positive number of years (ex: 5)'
end

yearly_interest_rate = loan_APR.to_f / 100
monthly_interest_rate = yearly_interest_rate.to_f / 12
duration_months = loan_duration.to_i * 12
monthly_payment = loan_dollars.to_f * (monthly_interest_rate.to_f / (1 - (1 + monthly_interest_rate.to_f)**(-duration_months.to_i)))

puts "Your monthly payment will be $#{format('%02.2f', monthly_payment)}"
