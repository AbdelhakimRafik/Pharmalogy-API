###
 *	
 *  Main app process
###

electron 		= require 'electron'
pug 			= require 'electron-pug'
path 			= require 'path'
locals 			= {}
app 			= electron.app
BrowserWindow 	= electron.BrowserWindow

###*
 * Create new window and load index view
 * @return
###
createWindow = ->
	# create new window
	mainWindow = new BrowserWindow
		width: 1500
		height: 1000
		icon: path.join __dirname, 'assets/img/logo-fav.png'
		webPreferences:
			nodeIntegration: true

	# set window view
	mainWindow.loadFile path.join __dirname, 'resources/views/index.pug'
	return

###*
 * Call when app is ready and mount the default view
 * @return
###
app.on 'ready', ->
	try
		await pug pretty:true, locals
	catch e
		console.error 'Pug Compilation ERROR >>', e

	# create new window
	do createWindow
	return
	
###*
 * Call when all windows are closed
 * @return
###
app.on 'window-all-closed', ->
	unless process.platform is 'darwin'
		app.quit()
	return

app.on 'activate', ->
	if BrowserWindow.getAllWindows().length == 0
		do createWindow
	return