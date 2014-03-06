/*
 * grunt-composer
 * https://github.com/voceconnect/grunt-composer
 *
 * Copyright (c) 2013 Michael Pretty
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function (grunt) {

    // Project configuration.
    grunt.initConfig({
        coffeelint: {
            app: [
                'tasks/*.coffee',
                'test/*.coffee'
            ]
        },
        coffee: {
            tests: {
                files: {
                    'specs/composerSpec.js' : 'test/composerSpec.coffee',
                    'specs/composerRunnerSpec.js' : 'test/composerRunnerSpec.coffee'
                }
            }
        },
        jasmine_node: {
            projectRoot: ".",
            requirejs: false,
            forceExit: true,
            jUnit: {
                report: false,
                savePath : "./build/reports/jasmine/",
                useDotNotation: true,
                consolidate: true
            }
        }
    });

    grunt.loadTasks('tasks');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-jasmine-node');
    grunt.registerTask('test', ['coffee', 'jasmine_node', 'coffeelint']);

};