-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local storyboard = require "storyboard"
require("src.Constants")
storyboard.gotoScene( "PushScene" )
local function onNotification( event )
    if event.type == "remoteRegistration" then
      Constants.DeviceToken = event.token
    elseif event.type == "remote" then
      native.showAlert( "Receieved Notification", event.alert, { "OK" } )
    end
end
 
Runtime:addEventListener( "notification", onNotification )