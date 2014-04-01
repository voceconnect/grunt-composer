describe 'Grunt Composer', ->

  beforeEach ->
    @composer = require '../tasks/composer'
    @grunt = require 'grunt'
    @mockery = require 'mockery'
    @mockery.enable()

    @mockComposerRunner = getMockComposer()

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

  it 'should call getExecCommand on composerRunner module', ->
    @mockery.registerMock('./lib/composerRunner')

  getMockComposer = ->
    mock = jasmine.createSpy()
    mock.getExecCommand = jasmine.createSpy()
    return mock

