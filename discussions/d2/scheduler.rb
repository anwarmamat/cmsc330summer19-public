# Fill in these regular expressions
ID = //
NAME = //
HOMETOWN = //
DOB = //
EMAIL = //

# This is the regular expression for a single record
RECORD = /^#{ID},#{NAME},#{HOMETOWN},#{DOB},#{EMAIL}$/

class ApertureScheduler

  # phone? : String -> Boolean
  # Determines if a phone number is valid
  def self.phone?(number)
    false
  end

  # sanitize : Array -> Array
  # Returns non-corrupt employee records
  def self.sanitize(records)
    []
  end

  # schedule : Array -> Array
  # Returns schedule of newly formatted employee records
  def self.schedule(records)
    []
  end

end
