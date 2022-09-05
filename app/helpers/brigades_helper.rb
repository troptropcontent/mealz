module BrigadesHelper
  def chefs_list(brigade)
    brigade.guests.map { |guest| guest.nickname.capitalize }.join(', ')
  end
end
