# calculator.rb

LANGUAGE = 'en'
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

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
            when '1' then messages('add', LANGUAGE)
            when '2' then messages('sub', LANGUAGE)
            when '3' then messages('mult', LANGUAGE)
            when '4' then messages('div', LANGUAGE)
            end
  message
end

prompt(messages('welcome', LANGUAGE))

name = ''
loop do
  name = Kernel.gets.chomp

  break unless name.empty?
  prompt(messages('valid_name', LANGUAGE))
end

prompt("#{messages('greet', LANGUAGE)} #{name}!")

loop do
  number1 = ''
  loop do
    prompt(messages('first_num', LANGUAGE))
    number1 = Kernel.gets.chomp
    break if number?(number1)
    puts messages('valid_num', LANGUAGE)
  end

  number2 = ''
  loop do
    prompt(messages('second_num', LANGUAGE))
    number2 = Kernel.gets.chomp
    break if number?(number2)
    puts messages('valid_num', LANGUAGE)
  end

  prompt(messages('operator_prompt', LANGUAGE))

  operator = ''
  loop do
    operator = Kernel.gets.chomp
    break if %w[1 2 3 4].include?(operator)
    prompt(messages('valid_op', LANGUAGE))
  end

  prompt("#{operation_to_message(operator)} #{messages('two_nums', LANGUAGE)}")

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

  prompt("#{messages('result_is', LANGUAGE)} #{result}")

  prompt(messages('another', LANGUAGE))
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(messages('thank_you', LANGUAGE))
