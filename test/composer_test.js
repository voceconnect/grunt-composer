'use strict';

var grunt = require('grunt');

function getNormalizedFile(filepath) {
  return grunt.util.normalizelf(grunt.file.read(filepath));
}

exports.composer = {
	install_test: function(test) {
		test.expect(2);

		var actual = getNormalizedFile('test/tmp/voce/grunt-composer-test/composer.json');
		var expected = getNormalizedFile('test/expected/composer.json');
		test.equal(actual, expected, 'should have created file');

		var actual = getNormalizedFile('test/tmp/voce/grunt-composer-test/foo.php');
		var expected = getNormalizedFile('test/expected/foo.php');
		test.equal(actual, expected, 'should have created file');

		test.done();
	}
}