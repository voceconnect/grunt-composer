exports.build = ->
  if @config.composerLocation
    composerLocation = @config.composerLocation
  else
    composerLocation = 'composer';
  if @config.usePhp
    return "php#{this.getPhpOptions()} #{composerLocation} " + @command + this.getFlags()
  "#{composerLocation} " + @command + this.getFlags()

exports.getFlags = ->
  if @flags
    @compressedFlags = "";
    for flag in @flags
      @compressedFlags += ' --' + flag
    return @compressedFlags
  ""

exports.getPhpOptions = ->
  phpOptions = @config.phpArgs
  if phpOptions
    compressedOptions = "";
    for option, value of phpOptions
      compressedOptions += " -D#{option}=#{value}"
    return compressedOptions
  ""

exports.withConfig = (config) ->
  @config = config
  this

exports.withFlags = (flags) ->
  @flags = flags
  this

exports.withCommand = (command) ->
  @command = command
  this

