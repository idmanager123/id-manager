class OptionConstants

  EYE_COLORS = %w{BLK BRN BLU HAZ GRN}
  HAIR_COLORS = %w{BLK BRN BLN RED WHI GRY BAL}
  STATES = ["AK", "AL", "AR", "AZ", "CA", "CO", "CT", "DE", "FL", "GA", "HI",
            "IA", "ID", "IL", "IN", "KS", "KY", "LA", "MA", "MD", "ME", "MI",
            "MN", "MO", "MS", "MT", "NC", "ND", "NE", "NH", "NJ", "NM", "NV",
            "NY", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT",
            "VA", "VT", "WA", "WV", "WY"]
  class << self
    def random_eye_color
      EYE_COLORS.sample
    end

    def random_hair_color
    HAIR_COLORS.sample
    end

    def random_state
      STATES.sample
    end
  end
end
