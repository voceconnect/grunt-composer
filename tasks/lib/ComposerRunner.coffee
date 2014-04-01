class ComposerRunner
  constructor: (@config, @command, @flags) ->

  getExecCommand: ->
    if @config.composerLocation
      composerLocation = @config.composerLocation
    else
      composerLocation = 'composer';
    if @config.usePhp
      return "php#{this.getPhpOptions()} #{composerLocation} " + @command + this.getFlags()
    "#{composerLocation} " + @command + this.getFlags()

  getFlags: ->
    if @flags
      @compressedFlags = "";
      for flag in @flags
        @compressedFlags += ' --' + flag
    else
      return ""
    return @compressedFlags

  getPhpOptions: ->
    phpOptions = @config.phpArgs
    if phpOptions
      compressedOptions = "";
      for option, value of phpOptions
        compressedOptions += " -D#{option}=#{value}"
      return compressedOptions
    ""

module.exports = ComposerRunner