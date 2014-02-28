"use strict"

module.exports = ( grunt ) ->

    require( "matchdep" ).filterDev( "grunt-*" ).forEach grunt.loadNpmTasks

    grunt.initConfig
        coffee:
            options:
                bare: yes
            tasks:
                files:
                    "tasks/grunt-supervisor.js": "tasks/grunt-supervisor.coffee"
        jshint:
          options:
            jshintrc: ".jshintrc"
          tasks:
            src: [
                "tasks/**/*.js"
            ]
        watch:
          tasks:
            files: "<%= jshint.tasks.src %>"
            tasks: [
                "coffee"
                "jshint"
            ]

    grunt.registerTask "default", [
        "coffee"
        "jshint"
    ]
