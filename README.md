# grunt-supervisor

> Run [supervisor](https://github.com/isaacs/node-supervisor) as a grunt task for easy configuration and integration with the rest of your workflow.

*This Grunt task is freely inspired from the [grunt-nodemon](https://github.com/ChrisWren/grunt-nodemon) by [Chris Wen](https://github.com/ChrisWren).*

## Getting Started
If you haven't used grunt before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a gruntfile as well as install and use grunt plugins. Once you're familiar with that process, install this plugin with this command:
```shell
npm install grunt-supervisor --save-dev
```

Then add this line to your project's `Gruntfile.js` gruntfile:

```javascript
grunt.loadNpmTasks( "grunt-supervisor" );
```

## The "todo" task

In your project's Gruntfile, add a section named `supervisor` to the data object passed into `grunt.initConfig()`.

### Minimal usage

The minimal usage of **grunt-supervisor** runs with a `script` specified:

```js
supervisor: {
  target: {
    script: "index.js"
  }
}
```

### Usage with all available options

```js
supervisor: {
  target: {
    script: "index.js",
    options: {
      args: [ "dev" ]
      watch: [ "bin" ],
      ignore: [ "test" ],
      pollInterval: 500,
      extensions: [ "js,jade" ],
      exec: "node",
      debug: true,
      debugBrk: true,
      harmony: true
      noRestartOn: "exit",
      forceWatch: true,
      quiet: true
    }
  }
}
```

#### Required property

##### script
Type: `String`

Script that supervisor runs and restarts when changes are detected.

#### Options

The following options corresponds to the available options from [supervisor](https://github.com/isaacs/node-supervisor). If you don't pass these options to the grunt tasks, the default values of supervisor will be used. 

##### args
Type: `Array` of `Strings`  
List of arguments to be passed to your script.

##### watch
Type: `Array` of `Strings`  
List of folders or js files to watch for changes.  

##### ignore
Type: `Array` of `Strings`  
List of folders to ignore for changes.  

##### pollInterval
Type: `Number` of **milliseconds**  
How often to poll watched files for changes.

##### extensions
Type: `Array` of `Strings`  
List of file extensions to watch for changes.

##### exec
Type: `String`  
The executable that runs the specified script.

##### debug
Type: `Boolean`  
Starts node with `--debug` flag.

##### debugBrk
Type: `Boolean`  
Starts node with `--debug-brk` flag.

##### harmony
Type: `Boolean`  
Starts node with `--harmony` flag.

##### noRestartOn
Type: `String`, `"error"` or `"exit"`  
Don't automatically restart the supervised program if it ends.  
Supervisor will wait for a change in the source files.  
If "error", an exit code of 0 will still restart.  
If "exit", no restart regardless of exit code.

##### forceWatch
Type: `Boolean`  
Use fs.watch instead of fs.watchFile.  
This may be useful if you see a high cpu load on a windows machine.

##### quiet
Type: `Boolean`  
Suppress DEBUG messages

## Contributing
In lieu of a formal styleguide, take care to maintain the existing coding style. Add unit tests for any new or changed functionality. Lint and test your code using [Grunt](http://gruntjs.com/).

## Release History

* **2014/02/28**: Starting project

## License
Copyright (c) 2014 Leny  
Licensed under the MIT license.
