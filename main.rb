def run(input)
  score = 0
  next_shot = 0
  second_next_shot = 0

  input.reverse.each.with_index do |shot, i|
    next if shot == '-'

    last_round = input.length == 21 && i < 3 || input.length == 20 && i < 2

    unless next_shot == '/'
      if shot == 'X'
        score += 10
        unless last_round
          if second_next_shot == '/'
            score += 10
          else
            score += next_shot == 'X' ? 10 : next_shot
            score += second_next_shot == 'X' ? 10 : second_next_shot
          end
        end
      elsif shot == '/'
        score += 10
        score += next_shot == 'X' ? 10 : next_shot unless last_round
      else
        score += shot
      end
    end

    second_next_shot = next_shot
    next_shot = shot

    puts score
  end

  score
end

input = [
  8, '/', # 149
  5, 4, # 134
  9, 0, # 125
  'X', '-', # 116
  'X', '-', # 91
  5, '/', # 71
  5, 3, # 56
  6, 3, # 48
  9, '/', # 39
  9, '/', 'X' # 20
]

puts run(input)
