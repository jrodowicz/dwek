require 'test_helper'

class ConcatMapperTest < ActiveSupport::TestCase

  def test_value_from
    subject = Dwek::Subject.new('1', first_name: 'Kevin', last_name: 'Deisz')

    mapper = Dwek::Mappers::ConcatMapper.new(:dest, {})
    mapper.add_mapper(:dest, :attribute, attribute: :first_name)
    mapper.add_mapper(:dest, :attribute, attribute: :last_name)

    assert_equal "Kevin\nDeisz", mapper.value_from(subject)
  end
end
