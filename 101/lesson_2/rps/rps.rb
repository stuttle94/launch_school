VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'paper' && second == 'rock')
end

def display_results(player, computer)
  if win?(player, computer)
    puts 'You won!'
  elsif win?(computer, player)
    puts 'Computer won!'
  else
    puts "It's a tie"
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    puts 'Invalid choice.'
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{choice}; Computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  prompt 'Do you want to play again?'
  play_again = gets.chomp
  break if play_again.downcase.start_with?('n')
end

puts 'Thank you for playing!'
