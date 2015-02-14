module MaskedDate
  class Date
    attr_reader :date, :mask
    attr_accessor :year_format, :month_format, :day_format, :field_sep

    YEARBIT      = 1
    MONTHBIT     = YEARBIT << 1
    DAYBIT       = MONTHBIT << 1
    YEAR_FORMAT  = 'Y'
    MONTH_FORMAT = 'm'
    DAY_FORMAT   = 'd'
    FIELD_SEP    = '-'

    def initialize ymd={ y: nil, m: nil, d: nil, msk: nil }
      @date = ::Date.new (ymd[:y] || 0), (ymd[:m] || 1), (ymd[:d] || 1)
      @mask = ymd[:msk]
      if ! @mask
        @mask = 0
        @mask |= YEARBIT   if ymd[:y]
        @mask |= MONTHBIT  if ymd[:m]
        @mask |= DAYBIT    if ymd[:d]
      end

      @year_format  = YEAR_FORMAT
      @month_format = MONTH_FORMAT
      @day_format   = DAY_FORMAT
      @field_sep    = FIELD_SEP
    end

    def formats
      [[ YEARBIT, year_format ], [ MONTHBIT, month_format ], [DAYBIT, day_format ]]
    end

    def field_present? field_mask
      mask & field_mask > 0
    end

    def year
      date.year  if field_present?(YEARBIT)
    end

    def month
      date.month if field_present?(MONTHBIT)
    end

    def day
      date.day   if field_present?(DAYBIT)
    end

    def format_string
      formats.map{ |b,f| "%#{f}" if field_present?(b) }.compact.join field_sep
    end

    def to_s
      date.strftime format_string
    end
  end
end
