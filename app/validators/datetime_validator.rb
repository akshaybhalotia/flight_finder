class DatetimeValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must be a valid date time") if (!value.is_a?(Time))
  end
end
