# Export Plugin
module.exports = (BasePlugin) ->
	# Requires
	eco = null

	# Define Plugin
	class EcoPlugin extends BasePlugin
		# Plugin name
		name: 'eco'

		# Plugin priority
		priority: 750

		# Render some content
		render: ({inExtension,outExtension,templateData,file}, next) ->
			try
				if inExtension is 'eco'
					eco = require 'eco'  unless eco
					file.content = eco.render file.content, templateData
					next()
				else
					next()
			catch err
				return next(err)
