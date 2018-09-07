VALID_CHOICES = %w(rock paper scissors spock lizard).freeze
WIN_SCENARIOS = {
  rock: %w(lizard scissors),
  paper: %w(rock spock),
  scissors: %w(paper lizard),
  lizard: %w(spock paper),
  spock: %w(rock scissors)
}.freeze

def prompt(message)
  puts "=> #{message}"
end

def win?(p1_choice, p2_choice)
  WIN_SCENARIOS[p1_choice.to_sym].include?(p2_choice)
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
  player_choice = ''

  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')}"
    player_choice = gets.chomp
    break if VALID_CHOICES.include?(player_choice)
    puts 'Invalid choice.'
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose #{player_choice}; Computer chose #{computer_choice}"

  display_results(player_choice, computer_choice)
end
