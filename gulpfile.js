
var gulp 	= require('gulp'),
	coffee 	= require('gulp-coffeescript'),
	sass 	= require('gulp-sass');


function coffeeTask(cb) {
	gulp.src('./src/**/*.coffee')
		.pipe(coffee({bare: true}))
		.pipe(gulp.dest('./build/'));
	cb();
}

function sassTask(cb) {
	gulp.src('./src/public/sass/**/*.sass')
		.pipe(sass().on('error', sass.logError))
		.pipe(gulp.dest('./build/public/css/'));
	cb();
}

function pug(cb) {
	gulp.src('./src/resources/views/**/*.pug')
		.pipe(gulp.dest('./build/resources/views/'));
	cb();
}

function watch() {
	gulp.watch('./src/**/*.coffee', coffeeTask);
	gulp.watch('./src/public/sass/**/*.sass', sassTask);
}

var build = gulp.parallel(coffeeTask, sassTask, pug);

exports.default = gulp.series(build, watch);