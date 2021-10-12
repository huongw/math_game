class MathGame

def compareAns(expect, actual)
  return expect == actual.to_i
end

def check_answer(answer)
  response = answer ? "You are correct!" : "Wrong answer!"
  return response
end

end