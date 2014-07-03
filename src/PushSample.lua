local PushSample = {}
require("src.Constants")
require("App42-Lua-API.DeviceType")
local App42API = require("App42-Lua-API.App42API")
local App42Log = require("App42-Lua-API.App42Log")
App42Log:setDebug(true)
function PushSample:registerForPush()
  local App42CallBack = {}
  App42API:initialize(Constants.apiKey,Constants.secretKey)
  local pushNotificationService  = App42API:buildPushNotificationService()
  pushNotificationService:storeDeviceToken(Constants.UserId,Constants.DeviceToken,DeviceType.ANDROID,App42CallBack);
  function App42CallBack:onSuccess(object)
      native.showAlert( "Success", "Your device is subscribe for push messages.", { "OK" } )
  end  
  function App42CallBack:onException(object) 
      native.showAlert( "Error", object:getDetails(), { "OK" } )
  end
end

function PushSample:removeDeviceFromPush()
  local App42CallBack = {}
  App42API:initialize(Constants.apiKey,Constants.secretKey)
  local pushNotificationService  = App42API:buildPushNotificationService()
  pushNotificationService:deleteDeviceToken(Constants.UserId,Constants.DeviceToken,App42CallBack);
  function App42CallBack:onSuccess(object)
      native.showAlert( "Success", "Your device is unsubscribe for push.", { "OK" } )
  end  
  function App42CallBack:onException(object) 
      native.showAlert( "Error", object:getDetails(), { "OK" } )
  end
end

function PushSample:sendMessageToUser()
  local App42CallBack = {}
  App42API:initialize(Constants.apiKey,Constants.secretKey)
  local pushNotificationService  = App42API:buildPushNotificationService()
  pushNotificationService:sendPushMessageToUser(Constants.UserId,Constants.Message,App42CallBack);
  function App42CallBack:onSuccess(object)
      native.showAlert( "Success", "Your message has been successfully send.", { "OK" } )
  end  
  function App42CallBack:onException(object) 
      native.showAlert( "Error", object:getDetails(), { "OK" } )
  end
end
return PushSample