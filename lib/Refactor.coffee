coffee = require 'coffee-script'
_ = require 'underscore'
{ inspect } = require 'util'

module.exports = class Refactor

  constructor: (code) ->
    @node = new Expressions coffee.nodes code
    # console.log inspect @node, false, null

  find: (range) ->
    return unless range?
    @node.find new Range range


class Node

  constructor: ({ locationData }, @parent) ->
    @range = new Range locationData
    @children = []

    # params, args
    # if params?
    #   @children = @children.concat new Param val, @ for val in params
    # if args?
    #   @children = @children.concat new Arg val, @ for val in args

class Expressions extends Node

  constructor: ({ expressions }) ->
    super
    @children = @children.concat new Expression val, @ for val in expressions

  find: (range) ->
    founds = for child in @children
      child.find range
    return founds if @parent?

    founds = _.compact _.flatten founds
    results = for node in founds
      @search node.value
    results = _.compact _.flatten results
    i = results.length
    while i--
      result = results[i]
      if founds.indexOf(result) isnt -1
        results.splice i, 1

    console.log 'find:', range.toString()
    for result, i in results
      console.log i, result.range.toString()

    results

  search: (value) ->
    for child in @children
      child.search value

class Expression extends Node

  constructor: (data) ->
    super
    { variable, value } = data
    if variable?
      @children.push new Variable variable, @
    if value?
      @children.push new Value value, @

class Variable extends Node

  constructor: (data) ->
    super
    { base } = data
    if base?
      @children.push new Base base, @

class Value extends Expression

  constructor: (data) ->
    super
    { base, first, second } = data
    if base?
      @children.push new Base base, @
    if first?
      @children.push new Value first, @
    if second?
      @children.push new Value second, @

class Param extends Node

  constructor: ({ name }) ->
    super
    @children.push new Name name, @

class Arg extends Node

  constructor: ({ base }) ->
    super
    @children.push new Base base, @

class Name extends Node

  constructor: (data) ->
    super
    { value } = data
    @value = value
    console.log @range.toString(), @value

  find: (range) ->
    return @ if range.equals @range

  search: (value) ->
    return @ if value is @value

class Base extends Node

  constructor: (data) ->
    super
    { value } = data
    @value = value
    console.log @range.toString(), @value

  find: (range) ->
    return @ if range.equals @range

  search: (value) ->
    return @ if value is @value


class Range

  constructor: ({ start, end }) ->
    if start? and end?
      @start = new Point start.row, start.column
      @end = new Point end.row, end.column
    else
      { first_line, first_column, last_line, last_column } = arguments[0]
      @start = new Point first_line, first_column
      @end = new Point last_line, last_column + 1

  equals: ({ start, end }) ->
    start.equals(@start) and end.equals(@end)

  toString: ->
    "#{@start.toString()}-#{@end.toString()}"

class Point

  constructor: (@row, @column) ->

  equals: ({ row, column }) ->
    row is @row and column is @column

  toString: ->
    "[#{@row}:#{@column}]"
