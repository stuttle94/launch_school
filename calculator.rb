require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def integer?(num)
  num.to_i.to_s == num
end

def float?(num)
  num.to_f.to_s == num
end

def number?(num)
  integer?(num) || float?(num)
end

def operation_to_message(operator)
  message = case operator
            when '1' then 'Adding'
            when '2' then 'Subtracting'
            when '3' then 'Multiplying'
            when '4' then 'Dividing'
            end
  message
end

prompt('Welcome to Calculator! Enter your name:')

name = ''
loop do
  name = Kernel.gets.chomp

  break unless name.empty?
  prompt('Make sure to use a valid name.')
end

prompt("Hello #{name}!")

loop do
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets.chomp
    break if number?(number1)
    puts "That's not a valid number."
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets.chomp
    break if number?(number2)
    puts "That's not a valid number."
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets.chomp
    break if %w[1 2 3 4].include?(operator)
    prompt('Must choose 1, 2, 3, or 4.')
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")

  prompt('Do you want to perform another calculation? (Y to calculate again)')
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for using the calculator, goodbye.')
