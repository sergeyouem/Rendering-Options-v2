screen_height=globalPropertyi("sim/graphics/view/window_height",false)
screen_width=globalPropertyi("sim/graphics/view/window_width",false)
ro_sett=globalPropertyfa ( "pnv/ro/ro_sett", false )
if get(ro_sett,20)==1 then
	MainFont = sasl.gl.loadFont ( "fonts\\DejaVuSans.ttf" )
	defineProperty("blue_img",  sasl.gl.loadImage("pic\\blue.png"))
else
	MainFont = sasl.gl.loadFont ( "fonts/DejaVuSans.ttf" )
	defineProperty("blue_img",  sasl.gl.loadImage("pic/blue.png"))
end

a=0
b=0
current_height=get(screen_height)
current_width=get(screen_width)
openmainwindow = sasl.findCommand("pnv/ro/popup")
LOD_xp_framerate=globalPropertyf("sim/operation/misc/frame_rate_period") 
local aa=0

timercount=0
timevar=0
StartTimerIDMain = sasl.createTimer ()
sasl.startTimer(StartTimerIDMain)
local xautolod=0

function draw()
	if StartTimerIDMain~=0 then
		if timercount>1 then
			
		end
	else
		if get(ro_sett,13)==1 then
			sasl.gl.drawTexture(get(blue_img) , 0 , 0 , 110 , 45, {1 , 1 , 1 , get(ro_sett,9) })
			autolodtab.position = {get(screen_width)-100, get(screen_height)*(get(ro_sett,11)/100)+45, 110, 35}
			if a>2 then 
				aa=string.format("%2.0f", 1/get(LOD_xp_framerate))
			end
			sasl.gl.drawText ( MainFont , 25 , 26 , "FPS:"..aa, 14 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 5 , 5 , "Autolod", 10 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if get(ro_sett,3)==1 then
				sasl.gl.drawText ( MainFont , 50 , 5 , "Enabled", 10 , false , false , TEXT_ALIGN_LEFT , {0 , 1 , 0 , get(ro_sett,9) } )
			else
				sasl.gl.drawText ( MainFont , 50 , 5 , "Disabled", 10  , false , false , TEXT_ALIGN_LEFT , {1 , 0 , 0 , get(ro_sett,9) } )
			end
		else
			autolodtab.position = {get(screen_width), get(screen_height)*(get(ro_sett,11)/100)+45, 110, 35}
			sasl.gl.drawTexture(get(blue_img) , 0 , 0 , 110 , 45, {1 , 1 , 1 , get(ro_sett,9) })
		end
	end
	
end

function onMouseDown(component, x, y, button, parentX, parentY)
	if button == MB_LEFT then
		if get(ro_sett,3)==0 then
			set(ro_sett,1,3)
			
		else 
			set(ro_sett,0,3)
		
		end
		
	
	end
	return true
end
function update()
	if (current_height~=get(screen_height)) or (current_width~=get(screen_width)) then
		autolodtab.position = {get(screen_width)-10, get(screen_height)*(get(ro_sett,11)/100)+45, 110, 35}
		current_height=get(screen_height)
		current_width=get(screen_width)
	end
	if StartTimerIDMain ~= 0 then
		timevar = sasl.getElapsedSeconds(StartTimerIDMain)
		timercount=timercount+0.1
	end
	if timevar>5 then					------LOADING TIMER
		sasl.stopTimer(StartTimerIDMain)
		sasl.deleteTimer(StartTimerIDMain)
		StartTimerIDMain=0
		timevar=0
	end
	if a<2.1 then
		a=a+0.1
	else
		a=0
	end
end