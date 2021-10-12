require './math_game'
require './math_questions'
require './player'

# Initialize player 1 
player1 = Player.new

# Initialize player 2 
player2 = Player.new

# Create new game
game = MathGame.new

# Play game
def play_round(player, game)
  q = MathQuestions.new
  puts "#{player.name}: #{q.question}"
  print "> "

  playerAns = $stdin.gets.chomp
  correctAns = q.answer
  isCorrect = game.compareAns(correctAns, playerAns)

  puts "#{game.check_answer(isCorrect)}"

  if (!isCorrect) 
    player.lose
  end
end

# Print the score of both players
def print_score(player1, player2)
  puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
end

# Check if the game should continue
def continue_playing(player1, player2)
  return player1.lives > 0 && player2.lives > 0
end

# End of game
def print_winner_message(player)
  puts "The winner is #{player.name} with a score of #{player.lives}/3"
  puts "-------- GAME OVER -------------"
end


players = [player1, player2]


# GAME LOGIC
begin
  for player in players
    play_round(player, game)
    print_score(player1, player2)
    if player.lives == 0
      players.delete(player)
      print_winner_message(players[0])
      break
    end
  end
end while continue_playing(player1, player2)





# OLD NON-REFACTORED CODE ------------------------------------------
# #  Game Begins Here
# begin
  
# # Player 1
# q = MathQuestions.new

# puts "#{player1.name}: #{q.question}"
# print "> "

# playerAns = $stdin.gets.chomp
# correctAns = q.answer
# isCorrect = game.compareAns(correctAns, playerAns)

# puts "#{game.check_answer(isCorrect)}"

# if (!isCorrect) 
#   player1.lose
# end

# puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"

# if player1.lives == 0
#   puts "The winner is #{player2.name} with a score of #{player2.lives}/3"
#   puts "-------- GAME OVER -------------"

#   break
# end

# puts "--------- NEW TURN -------------"

# # ----------------------------------------------------------

# # Player 2
# q = MathQuestions.new

# puts "#{player2.name}: #{q.question}"
# print "> "

# playerAns = $stdin.gets.chomp
# correctAns = q.answer
# isCorrect = game.compareAns(correctAns, playerAns)

# puts "#{game.check_answer(isCorrect)}"

# if (!isCorrect) 
#   player2.lose
# end

# puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"

# if player2.lives == 0
#   puts "The winner is #{player1.name} with a score of #{player1.lives}/3"
#   puts "-------- GAME OVER -------------"

#   break
# end

# puts "--------- NEW TURN -------------"

# end while player1.lives > 0 && player2.lives > 0