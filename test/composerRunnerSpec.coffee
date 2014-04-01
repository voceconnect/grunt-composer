describe 'Composer Runner Module', ->

  beforeEach ->
    @ComposerRunner = require('../tasks/lib/ComposerRunner')

  it 'should return correct command', ->
    composerCommand = 'update'
    config = {}

    @runner = new @ComposerRunner(config, composerCommand)

    expect(@runner.getExecCommand()).toBe(
      "composer #{composerCommand}"
    )

  it 'should run composer with php when usePhp is passed in config', ->
    config = usePhp: true
    composerCommand = 'update'

    @runner = new @ComposerRunner(config, composerCommand)

    expect(@runner.getExecCommand()).toBe(
      "php composer #{composerCommand}"
    )

  it 'should run composer from the specified file in config', ->
    composerLocation = '/heres/some/phar'
    config = composerLocation: composerLocation
    composerCommand = 'update'

    @runner = new @ComposerRunner(config, composerCommand)

    expect(@runner.getExecCommand()).toBe(
      "#{composerLocation} #{composerCommand}"
    )

  it 'should prefix with php when composerLocation' +
      'set in config and usePHP enabled', ->
    composerLocation = '/heres/some/phar'
    composerCommand = 'update'
    config =
      composerLocation: composerLocation
      usePhp: true

    @runner = new @ComposerRunner(config, composerCommand)

    expect(@runner.getExecCommand()).toBe(
      "php #{composerLocation} #{composerCommand}"
    )

  it 'should ammend the correct flags to composer command', ->
    composerCommand = 'update'
    composerFlags = ['here', 'is', 'a', 'flag']
    config = {}

    @runner = new @ComposerRunner(config, composerCommand, composerFlags)

    expect(@runner.getExecCommand()).toBe(
      "composer #{composerCommand} --here --is --a --flag"
    )

  it 'should set php arguments correctly', ->
    composerCommand = 'install'
    config =
      usePhp: true,
      phpArgs:
        someArg: "someValue"

    @runner = new @ComposerRunner(config, composerCommand)

    expect(@runner.getExecCommand()).toBe(
      "php -DsomeArg=someValue composer install"
    )

  it 'should call childNode.exec with the correct arguments', ->
    composerCommand = 'someCommand'

