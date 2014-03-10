class ComposerRunner
  constructor: (@config, @command, @flags) ->

  getExecCommand: ->
    if @config.composerLocation
      composerLocation = @config.composerLocation
    else
      composerLocation = 'composer';
    if @config.usePhp
      return "php #{composerLocation} " + @command + this.getFlags()
    "#{composerLocation} " + @command + this.getFlags()

  getFlags: ->
    if @flags
      @compressedFlags = "";
      for flag in @flags
        @compressedFlags += ' --' + flag
    else
      return ""
    return @compressedFlags.toString()


module.exports = ComposerRunner