describe 'Grunt Composer', ->

  beforeEach ->
    @mockery = require 'mockery'

    @composer = require '../tasks/composer'
    @grunt = require 'grunt'
    @mockGruntFunction = @getMockGruntFunction();
    @mockery.enable()


  afterEach ->
    @mockery.disable()

  it 'sets up a registerTask on Grunt', ->
    spyOn(@grunt, 'registerTask')
    @composer @grunt
    expect(@grunt.registerTask).toHaveBeenCalledWith(
      'composer',
      'Wrapper around Composer commands',
      jasmine.any(Function)
    )