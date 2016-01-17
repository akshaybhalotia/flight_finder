class DateValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "must be a valid date") if (!value.is_a?(Date))
  end
end
