{ WorkspaceView } = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "CoffeeRefactor", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage 'coffee-refactor'

  describe "when the test:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.coffee-refactor')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'coffee-refactor:rename'

      waitsForPromise ->
        activationPromise

      runs ->
        # expect(atom.workspaceView.find('.coffee-refactor')).toExist()
        # atom.workspaceView.trigger 'test:toggle'
        # expect(atom.workspaceView.find('.coffee-refactor')).not.toExist()
