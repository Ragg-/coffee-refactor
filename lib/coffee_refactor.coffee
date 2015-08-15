Ripper = require './ripper'
{ packages: packageManager } = atom


module.exports =

    configDefaults:
        'disable in large files (chars)': 20000

    activate: ->
        atom.workspace.emit 'coffee-refactor-became-active'
        return if 'refactor' in packageManager.getAvailablePackageNames() and
            !packageManager.isPackageDisabled 'refactor'

        atom.notifications.addWarning "Requires related package installation",
            detail: """
            'coffee-refactor' package requires 'refactor' package.
            You can install and activate packages using the preference pane.
            """
    deactivate: ->
    serialize: ->
    Ripper: Ripper
