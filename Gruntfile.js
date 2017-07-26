module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        "uglify": {
            options: {
                banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            build: {
                src: './js/src/*.js',
                dest: './js/dist/bfa.min.js'
            }
        },
        "sass": {
            dist: {
                options: {
                    style: 'expanded'
                },
                files: {
                    './scss/dist/main.css': './scss/src/main.scss',
                    './scss/dist/products.view.css': './scss/src/products.view.scss'
                }
            }
        },
        cssmin: {
            options: {
                mergeIntoShorthands: false,
                roundingPrecision: -1
            },
            target: {
                files: {
                    './css/bfa.min.css': ['./scss/dist/*.css']
                }
            }
        },
        watch: {
            js: {
                files: ['./js/src/*.js'],
                tasks: ['uglify'],
                options: {
                    spawn: false,
                },
            },
            scss: {
                files: ['./scss/src/*.scss'],
                tasks: ['sass', 'cssmin'],
                options: {
                    spawn: false,
                },
            },
        }
    });

    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-sass');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-watch');

    grunt.registerTask('default', ['watch']);

};
