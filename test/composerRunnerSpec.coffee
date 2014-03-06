describe 'Composer Runner Module', ->

  beforeEach ->
    @ComposerRunner = require('../tasks/lib/ComposerRunner')

  it 'should return correct command', ->
    composerCommand = 'update'
    config = {}

    @runner = new @ComposerRunner(config, composerCommand)

    expect(@runner.getExecCommand()).toBe("composer #{composerCommand}")

  it 'should run composer with php when usePhp is passed in config', ->
    config = usePhp: true
    composerCommand = 'update'

    @runner = new @ComposerRunner(config, composerCommand)

    expect(@runner.getExecCommand()).toBe("php composer #{composerCommand}")