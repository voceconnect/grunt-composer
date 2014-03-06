class ComposerRunner
  constructor: (@config, @command) ->

  getExecCommand: ->
    if @config.usePhp
      return 'php composer ' + @command

    'composer ' + @command

module.exports = ComposerRunner