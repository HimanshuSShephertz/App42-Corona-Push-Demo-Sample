local storyboard = require( "storyboard" )
local widget = require("widget")
local pushSample = require("src.PushSample")
local unsubscribeButton,subscribeButton,messageButton
local pushScene = storyboard.newScene()
function pushScene:createScene( event )
	local screenGroup = self.view	
end
function pushScene:enterScene( event )
	local screenGroup = self.view
  local image = display.newImage( "images/background.png" )
	screenGroup:insert( image )

  local headerTitle = display.newText("App42 Push Demo",0,0,native.systemFontBold,32)
	headerTitle.x, headerTitle.y = display.contentWidth * 0.5, 25
	screenGroup:insert( headerTitle )
	unsubscribeButton =  widget.newButton
  {
   
    defaultFile = "images/unsubscribe_device.png",
			labelColor = 
			{ 
				default = { 255, 255, 255 }, 
			},
			onRelease = function(event) 
      if "ended" == event.phase then
        pushSample:removeDeviceFromPush()
      end
    end
    }
		unsubscribeButton.x = 160
		unsubscribeButton.y = 300
    
  subscribeButton =  widget.newButton
  {
    
    defaultFile = "images/subscribe_device.png",
			labelColor = 
			{ 
				default = { 255, 255, 255 }, 
			},
			onRelease = function(event) 
      if "ended" == event.phase then
        pushSample:registerForPush()
      end
    end
    }
		subscribeButton.x = 160
		subscribeButton.y = 200
    
  messageSendButton =  widget.newButton
  {
    defaultFile = "images/send_message.png",
			labelColor = 
			{ 
				default = { 255, 255, 255 }, 
			},
			onRelease = function(event) 
      if "ended" == event.phase then
        pushSample:sendMessageToUser()
      end
    end
    }
		messageSendButton.x = 160
		messageSendButton.y = 400
  
end
function pushScene:exitScene( event )
	local screenGroup = self.view
end
function pushScene:destroyScene( event )
	local screenGroup = self.view
end
pushScene:addEventListener( "createScene", pushScene )
pushScene:addEventListener( "enterScene", pushScene )
pushScene:addEventListener( "exitScene", pushScene )
pushScene:addEventListener( "destroyScene", pushScene )
return pushScene