screen_height=globalPropertyi("sim/graphics/view/window_height",false)
screen_width=globalPropertyi("sim/graphics/view/window_width",false)
ro_sett=globalPropertyfa ( "pnv/ro/ro_sett", false )
if get(ro_sett,20)==1 then
	MainFont = sasl.gl.loadFont ( "fonts\\DejaVuSans.ttf" )
	defineProperty("slider_img",  sasl.gl.loadImage("pic\\slider.png"))
	defineProperty("blue_img",  sasl.gl.loadImage("pic\\blue.png"))
else
	MainFont = sasl.gl.loadFont ( "fonts/DejaVuSans.ttf" )
	defineProperty("slider_img",  sasl.gl.loadImage("pic/slider.png"))
	defineProperty("blue_img",  sasl.gl.loadImage("pic/blue.png"))
end
a=0
b=0
current_height=get(screen_height)
current_width=get(screen_width)
openmainwindow = sasl.findCommand("pnv/ro/popup")
set_pos=false
moving=false
mnm=""
timercount=0
timevar=0
StartTimerIDMain = sasl.createTimer ()
sasl.startTimer(StartTimerIDMain)
local xautolod=0

function draw()
	if StartTimerIDMain~=0 then
		if timercount>1 then
			mnm=mnm.."."
			timercount=0
		end
		if mnm=="......" then
			mnm=""
		end
		sasl.gl.drawText ( MainFont , -get(screen_width)+20+a , -get(screen_height)*(get(ro_sett,11)/100)+20 , "Loading Advanced Rendering Options plugin"..mnm, 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , 1 } )
	else
		if get(ro_sett,12)==1 then
			sasl.gl.drawTexture(get(slider_img) , 0 , 0 , 110 , 45, {1 , 1 , 1 , get(ro_sett,9) })
		else
			sasl.gl.drawTexture(get(slider_img) , 10 , 0 , 110 , 45, {1 , 1 , 1 , get(ro_sett,9) })
		end
	end
	
end
function onMouseMove(component, x, y, button, parentX, parentY)
	--set_pos=true
	--moving=true
	return true
end
function onMouseEnter()
	set_pos=true
	moving=true	
	return true
end
function onMouseLeave()
	set_pos = false
	moving=true
	return true
end
function onMouseDown(component, x, y, button, parentX, parentY)
	if button == MB_LEFT then
		sasl.commandOnce(openmainwindow)	
	end
	return true
end
function update()
	if (current_height~=get(screen_height)) or (current_width~=get(screen_width)) then
		slidetab.position = {get(screen_width)-10-a, get(screen_height)*(get(ro_sett,11)/100), 110, 35}
		current_height=get(screen_height)
		current_width=get(screen_width)
	end
	if StartTimerIDMain==0 then
		if set_pos==true and moving==true then
			a=a+10
			slidetab.position = {get(screen_width)-10-a, get(screen_height)*(get(ro_sett,11)/100), 110, 35}
			if a>60 then
				moving=false
				--a=0
			end
		elseif set_pos==false and moving==true then
			a=a-10
			slidetab.position = {get(screen_width)-10-a, get(screen_height)*(get(ro_sett,11)/100), 110, 35}
			if a<10 then
				moving=false
				a=0
			end
		end
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
end