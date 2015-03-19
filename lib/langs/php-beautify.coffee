###
Requires https://github.com/FriendsOfPHP/PHP-CS-Fixer
###
getCmd = (inputPath, outputPath, options) ->
  phpCsFixerPath = options.beautifier_path # jshint ignore: line
  fixers = options.fixers
  level = options.level # jshint ignore: line

  levelOption = ""
  fixerOption = ""

  if level
    levelOption = " --level=#{level} "
  if fixers
    fixerOption = " --fixers=#{fixers}"

  cmd = "#{levelOption} #{fixerOption} \"#{inputPath}\") || (mv \"#{inputPath}\" \"#{outputPath}\")"

  if phpCsFixerPath
    # Use absolute path
    "(php \"#{phpCsFixerPath}\" fix #{cmd}"
  else
    # Use command available in $PATH
    "(php-cs-fixer fix #{cmd}"

"use strict"
cliBeautify = require("./cli-beautify")
module.exports = cliBeautify(getCmd)
