'use strict';

var grunt = require('grunt');

function getNormalizedFile(filepath) {
  return grunt.util.normalizelf(grunt.file.read(filepath));
}

exports.composer = {
	install_test: function(test) {
		test.expect(2);

		test.ok(grunt.file.exists('test/tmp/voce/grunt-composer-test/composer.json'), 'should have created composer.json file');
		test.ok(grunt.file.exists('test/tmp/voce/grunt-composer-test/foo.php'), 'should have created foo.php file');
		test.done();
	}
}