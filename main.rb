def run(input)
  score = 0
  next_shot = 0
  second_next_shot = 0
  next_spare = false
  input.reverse.each.with_index do |shot, i|
    next if shot == '-'

    dont_add = false
    dont_add = true if input.length == 21 && i < 3 || input.length == 20 && i < 2

    if next_spare
      next_spare = false
    elsif shot == 'X'
      score += 10

      unless dont_add

        if second_next_shot == '/'
          score += 10
        else
          if ['X', '/'].include?(next_shot)
            score += 10
          else
            score + next_shot
          end

          score += if ['X', '/'].include?(second_next_shot)
                     10
                   else
                     second_next_shot
                   end
        end
      end
    # shot = 10
    elsif shot == '/'
      # shot = 10
      next_spare = true

      score += 10

      unless dont_add
        score += if next_shot == 'X'
                   10
                 else
                   next_shot
                 end
      end
    else
      score += shot
    end

    next_shot = shot
    second_next_shot = next_shot

    puts score
  end

  score
end

input = [
  8, '/',
  5, 4,
  9, 0,
  'X', '-',
  'X', '-',
  5, '/',
  5, 3,
  6, 3,
  9, '/',
  9, '/', 'X'
]

puts run(input)
