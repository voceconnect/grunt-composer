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
                    'specs/commandBuilderSpec.js' : 'test/commandBuilderSpec.coffee',
                    'specs/commandBuilder.js': 'tasks/lib/commandBuilder.coffee'
                }
            }
        },
        jasmine_node: {
            projectRoot: "."
        },
        watch : {
            files: [
                '**/**/*.coffee'
            ],
            tasks: ['coffee', 'jasmine_node', 'coffeelint']
        },
        composer : {
            options : {
                usePhp: true,
                phpArgs: {
                    someArg: 'custom'
                },
                composerLocation: 'customThing'
            }
        }
    });

    grunt.loadTasks('tasks');
    grunt.loadNpmTasks('grunt-coffeelint');
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-jasmine-node');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.registerTask('test', ['coffee', 'jasmine_node', 'coffeelint']);

};