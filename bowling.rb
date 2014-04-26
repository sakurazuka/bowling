class Bowling
  # ☆ ストライクの場合は，次の2投の合計+10を加算する
  # ☆ スペアの場合は，次の1投+10を加算する
  # ☆ それ以外の場合は，1フレーム中で倒した本数を単純に加える
  # ☆ 10フレーム目は変則で，2投あるいは3投した合計をそのまま加算する

  def calc(data)
    score = 0

    data.each_cons(2) do |frame,next_frame|
      score += calc_nomal_frame(frame,next_frame)
    end

    score += calc_last_frame(data.last)

    return score
  end

  def calc_nomal_frame(frame,next_frame)
    sum = 0
    if frame[0] == 'X'
      sum += calc_frame(next_frame)
      sum += 10
    elsif frame[1] == '/'
      sum += calc_throwing(next_frame[0])
      sum += 10
    else
      sum += calc_throwing(frame[0])
      sum += calc_throwing(frame[1])
    end
    sum
  end

  def calc_last_frame(frame)
    sum = 0
    if frame[1] == '/'
      sum += 10
      sum += calc_throwing(frame[2])
    elsif frame[2] == '/'
      sum += calc_throwing(frame[0])
      sum += 10
    else
      sum += calc_throwing(frame[0])
      sum += calc_throwing(frame[1])
    end
    sum
  end

  def calc_frame(frame)
    if frame[0] == 'X' || frame[1] == '/';
      10
    else
      calc_throwing(frame[0]) + calc_throwing(frame[1])
    end
  end

  def calc_throwing(throwing)
    case throwing
    when 'X'; 10
    when '-'; 0
    when 0..9; throwing
    else raise "#{throwing}"
    end
  end
end
