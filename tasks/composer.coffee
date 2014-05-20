###
composer
@usage:
    grunt compass:install
###

module.exports = (grunt) ->
  exec = require('child_process').exec

  execCmd = (cmd, cb, execOpts) ->
    grunt.verbose.writeln 'Exec: ' + cmd
    exec cmd, execOpts, (error, stdout, stderr) ->
      grunt.verbose.writeln stdout
      if(stderr)
        grunt.fatal stderr
      cb(error)

  desc = 'Wrapper for Composer commands'
  grunt.registerTask 'composer', desc, (cmd, args...) ->
    options = this.options()
    execOpts = {}
    if options.cwd
      execOpts.cwd = options.cwd
    if options.maxBuffer
      execOpts.maxBuffer = options.maxBuffer

    done = this.async()
    cmd += ' --' + arg for arg in args
    execCmd 'composer ' + cmd, done, execOpts
