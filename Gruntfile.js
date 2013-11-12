/*
 * grunt-composer
 * https://github.com/voceconnect/grunt-composer
 *
 * Copyright (c) 2013 Michael Pretty
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    jshint: {
      all: [
        'Gruntfile.js',
        'tasks/*.js'
      ]
    },
    coffeelint: {
      app: ['tasks/*.coffee']
    }
  });

  grunt.loadTasks('tasks');

  grunt.loadNpmTasks('grunt-coffeelint');

  grunt.registerTask('default', ['coffeelint']);

};