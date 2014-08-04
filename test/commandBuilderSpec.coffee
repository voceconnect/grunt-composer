describe 'Composer Command Builder Module', ->

  beforeEach ->
    @commandBuilder = require('../tasks/lib/commandBuilder')
    @commandBuilder.reset()

  it 'should return correct command', ->
    composerCommand = 'update'
    config = {}

    builtCommand = @commandBuilder
    .withConfig(config)
    .withCommand(composerCommand)
    .build()

    expect(builtCommand).toBe(
      "composer #{composerCommand}"
    )

  it 'should run composer with php when usePhp is passed in config', ->
    config = usePhp: true
    composerCommand = 'update'

    builtCommand = @commandBuilder
    .withConfig(config)
    .withCommand(composerCommand)
    .build()

    expect(builtCommand).toBe(
      "php composer #{composerCommand}"
    )

  it 'should run composer from the specified file in config', ->
    composerLocation = '/heres/some/phar'
    config = composerLocation: composerLocation
    composerCommand = 'update'

    builtCommand = @commandBuilder
    .withConfig(config)
    .withCommand(composerCommand)
    .build()

    expect(builtCommand).toBe(
      "#{composerLocation} #{composerCommand}"
    )

  it 'should prefix with php when composerLocation' +
      'set in config and usePHP enabled', ->
        composerLocation = '/heres/some/phar'
        composerCommand = 'update'
        config =
          composerLocation: composerLocation
          usePhp: true

        builtCommand = @commandBuilder
        .withConfig(config)
        .withCommand(composerCommand)
        .build()

        expect(builtCommand).toBe(
          "php #{composerLocation} #{composerCommand}"
        )

  it 'should ammend the correct flags to composer command', ->
    composerCommand = 'update'
    composerFlags = ['here', 'is', 'a', 'flag']
    config = {}

    builtCommand = @commandBuilder
    .withConfig(config)
    .withCommand(composerCommand)
    .withFlags(composerFlags)
    .build()

    expect(builtCommand).toBe(
      "composer #{composerCommand} --here --is --a --flag"
    )

  it 'should set php arguments correctly', ->
    composerCommand = 'install'
    config =
      usePhp: true,
      phpArgs:
        someArg: "someValue"

    builtCommand = @commandBuilder
    .withConfig(config)
    .withCommand(composerCommand)
    .build()

    expect(builtCommand).toBe(
      "php -dsomeArg=someValue composer install"
    )
    
  it 'should set composer arguments correctly', ->
    composerCommand = 'install'
    config =
      usePhp: true,
      flags: ['no-dev', 'optimize-autoloader']

    builtCommand = @commandBuilder
    .withConfig(config)
    .withCommand(composerCommand)
    .build()

    expect(builtCommand).toBe(
      "php composer install --no-dev --optimize-autoloader"
    )
