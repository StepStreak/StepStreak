module ChallengeHelper
  def challenge_rank(rank)
    case rank
    when 1
      challenge_rank_medal('🥇')
    when 2
      challenge_rank_medal('🥈')
    when 3
      challenge_rank_medal('🥉')
    else
      rank
    end
  end

  def challenge_rank_medal(medal)
    tag.span style: 'font-size:25px;' do
      medal
    end
  end
end