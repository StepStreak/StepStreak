module TournamentHelper
  def tournament_indicator_color(tournament, scale)
    if tournament.ended?
      "bg-red-#{scale}"
    elsif tournament.started?
      "bg-emerald-#{scale}"
    else
      "bg-amber-#{scale}"
    end
  end
end