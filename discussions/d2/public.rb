require "minitest/autorun"
require_relative "scheduler.rb"

VALID = ["10,Cave Johnson,Chicago,12-15-1901,lemons@aperturescience.com",
         "54388,Doug Rattmann,Atlanta,05-20-1950,beans@gmail.com",
         "730,Caroline McLain,Portland,01-17-1930,potato@aperturescience.com"]

VALID_FORMATED = ["10,Johnson Cave,Chicago,1901-12-15,lemons@aperturescience.com",
                  "730,McLain Caroline,Portland,1930-01-17,potato@aperturescience.com",
                  "54388,Rattmann Doug,Atlanta,1950-05-20,beans@gmail.com"]

INVALID = ["7,On Kawara,Kariya,12-24-1932,on@gmail.com",
           "22,mark rothko,Dvinsk,06-25-1903,rothko@yahoo.com",
           "559,Piet Mondrian,Amersfoort Holland,03-01-1944,mondrian@hotmail.com",
           "44837,Jackson Pollock,Cody,January 28 1912,pollock@aol.com",
           "3348,Salvador Dali,Figueres,05-11-1904,dali at melting clocks dot ants"]

ALL = VALID + INVALID

class PublicTests < Minitest::Test

  def test_public_phone?
    assert(ApertureScheduler.phone? "(555) 123-4567")
    assert(ApertureScheduler.phone? "555-123-4567")
    refute(ApertureScheduler.phone? "(555 123-4567")
    refute(ApertureScheduler.phone? "55-123-4567")
    refute(ApertureScheduler.phone? "555-123-467")
  end

  def test_public_sanitize
    assert_equal(VALID.sort, ApertureScheduler.sanitize(ALL).sort)
  end

  def test_public_schedule
    assert_equal(VALID_FORMATED, ApertureScheduler.schedule(ALL))
  end

end
