describe 'Grunt Composer', ->

  beforeEach ->
    @composer = require '../tasks/composer'
    @grunt = require 'grunt'

  it 'sets up a registerTask on Grunt', ->
    spyOn(@grunt, 'registerTask')
    @composer @grunt
    expect(@grunt.registerTask).toHaveBeenCalledWith(
      'composer',
      'Wrapper around Composer commands',
      jasmine.any(Function)
    )
