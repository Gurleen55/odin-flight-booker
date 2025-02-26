class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"
  has_many :bookings

  def self.search(params)
      params = params.permit(:departure_airport_id, :arrival_airport_id, :time)
      conditions = params.slice(:departure_airport_id, :arrival_airport_id).delete_if { |_, v| v.blank? }

      if params[:time].present?
        time = Time.zone.parse(params[:time]) rescue nil
        if time
          start_time = time.beginning_of_day
          end_time = time.end_of_day
          conditions[:time] = start_time..end_time
        end
      end

      conditions.to_h.any? ? Flight.where(conditions) : []
  end

  def formatted_time
    time.strftime("%d/%m/%Y") if time.present?
  end
end
