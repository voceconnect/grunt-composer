# grunt-composer [![Build Status](https://travis-ci.org/voceconnect/grunt-composer.png?branch=master)](https://travis-ci.org/voceconnect/grunt-composer)

> A Grunt task wrapper for Composer, the PHP dependency manager.

## Getting Started

Installing the plugin:

```shell
npm install grunt-composer --save-dev
```

Loading the plugin via JavaScript:

```js
grunt.loadNpmTasks('grunt-composer');
```

`grunt-composer` is now ready to go!

## Running Composer Commands

### Simple task and multi task modes

`grunt-composer` supports both 'simple' and 'multi' task modes in Grunt.
Multi task mode is activated whenever any configuration under the `composer`
key is found in your Grunt configuration.

This is important, as the way you run the task changes depending on this mode. 

### Simple task mode

The first argument passed to the `grunt-composer` task becomes the command to 
run. Arguments are passed to tasks in Grunt by separating them via a colon, 
`:`.

```shell
grunt composer:update
```

is equivalent to:

```shell
composer update
```

### Multi task mode

When in multi task mode, an additional `target` is required when running the
task.

This example runs the `composer update` command, using configuration for the
`some_target` target.

```shell
grunt composer:some_target:update
```

### Command Options

You can provide arguments to the Composer executable by adding them to the 
task name you run. This pattern works for both simple and multi task modes.

```shell
grunt composer:install:no-dev
```

is equivalent to:

```shell
composer install --no-dev
```

Alternatively, you can provide these options through options in your Grunt
configuration, explained below.

## Options

### Example configuration

```js
grunt.initConfig({
    composer : {
        options : {
            usePhp: true,
            phpArgs: {
                someArg: 'custom'
            },
            flags: ['arg'],
            cwd: 'packages/build',
            composerLocation: '/usr/bin/composer'
        },
        some_target: {
            options : {
                flags: ['arg'],
                cwd: 'packages/build'
            }
        }
    }
})
```

### options.usePhp
Type: `Boolean`
Default value: `false`

This tells the plugin to execute `php #{composerLocation}`

### options.flags
Type: `Array`
Default value: `[]`

This is an array of custom Composer CLI args, such as `no-dev`.  
_Note_: This is bypassed if there are command options.

### options.phpArgs
Type: `Object`
Default value: `{}`

This is an object which you should use to send -D arguments to the php binary.

### options.cwd
Type: `String`
Default value: `'.'`

This is the working directory, normally where the composer.json is located.

### options.composerLocation
Type: `String`
Default value: `'composer'`

The binary to use for Composer if not installed globally.

If `options.cwd` is present, relative paths for `options.composerLocation` 
are relative to that directory.

