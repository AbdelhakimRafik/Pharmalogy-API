###
 * @author 		Abdelhakim RAFIK
 * @version 	v1.0.1
 * @license 	MIT License
 * @copyright 	Copyright (c) 2021 Abdelhakim RAFIK
 * @date 		Jan 2021
###

electron 		= require 'electron'
pug 			= require 'electron-pug'
path 			= require 'path'
auth 			= require './utils/auth'
db 				= require './db/db'
locals 			= {}
app 			= electron.app
BrowserWindow 	= electron.BrowserWindow

###*
 * Create new window and load index view
 * @return
###
createWindow = (page)->
	# create new window
	mainWindow = new BrowserWindow
		width: 1500
		height: 1000
		icon: path.join __dirname, 'assets/img/logo-fav.png'
		webPreferences:
			nodeIntegration: true

	# set window view
	mainWindow.loadFile path.join __dirname, 'resources/views/', page
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

	# check if user already logged in
	if auth.isAuthenticated()
		page = 'index.pug'
	else
		page = 'auth/login.pug'
	# create new window
	createWindow page
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