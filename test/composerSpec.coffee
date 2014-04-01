describe 'Grunt Composer', ->

  beforeEach ->
    @mockery = require 'mockery'

    @mockComposerRunner = getMockComposer()
    @composer = require '../tasks/composer'
    @grunt = require 'grunt'
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

  it 'should call getExecCommand on composerRunner module', ->
    @mockery.registerMock('./lib/commandBuilder', @mockComposerRunner)
    expectedCommand = 'some command'
    expectedFlags = ['some flag']

    mockGruntFunction = getMockGruntFunction()
    @composer.handleTask(mockGruntFunction, expectedCommand, expectedFlags)

    expect(@mockComposerRunner).toHaveBeenCalledWith(
      some: 'mock',
      expectedCommand, expectedFlags
    )

  getMockComposer = ->
    mock = jasmine.createSpy()
    mock.prototype.getExecCommand = jasmine.createSpy()
    return mock

  getMockGruntFunction = ->
    options: jasmine.createSpy().andReturn(some: 'mock')

