
var gulp 	= require('gulp'),
	coffee 	= require('gulp-coffeescript'),
	sass 	= require('gulp-sass'),
	del 	= require('del');


function coffeeTask(cb) {
	gulp.src('./src/**/*.coffee')
		.pipe(coffee({bare: true}))
		.pipe(gulp.dest('./build/'));
	cb();
}

function sassTask(cb) {
	gulp.src('./src/assets/sass/**/!(_)*.sass')
		.pipe(sass().on('error', sass.logError))
		.pipe(gulp.dest('./build/assets/css/'));
	cb();
}

function pugTask(cb) {
	gulp.src('./src/resources/views/**/*.pug')
		.pipe(gulp.dest('./build/resources/views/'));
	cb();
}

function mediaTask(cb) {
	gulp.src('./src/assets/img/**/*.{png, jpeg, jpg}')
		.pipe(gulp.dest('./build/assets/img/'));
	cb();
}

function vendorsTask(cb) {
	gulp.src('./src/assets/vendors/**/*')
		.pipe(gulp.dest('./build/assets/vendors'));
	cb();
}

function clean(cb) {
	(async function() {
		await del(['./build']);
	})();

	cb();
}

function watch() {
	gulp.watch('./src/**/*.coffee', coffeeTask);
	gulp.watch('./src/assets/sass/**/*.sass', sassTask);
	gulp.watch('./src/resources/views/**/*.pug', pugTask);
	gulp.watch('./src/assets/img/**/*.{png, jpeg, jpg}', mediaTask);
	gulp.watch('./src/assets/vendors/**/*', vendorsTask);
}

var build = gulp.parallel(coffeeTask, sassTask, pugTask, mediaTask, vendorsTask);

exports.default = gulp.series(build, watch);
exports.clean = clean;