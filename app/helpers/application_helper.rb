require 'securerandom'
module ApplicationHelper
  def destroy_path(model)
    send(model.class.to_s.downcase + '_path', model.id)
  end

  def show_path(model)
    send(model.class.to_s.downcase + '_path', model.id)
  end

  def french_date(date)
    mapping = {
      'Saturday' => 'Samedi',
      'Sunday' => 'Dimanche',
      'Monday' => 'Lundi',
      'Tuesday' => 'Mardi',
      'Wednesday' => 'Mercredi',
      'Thursday' => 'Jeudi',
      'Friday' => 'Vendredi'
    }
    mapping[date.strftime('%A')] + ' ' + date.strftime('%d')
  end

  def random_uuid
    SecureRandom.uuid
  end
end
