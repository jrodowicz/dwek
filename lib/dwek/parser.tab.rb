#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.12
# from Racc grammer file "".
#

require 'racc/parser.rb'

# $Id$
module Dwek
  class Parser < Racc::Parser

module_eval(<<'...end parser.y/module_eval...', 'parser.y', 23)
  attr_accessor :mapper_list

  class MapperProxy
    def initialize(destination, mapper_type, assignment_list = [])
      @destination = destination.to_sym
      @mapper_type = mapper_type.to_sym
      @options = {}

      assignment_list.each do |assignment|
        @options.merge!(assignment.to_h)
      end
    end

    def to_mapper
      [@destination, @mapper_type.to_sym, @options]
    end
  end

  class Assignment
    def initialize(key, value)
      @key = key
      @value = value
    end

    def to_h
      { @key.to_sym => @value }
    end
  end

  def parse(string)
    @mapper_list = MapperList.new
    @current_line = 1
    @tokens = make_tokens(string)
    do_parse
  end

  def make_tokens(string)
    result = []
    until string.empty?
      case string
      when /\A(?:\r\n|\r|\n)/
        result << [:NEWLINE, nil]
        @current_line += 1
      when /\A\s+/
        # ignore non-newline whitespace
      when /\A\[(\w+)\]/
        result << [:MAPPER, $1]
      when /\A(?:map|as|with|:|\[|\]|\,)/
        result << [$&, nil]
      when /\A\'(\w+)\'/, /\A\"(\w+)\"/
        result << [:STRING, $1]
      else
        raise SyntaxError, "line #{@current_line}"
      end
      string = $'
    end
    result << [false, '$end']
    result
  end

  def next_token
    @tokens.shift
  end
...end parser.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    28,    11,    21,    13,    29,    30,    13,    27,    23,     8,
     9,     3,    13,     7,    18,    18,    20,     6,    13,    13,
     3,     4,    31 ]

racc_action_check = [
    23,     9,    20,     9,    26,    26,    12,    23,    20,     6,
     8,     0,    11,     4,    14,    17,    18,     3,    21,    22,
     2,     1,    30 ]

racc_action_pointer = [
     9,    21,    18,    14,    13,   nil,     5,   nil,     5,    -5,
   nil,     4,    -2,   nil,    11,   nil,   nil,    12,     9,   nil,
    -1,    10,    11,    -3,   nil,   nil,    -6,   nil,   nil,   nil,
    19,   nil ]

racc_action_default = [
   -16,   -16,    -1,   -16,   -16,    -2,   -16,    32,   -16,   -16,
    -3,   -16,    -9,   -11,   -16,   -10,    -4,    -5,   -16,    -6,
   -16,   -16,   -16,   -16,    -7,    -8,   -16,   -13,   -14,   -12,
   -16,   -15 ]

racc_goto_table = [
    10,    16,    14,    15,    19,     1,    22,     5,    26,   nil,
   nil,   nil,    24,    25 ]

racc_goto_check = [
     3,     4,     3,     3,     4,     1,     6,     1,     8,   nil,
   nil,   nil,     3,     3 ]

racc_goto_pointer = [
   nil,     5,   nil,    -9,   -13,   nil,   -14,   nil,   -15 ]

racc_goto_default = [
   nil,   nil,     2,   nil,   nil,    17,   nil,    12,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  1, 13, :_reduce_none,
  2, 13, :_reduce_none,
  5, 14, :_reduce_3,
  7, 14, :_reduce_4,
  1, 16, :_reduce_5,
  2, 16, :_reduce_6,
  4, 17, :_reduce_7,
  4, 17, :_reduce_8,
  1, 15, :_reduce_none,
  2, 15, :_reduce_none,
  1, 19, :_reduce_none,
  3, 18, :_reduce_12,
  2, 18, :_reduce_13,
  1, 20, :_reduce_14,
  3, 20, :_reduce_15 ]

racc_reduce_n = 16

racc_shift_n = 32

racc_token_table = {
  false => 0,
  :error => 1,
  "map" => 2,
  :STRING => 3,
  "as" => 4,
  :MAPPER => 5,
  "with" => 6,
  ":" => 7,
  :NEWLINE => 8,
  "[" => 9,
  "]" => 10,
  "," => 11 }

racc_nt_base = 12

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "\"map\"",
  "STRING",
  "\"as\"",
  "MAPPER",
  "\"with\"",
  "\":\"",
  "NEWLINE",
  "\"[\"",
  "\"]\"",
  "\",\"",
  "$start",
  "mapping_list",
  "mapping",
  "linebreak_list",
  "assignment_list",
  "assignment",
  "array",
  "linebreak",
  "array_contents" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

# reduce 1 omitted

# reduce 2 omitted

module_eval(<<'.,.,', 'parser.y', 5)
  def _reduce_3(val, _values, result)
     @mapper_list.add_mapper(*MapperProxy.new(val[1], val[3]).to_mapper) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 6)
  def _reduce_4(val, _values, result)
     @mapper_list.add_mapper(*MapperProxy.new(val[1], val[3], val[6]).to_mapper) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 7)
  def _reduce_5(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 8)
  def _reduce_6(val, _values, result)
     result = [val[0]] + val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 9)
  def _reduce_7(val, _values, result)
     result = Assignment.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 10)
  def _reduce_8(val, _values, result)
     result = Assignment.new(val[0], val[2]) 
    result
  end
.,.,

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

module_eval(<<'.,.,', 'parser.y', 13)
  def _reduce_12(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 14)
  def _reduce_13(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 15)
  def _reduce_14(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'parser.y', 16)
  def _reduce_15(val, _values, result)
     result = val[0] + [val[2]] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Dwek
