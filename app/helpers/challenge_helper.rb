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

  def challenge_king_of_the_hill?(king_id, challenge_user_id)
    if king_id == challenge_user_id
      challenge_rank_medal('👑')
    else
      '-'
    end
  end

  def challenge_participants_count(challenge)
    challenge.team? ? challenge.teams.count : challenge.challenge_users.count
  end

  def challenge_participants_label(challenge)
    challenge.team? ? t('.teams') : t('.participants')
  end

  def challenge_rank_medal(medal)
    tag.span style: 'font-size:25px;' do
      medal
    end
  end

  def challenges_sub_navigation_classes(active)
    if active
      'text-white bg-gray-900 dark:bg-gray-300 dark:text-gray-900'
    else
      'text-gray-900 hover:bg-gray-200 dark:text-white dark:hover:bg-gray-700'
    end
  end
end