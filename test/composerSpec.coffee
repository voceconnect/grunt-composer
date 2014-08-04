describe 'Grunt Composer', ->

  beforeEach ->
    @mockery = require 'mockery'

    @composer = require '../tasks/composer'
    @grunt = require 'grunt'
    @mockery.enable()


  afterEach ->
    @mockery.disable()

  it 'sets up a registerTask on Grunt', ->
    spyOn(@grunt, 'registerMultiTask')
    @composer @grunt
    expect(@grunt.registerMultiTask).toHaveBeenCalledWith(
      'composer',
      'Wrapper around Composer commands',
      jasmine.any(Function)
    )