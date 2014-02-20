module.exports = function(grunt)
{
  grunt.registerTask('composer', 'Composer wrapper.', function(cmd)
  {
    var done    = this.async();
    var spawn   = require('child_process').spawn;
    var which   = require('which');
    var options = this.options({
      cwd: '.'
    });

    which('composer', function(e, p)
    {
      var proc = spawn(p, [cmd || 'install'], {cwd: options.cwd});

      proc.stdout.on('data', grunt.log.write);
      proc.stderr.on('data', grunt.log.error);

      proc.on('close', function(r)
      {
        grunt.log.write('Finished with code: ' + r);
        done(true);
      });
    });
  });
}