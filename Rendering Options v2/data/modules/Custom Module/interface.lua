size = { 800, 480 }
ro_sett=globalPropertyfa ( "pnv/ro/ro_sett", false )
defineProperty("background_img",  sasl.gl.loadImage("pic/main.png"))
defineProperty("mousepointer",  sasl.gl.loadImage("pic/cursors.png"))
defineProperty("on_pic",  sasl.gl.loadImage("pic/onbutton.png"))
defineProperty("off_pic",  sasl.gl.loadImage("pic/offbutton.png"))
defineProperty("mid_pic",  sasl.gl.loadImage("pic/midbutton.png"))
defineProperty("blue_pic",  sasl.gl.loadImage("pic/blue.png"))
defineProperty("gray_pic",  sasl.gl.loadImage("pic/gray.png"))
defineProperty("gray_sq_pic",  sasl.gl.loadImage("pic/gray_sq.png"))
defineProperty("blue_sq_pic",  sasl.gl.loadImage("pic/blue_sq.png"))
MainFont = sasl.gl.loadFont ( "fonts/DejaVuSans.ttf" )
MainFont2 = sasl.gl.loadFont ( "fonts/DejaVuSans-Bold.ttf" )

selected_tab = globalPropertyi("pnv/ro/selected_tab",false)
ro_refs_values=globalPropertyfa ( "pnv/ro/ro_refs_values", false )
openmainwindow = sasl.findCommand("pnv/ro/popup")
sizetext=20
sizetext2=16
lengthtext = 0
sizetextset=false
page_cloud=1
mnm=""
timercount=0
StartTimerID = sasl.createTimer ()
sasl.startTimer(StartTimerID)
langfile_sett = {"","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""}
local line
local scrollwheel=1
local val_to_save={}
local visib_blue={0,0,0,0,0,0,0,0,0,0,0,0}
need_reload=globalPropertyia ( "pnv/ro/need_reload", false )
function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end
local ii=1

function readrefs()
--env_active=globalPropertyi("env/active")
--rwy_follow_terrain_ref=globalPropertyi("sim/private/controls/reno/sloped_runways")
--set(rwy_follow_terrain_ref,0)
draw_deer_birds_ref=globalPropertyi("sim/private/controls/reno/draw_deer_birds")
draw_fire_ball_ref=globalPropertyi("sim/private/controls/reno/draw_fire_ball")
draw_boats_ref=globalPropertyi("sim/private/controls/reno/draw_boats")
draw_aurora_ref=globalPropertyi("sim/private/controls/reno/draw_aurora") ---------ENVIRO
draw_scattering_ref=globalPropertyi("sim/private/controls/reno/draw_scattering")
draw_volume_fog01_ref=globalPropertyi("sim/private/controls/reno/draw_volume_fog01")
draw_per_pix_liting_ref=globalPropertyi("sim/private/controls/reno/draw_per_pix_liting")
static_plane_build_vis=globalPropertyf("sim/private/controls/park/static_plane_build_dis")
static_plane_density=globalPropertyf("sim/private/controls/park/static_plane_density")
---water and reflection
use_reflective_water=globalPropertyf("sim/private/controls/caps/use_reflective_water")
draw_fft_water=globalPropertyi("sim/private/controls/reno/draw_fft_water")
draw_reflect_water05=globalPropertyi("sim/private/controls/reno/draw_reflect_water05")
--use_3dwater_ref=globalPropertyf("sim/private/controls/caps/use_3dwater")
fft_amp1_ref=globalProperty("sim/private/controls/water/fft_amp1")
fft_amp2_ref=globalProperty("sim/private/controls/water/fft_amp2")
fft_amp3_ref=globalProperty("sim/private/controls/water/fft_amp3")
fft_amp4_ref=globalProperty("sim/private/controls/water/fft_amp4")
fft_scale1_ref=globalPropertyf("sim/private/controls/water/fft_scale1")
fft_scale2_ref=globalPropertyf("sim/private/controls/water/fft_scale2")
fft_scale3_ref=globalPropertyf("sim/private/controls/water/fft_scale3")
fft_scale4_ref=globalPropertyf("sim/private/controls/water/fft_scale4")
noise_speed_ref=globalPropertyf("sim/private/controls/water/noise_speed")
noise_bias_gen_x_ref=globalPropertyf("sim/private/controls/water/noise_bias_gen_x")
noise_bias_gen_y_ref=globalPropertyf("sim/private/controls/water/noise_bias_gen_y")
---SHADOWS
csm_split_exterior=globalPropertyf("sim/private/controls/shadow/csm_split_exterior")
csm_split_interior=globalPropertyf("sim/private/controls/shadow/csm_split_interior")
far_limit=globalPropertyf("sim/private/controls/shadow/csm/far_limit")
scenery_shadows=globalPropertyf("sim/private/controls/shadow/scenery_shadows")
shadow_cam_size=globalPropertyf("sim/private/controls/fbo/shadow_cam_size")
shadow_size=globalPropertyf("sim/private/controls/clouds/shadow_size")
cockpit_near_adjust=globalPropertyf("sim/private/controls/shadow/cockpit_near_adjust")
cockpit_near_proxy=globalPropertyf("sim/private/controls/shadow/cockpit_near_proxy")
disable_shadow_prep=globalPropertyf("sim/private/controls/perf/disable_shadow_prep")
last_3d_pass=globalPropertyf("sim/private/controls/shadow/last_3d_pass")  ------------------------------------------------------------------------------------------------
----NUMBER OF OBJECTS
draw_objs_06_ref=globalPropertyi("sim/private/controls/reno/draw_objs_06")--
draw_cars_05_ref=globalPropertyi("sim/private/controls/reno/draw_cars_05")--
draw_vecs_03_ref=globalPropertyi("sim/private/controls/reno/draw_vecs_03")--
draw_for_05_ref=globalPropertyi("sim/private/controls/reno/draw_for_05")--
inn_ring_density_ref=globalPropertyf("sim/private/controls/forest/inn_ring_density")--
mid_ring_density_ref=globalPropertyf("sim/private/controls/forest/mid_ring_density")--
out_ring_density_ref=globalPropertyf("sim/private/controls/forest/out_ring_density")--
draw_detail_apt_03_ref=globalPropertyi("sim/private/controls/reno/draw_detail_apt_03")
extended_dsfs_ref=globalPropertyf("sim/private/controls/geoid/extended_dsfs")
---TEXTURE QUALITY
draw_HDR_ref=globalPropertyi("sim/private/controls/reno/draw_HDR")
comp_texes_ref=globalPropertyi("sim/private/controls/reno/comp_texes")				--to apply
use_bump_maps_ref=globalPropertyi("sim/private/controls/reno/use_bump_maps")				--0/1
use_detail_textures_ref=globalPropertyi("sim/private/controls/reno/use_detail_textures")		
ssao_enable_ref=globalPropertyf("sim/private/controls/ssao/enable")  
---CLOUDS AND Atmo
first_res_3d_ref=globalPropertyf("sim/private/controls/clouds/first_res_3d") --1
last_res_3d_ref=globalPropertyf("sim/private/controls/clouds/last_res_3d") --1
cloud_shadow_lighten_ratio_ref=globalPropertyf("sim/private/controls/clouds/cloud_shadow_lighten_ratio")  --0.1
plot_radius_ref=globalPropertyf("sim/private/controls/clouds/plot_radius") --0.1
overdraw_control_ref=globalPropertyf("sim/private/controls/clouds/overdraw_control")  --0.01
ambient_gain_ref=globalPropertyf("sim/private/controls/clouds/ambient_gain")  --0.01
diffuse_gain_ref=globalPropertyf("sim/private/controls/clouds/diffuse_gain")--0.01
white_point_ref=globalPropertyf("sim/private/controls/hdr/white_point") 	--0.1
atmo_scale_raleigh_ref=globalPropertyf("sim/private/controls/atmo/atmo_scale_raleigh")---------ENVIRO --0.1
inscatter_gain_raleigh_ref=globalPropertyf("sim/private/controls/atmo/inscatter_gain_raleigh")---------ENVIRO --0.1
max_shadow_angle_ref=globalPropertyf("sim/private/controls/skyc/max_shadow_angle")  --1     -180+180
min_shadow_angle_ref=globalPropertyf("sim/private/controls/skyc/min_shadow_angle") --1      -180+180
max_dsf_vis_ever_ref=globalPropertyf("sim/private/controls/skyc/max_dsf_vis_ever") --100
dsf_fade_ratio_ref=globalPropertyf("sim/private/controls/skyc/dsf_fade_ratio") --0.01   0 - 1
dsf_cutover_scale_ref=globalPropertyf("sim/private/controls/skyc/dsf_cutover_scale") --0.1   0 - 2
min_tone_angle_ref=globalPropertyf("sim/private/controls/skyc/min_tone_angle")---------ENVIRO --1      -100+100
max_tone_angle_ref=globalPropertyf("sim/private/controls/skyc/max_tone_angle")---------ENVIRO --1      -100+100
tone_ratio_clean_ref=globalPropertyf("sim/private/controls/skyc/tone_ratio_clean")---------ENVIRO --0.1      -50+50
tone_ratio_foggy_ref=globalPropertyf("sim/private/controls/skyc/tone_ratio_foggy")---------ENVIRO --0.1      -50+50
tone_ratio_hazy_ref=globalPropertyf("sim/private/controls/skyc/tone_ratio_hazy")---------ENVIRO --0.1      -50+50
tone_ratio_snowy_ref=globalPropertyf("sim/private/controls/skyc/tone_ratio_snowy")---------ENVIRO --0.1      -50+50
tone_ratio_ocast_ref=globalPropertyf("sim/private/controls/skyc/tone_ratio_ocast")---------ENVIRO --0.1      -50+50
tone_ratio_strat_ref=globalPropertyf("sim/private/controls/skyc/tone_ratio_strat")---------ENVIRO --0.1      -50+50
tone_ratio_hialt_ref=globalPropertyf("sim/private/controls/skyc/tone_ratio_hialt")---------ENVIRO --0.1      -50+50
inscatter_gain_mie=globalPropertyf("sim/private/controls/atmo/inscatter_gain_mie")--1.0 
scatter_raleigh_r=globalPropertyf("sim/private/controls/atmo/scatter_raleigh_r")--5.00 )
scatter_raleigh_g=globalPropertyf("sim/private/controls/atmo/scatter_raleigh_g")--20.00 )
scatter_raleigh_b=globalPropertyf("sim/private/controls/atmo/scatter_raleigh_b")--46.0 )
sky_gain=globalPropertyf("sim/private/controls/hdr/sky_gain")--2.9 )
---Visibility and Lights
visibility_reported_m_ref=globalPropertyf("sim/weather/visibility_reported_m")
LOD_bias_rat_ref=globalPropertyf("sim/private/controls/reno/LOD_bias_rat")
cars_lod_min_ref=globalPropertyf("sim/private/controls/cars/lod_min")  -- 100 0-100000 cars visibility
tile_lod_bias_ref=globalPropertyf("sim/private/controls/ag/tile_lod_bias")   ----0.1-1  obj vis reload needed
fade_start_rat_ref=globalPropertyf("sim/private/controls/terrain/fade_start_rat")----0-1  0.1 terrain objects (trees) visibl 
composite_far_dist_bias_ref=globalPropertyf("sim/private/controls/terrain/composite_far_dist_bias")  -- 0-1 0.1 terrain details visibility reload needed
fog_be_gone_ref=globalPropertyf("sim/private/controls/fog/fog_be_gone")  -- 0-5 0.01 enviro
--car_lod_boost_ref=globalPropertyf("sim/private/controls/terrain/car_lod_boost")
--lights
exponent_far_ref=globalPropertyf("sim/private/controls/lights/exponent_far")
exponent_near_ref=globalPropertyf("sim/private/controls/lights/exponent_near")
bloom_far_ref=globalPropertyf("sim/private/controls/lights/bloom_far")
bloom_near_ref=globalPropertyf("sim/private/controls/lights/bloom_near")
dist_far_ref=globalPropertyf("sim/private/controls/lights/dist_far")
dist_near_ref=globalPropertyf("sim/private/controls/lights/dist_near")
scale_far_ref=globalPropertyf("sim/private/controls/lights/scale_far") ---------ENVIRO
scale_near_ref=globalPropertyf("sim/private/controls/lights/scale_near") ---------ENVIRO
end
function startlang()
	langfilepath = moduleDirectory.."/lang/eng.txt"
	langfile = io.open(langfilepath, "r")
	
	for i=1,150,1 do
		line=langfile:read()
		if line == nil then break end
		langfile_sett[i] = line
	end
	--print(langfile_sett[1])
	langfile:close()
end
--mainmenu=appendMenuItem(PLUGINS_MENU_ID,"3D Lights helper", main_plugin_menu)
function draw()
	if StartTimerID==0 then
		sasl.gl.drawTexture(get(background_img) , 0 , 0 , 800 , 480, {1 , 1 , 1 , get(ro_sett,9) })
		if get(need_reload,1)==0 then
			sasl.gl.drawTexture(get(gray_pic) , 22 , 60 , 110 , 35, {1 , 1 , 1 , get(ro_sett,9) })
		else
			sasl.gl.drawTexture(get(blue_pic) , 22 , 60 , 110 , 35, {1 , 1 , 1 , get(ro_sett,9) })
		end
		sasl.gl.drawTexture(get(gray_pic) , 137 , 60 , 110 , 35, {1 , 1 , 1 , get(ro_sett,9) })
		sasl.gl.drawText ( MainFont2 , 134 , 400 , langfile_sett[1] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 134 , 360 , langfile_sett[2] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 134 , 320 , langfile_sett[3] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 134 , 280 , langfile_sett[4] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 134 , 240 , langfile_sett[5] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 134 , 200 , langfile_sett[6] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 134 , 160 , langfile_sett[7] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 134 , 120 , langfile_sett[8] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 79 , 71 , langfile_sett[123] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		sasl.gl.drawText ( MainFont2 , 193 , 71 , langfile_sett[124] , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
--		sasl.gl.drawText ( MainFont2 , 34 , 520 , sasl.getCSMouseXPos() , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
--		sasl.gl.drawText ( MainFont2 , 34 , 500 , sasl.getCSMouseYPos() , sizetext , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
		if get(selected_tab)==1 then
			sasl.gl.drawRectangle ( 17 , 390 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			sasl.gl.drawText ( MainFont , 320 , 400 , langfile_sett[9] , sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 370 , langfile_sett[10] , sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 340 , langfile_sett[11] , sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 310 , langfile_sett[12] , sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 280 , langfile_sett[13] , sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 250 , langfile_sett[14] , sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 220 , langfile_sett[15] , sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 190 , langfile_sett[16]..":  "..get(static_plane_build_vis), sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 160 , langfile_sett[17]..":  "..get(static_plane_density).." (min 0, max 6)", sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if scrollwheel>0 then
				sasl.gl.drawTexturePart(get(mousepointer) , sasl.getCSMouseXPos()-15 , sasl.getCSMouseYPos() , 45 , 45, 0, 384 ,64,64,{1,1,0 , get(ro_sett,9) })
			end
			if get(draw_deer_birds_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 397 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 397 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(draw_fire_ball_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 367 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 367 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(draw_boats_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 337 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 337 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(ro_sett,1)==0 then
				if get(draw_aurora_ref)==0 then
					sasl.gl.drawTexture(get(off_pic) , 270 , 307 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
				else
					sasl.gl.drawTexture(get(on_pic) , 270 , 307 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
				end
			else
				sasl.gl.drawTexture(get(mid_pic) , 270 , 307 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(draw_scattering_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 277 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 277 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(draw_volume_fog01_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 247 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 247 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(draw_per_pix_liting_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 217 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 217 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
				
		elseif get(selected_tab)==2 then
			sasl.gl.drawRectangle ( 17 , 350 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			sasl.gl.drawText ( MainFont , 320 , 400 , langfile_sett[18] , 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 370 , langfile_sett[19] , 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 340 , langfile_sett[20] , 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 310 , langfile_sett[21]..":  "..get(draw_reflect_water05).." (min 0, max 5)" , 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 265 , 295 , 787 , 295 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 439 , 295 , 439 , 45 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 613 , 295 , 613 , 45 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )

			sasl.gl.drawText ( MainFont , 352 , 270 , langfile_sett[22] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 526 , 270 , langfile_sett[23] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 700 , 270 , langfile_sett[24] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 332 , 240 , langfile_sett[25]..":" , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 382 , 240 , round(get(fft_amp1_ref),2) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 332 , 210 , langfile_sett[26]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 382 , 210 , round(get(fft_amp2_ref),2) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 332 , 180 , langfile_sett[27]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 382 , 180 , round(get(fft_amp3_ref),2) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 332 , 150 , langfile_sett[28]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 382 , 150 , round(get(fft_amp4_ref),2) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			
			sasl.gl.drawText ( MainFont , 505 , 240 , langfile_sett[29]..":" , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 550 , 240 , get(fft_scale1_ref) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 505 , 210 , langfile_sett[30]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 550 , 210 , get(fft_scale2_ref) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 505 , 180 , langfile_sett[31]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 550 , 180 , get(fft_scale3_ref) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 505 , 150 , langfile_sett[32]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 550 , 150 , get(fft_scale4_ref) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			
			sasl.gl.drawText ( MainFont , 680 , 240 , langfile_sett[33]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 740 , 240 , round(get(noise_speed_ref),2) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 680 , 210 , langfile_sett[34]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 740 , 210 , get(noise_bias_gen_x_ref) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 680 , 180 , langfile_sett[35]..":", 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 740 , 180 , get(noise_bias_gen_y_ref) , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			
			if scrollwheel>0 then
				sasl.gl.drawTexturePart(get(mousepointer) , sasl.getCSMouseXPos()-15 , sasl.getCSMouseYPos() , 45 , 45, 0, 384 ,64,64,{1,1,0 , get(ro_sett,9) })
			end
			if get(use_reflective_water)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 397 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 397 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(draw_fft_water)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 367 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 367 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			--if get(draw_boats_ref)==0 then
				sasl.gl.drawTexture(get(mid_pic) , 270 , 337 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			--else
			--	sasl.gl.drawTexture(get(on_pic) , 270 , 338 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })     WORKAROUND 3D WATER!!! Do not change!
			--end
		elseif get(selected_tab)==3 then
			sasl.gl.drawRectangle ( 17 , 310 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			sasl.gl.drawText ( MainFont , 270 , 400 , langfile_sett[36]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 400 , get(csm_split_exterior).." (min 0, max 3)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 370 , langfile_sett[37]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 370 , get(csm_split_interior).." (min 0, max 3)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 340 , langfile_sett[38]..":  " , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 340 , get(shadow_cam_size), 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 310 , langfile_sett[39]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 310 , get(shadow_size), 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 280 , langfile_sett[40]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 280 , round(get(cockpit_near_adjust),1).." (min 0, max 5)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 250 , langfile_sett[41]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 250 , round(get(cockpit_near_proxy),1).." (min 0, max 5)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 220 , langfile_sett[42]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 220 , get(far_limit), 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 175 , langfile_sett[43], 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 145 , langfile_sett[44], 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if scrollwheel>0 then
				sasl.gl.drawTexturePart(get(mousepointer) , sasl.getCSMouseXPos()-15 , sasl.getCSMouseYPos() , 45 , 45, 0, 384 ,64,64,{1,1,0 , get(ro_sett,9) })
			end
			sasl.gl.drawWideLine ( 265 , 205 , 787 , 205 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			if get(scenery_shadows)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 172 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 172 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(disable_shadow_prep)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 142 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 142 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
		elseif get(selected_tab)==4 then
			sasl.gl.drawRectangle ( 17 , 270 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			if scrollwheel>0 then
				sasl.gl.drawTexturePart(get(mousepointer) , sasl.getCSMouseXPos()-15 , sasl.getCSMouseYPos() , 45 , 45, 0, 384 ,64,64,{1,1,0 , get(ro_sett,9) })
			end
			sasl.gl.drawText ( MainFont , 270 , 400 , langfile_sett[45]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 400 , get(draw_objs_06_ref).." (min 0, max 6)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 370 , langfile_sett[46]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 370 , get(draw_cars_05_ref).." (min 0, max 5)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 340 , langfile_sett[47]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 340 , get(draw_vecs_03_ref).." (min 0, max 3)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 310 , langfile_sett[48]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 310 , get(draw_for_05_ref).." (min 0, max 5)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 280 , langfile_sett[49]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 280 , round(get(inn_ring_density_ref),2), 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 250 , langfile_sett[50]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 250 , round(get(mid_ring_density_ref),2), 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 220 , langfile_sett[51]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 220 , round(get(out_ring_density_ref),2), 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 190 , langfile_sett[52]..":  ", 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 190 , get(draw_detail_apt_03_ref).." (min 0, max 3)" , 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 265 , 175 , 787 , 175 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 145 , langfile_sett[53], 18 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if get(extended_dsfs_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 142 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 142 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			
		elseif get(selected_tab)==5 then
			sasl.gl.drawRectangle ( 17 , 230 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			sasl.gl.drawText ( MainFont , 320 , 400 , langfile_sett[54], 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 370 , langfile_sett[55], 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 340 , langfile_sett[56], 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 310 , langfile_sett[57], 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 320 , 280 , langfile_sett[58], 20 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if get(draw_HDR_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 398 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 398 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(comp_texes_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 368 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 368 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(use_bump_maps_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 338 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 338 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(use_detail_textures_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 308 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 308 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(ssao_enable_ref)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 278 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 278 , 40 , 20, {1 , 1 , 1 , get(ro_sett,9) })
			end
		
		elseif get(selected_tab)==6 then
			sasl.gl.drawRectangle ( 17 , 190 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			sasl.gl.drawText ( MainFont , 385 , 410 , langfile_sett[59] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 640 , 410 , langfile_sett[60] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			if scrollwheel>0 then
				sasl.gl.drawTexturePart(get(mousepointer) , sasl.getCSMouseXPos()-15 , sasl.getCSMouseYPos() , 45 , 45, 0, 384 ,64,64,{1,1,0 , get(ro_sett,9) })
			end
			sasl.gl.drawWideLine ( 265 , 395 , 787 , 395 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 500 , 395 , 500 , 45 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 375 , langfile_sett[61]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 450 , 375 , get(first_res_3d_ref), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 355 , langfile_sett[62]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 450 , 355 , get(last_res_3d_ref), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 335 , langfile_sett[63]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 450 , 335 , round(get(cloud_shadow_lighten_ratio_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 315 , langfile_sett[64]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 450 , 315 , round(get(plot_radius_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 295 , langfile_sett[65]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 450 , 295 , round(get(overdraw_control_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 275 , langfile_sett[66]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 450 , 275 , round(get(ambient_gain_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 255 , langfile_sett[67]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 450 , 255 , round(get(diffuse_gain_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if page_cloud==1 then
				sasl.gl.drawTriangle ( 760 , 70 , 760 , 50 , 780 , 60 , {0.12,0.45,0.75,get(ro_sett,9)} )
				sasl.gl.drawWidePolyLine  ( {760 , 70 , 760 , 50 , 780 , 60, 760 , 70}, 2,{1,1,1,get(ro_sett,9)} )
				sasl.gl.drawText ( MainFont , 505 , 375 , langfile_sett[68]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 725 , 375 , round(get(white_point_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				if get(ro_sett,1)==0 then
					sasl.gl.drawText ( MainFont , 505 , 355 , langfile_sett[69]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 355 , round(get(atmo_scale_raleigh_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 335 , langfile_sett[70]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 335 , round(get(inscatter_gain_raleigh_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				else
					sasl.gl.drawText ( MainFont , 505 , 355 , langfile_sett[69]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 355 , round(get(atmo_scale_raleigh_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 335 , langfile_sett[70]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 335 , round(get(inscatter_gain_raleigh_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
				end
				sasl.gl.drawText ( MainFont , 505 , 315 , langfile_sett[71]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 725 , 315 , round(get(min_shadow_angle_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 505 , 295 , langfile_sett[72]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 725 , 295 , round(get(max_shadow_angle_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 505 , 275 , langfile_sett[73]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 725 , 275 , round(get(max_dsf_vis_ever_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 505 , 255 , langfile_sett[74]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 725 , 255 , round(get(dsf_fade_ratio_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 505 , 235 , langfile_sett[75]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 725 , 235 , round(get(dsf_cutover_scale_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				if get(ro_sett,1)==0 then
					sasl.gl.drawText ( MainFont , 505 , 215 , langfile_sett[76]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 215 , round(get(min_tone_angle_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 195 , langfile_sett[77]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 195 , round(get(max_tone_angle_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 175 , langfile_sett[78]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 175 , round(get(tone_ratio_clean_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 155 , langfile_sett[79]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 155 , round(get(tone_ratio_foggy_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 135 , langfile_sett[80]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 135 , round(get(tone_ratio_hazy_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 115 , langfile_sett[81]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 115 , round(get(tone_ratio_snowy_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 95 , langfile_sett[82]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 95 , round(get(tone_ratio_ocast_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 75 , langfile_sett[83]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 75 , round(get(tone_ratio_strat_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				else
					sasl.gl.drawText ( MainFont , 505 , 215 , langfile_sett[76]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 215 , round(get(min_tone_angle_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 195 , langfile_sett[77]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 195 , round(get(max_tone_angle_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 175 , langfile_sett[78]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 175 , round(get(tone_ratio_clean_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 155 , langfile_sett[79]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 155 , round(get(tone_ratio_foggy_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 135 , langfile_sett[80]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 135 , round(get(tone_ratio_hazy_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 115 , langfile_sett[81]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 115 , round(get(tone_ratio_snowy_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 95 , langfile_sett[82]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 95 , round(get(tone_ratio_ocast_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 75 , langfile_sett[83]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 75 , round(get(tone_ratio_strat_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
				end
			else
				sasl.gl.drawTriangle ( 780 , 70 , 780 , 50 , 760 , 60 , {0.12,0.45,0.75,get(ro_sett,9)} )
				sasl.gl.drawWidePolyLine  ( {780 , 70 , 780 , 50 , 760 , 60, 780 , 70}, 2,{1,1,1,get(ro_sett,9)} )
				if get(ro_sett,1)==0 then
					sasl.gl.drawText ( MainFont , 505 , 375 , langfile_sett[84]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 375 , round(get(tone_ratio_hialt_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 355 , langfile_sett[85]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 355 , round(get(inscatter_gain_mie),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 335 , langfile_sett[86]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 335 , get(scatter_raleigh_r), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 315 , langfile_sett[87]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 315 , get(scatter_raleigh_g), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 295 , langfile_sett[88]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 295 , get(scatter_raleigh_b), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				else
					sasl.gl.drawText ( MainFont , 505 , 375 , langfile_sett[84]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 375 , round(get(tone_ratio_hialt_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 355 , langfile_sett[85]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 355 , round(get(inscatter_gain_mie),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 335 , langfile_sett[86]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 335 , get(scatter_raleigh_r), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 315 , langfile_sett[87]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 315 , get(scatter_raleigh_g), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 505 , 295 , langfile_sett[88]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
					sasl.gl.drawText ( MainFont , 725 , 295 , get(scatter_raleigh_b), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )

				end
				sasl.gl.drawText ( MainFont , 505 , 275 , langfile_sett[89]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 725 , 275 , round(get(sky_gain),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			end
		elseif get(selected_tab)==7 then
			sasl.gl.drawRectangle ( 17 , 150 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			if scrollwheel>0 then
				sasl.gl.drawTexturePart(get(mousepointer) , sasl.getCSMouseXPos()-15 , sasl.getCSMouseYPos() , 45 , 45, 0, 384 ,64,64,{1,1,0 , get(ro_sett,9) })
			end
			sasl.gl.drawText ( MainFont , 385 , 410 , langfile_sett[90] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 695 , 410 , langfile_sett[91] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 695 , 375 , langfile_sett[92] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 695 , 290 , langfile_sett[93] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 695 , 205 , langfile_sett[94] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 695 , 125 , langfile_sett[95] , 18 , false , false , TEXT_ALIGN_CENTER , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 265 , 395 , 787 , 395 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 595 , 310 , 787 , 310 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 595 , 225 , 787 , 225 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 595 , 145 , 787 , 145 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 595 , 395 , 595 , 45 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			if get(ro_sett,1)==0 then
				sasl.gl.drawText ( MainFont , 270 , 375 , langfile_sett[96]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 530 , 375 , round(get(visibility_reported_m_ref),0), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			else
				sasl.gl.drawText ( MainFont , 270 , 375 , langfile_sett[96]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 530 , 375 , round(get(visibility_reported_m_ref),0), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
			end
			sasl.gl.drawText ( MainFont , 270 , 355 , langfile_sett[97]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 530 , 355 , round(get(LOD_bias_rat_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 335 , langfile_sett[98]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 530 , 335 , get(cars_lod_min_ref), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 315 , langfile_sett[99]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 530 , 315 , round(get(tile_lod_bias_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 295 , langfile_sett[100]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 530 , 295 , round(get(fade_start_rat_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 275 , langfile_sett[101]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 530 , 275 , round(get(composite_far_dist_bias_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if get(ro_sett,1)==0 then
				sasl.gl.drawText ( MainFont , 270 , 255 , langfile_sett[102]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 530 , 255 , round(get(fog_be_gone_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 605 , 350 , langfile_sett[103]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 735 , 350 , round(get(scale_near_ref)*100,0).."%", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 605 , 325 , langfile_sett[104]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 735 , 325 , round(get(scale_far_ref)*100,0).."%", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			else
				sasl.gl.drawText ( MainFont , 270 , 255 , langfile_sett[102]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 530 , 255 , round(get(fog_be_gone_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9)})
				sasl.gl.drawText ( MainFont , 605 , 350 , langfile_sett[103]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 735 , 350 , round(get(scale_near_ref)*100,0).."%", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 605 , 325 , langfile_sett[104]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
				sasl.gl.drawText ( MainFont , 735 , 325 , round(get(scale_far_ref)*100,0).."%", 16 , false , false , TEXT_ALIGN_LEFT , {0.5 , 0.5 , 0.5 , get(ro_sett,9) } )
			end
			sasl.gl.drawText ( MainFont , 605 , 265 , langfile_sett[105]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 735 , 265 , round(get(dist_near_ref),0), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 605 , 240 , langfile_sett[106]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 735 , 240 , round(get(dist_far_ref),0), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 605 , 180 , langfile_sett[107]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 735 , 180 , round(get(exponent_near_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 605 , 155 , langfile_sett[108]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 735 , 155 , round(get(exponent_far_ref),2), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 605 , 100 , langfile_sett[109]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 735 , 100 , round(get(bloom_near_ref),0), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 605 , 75 , langfile_sett[110]..":  ", 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 735 , 75 , round(get(bloom_far_ref),0), 16 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
		elseif get(selected_tab)==8 then
			sasl.gl.drawRectangle ( 17 , 110 , 235 , 5 , {0.12,0.45,0.75,get(ro_sett,9)} )
			sasl.gl.drawText ( MainFont , 310 , 410 , langfile_sett[111] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 390 , langfile_sett[112]..":  ", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if get(ro_sett,2)==0 then
				sasl.gl.drawText ( MainFont , 520 , 390 , "None", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			else
				sasl.gl.drawText ( MainFont , 520 , 390 , get(ro_sett,2), sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			end
			sasl.gl.drawText ( MainFont , 270 , 370 , langfile_sett[113] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			--SAVE
			sasl.gl.drawTexture(get(gray_sq_pic) , 330 , 365 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 330 , 365 , 20 , 20, {1 , 1 , 1 , visib_blue[1]})
			sasl.gl.drawText ( MainFont , 335 , 369 , 1 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 360 , 365 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 360 , 365 , 20 , 20, {1 , 1 , 1 , visib_blue[2]})
			sasl.gl.drawText ( MainFont , 365 , 369 , 2 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 390 , 365 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 390 , 365 , 20 , 20, {1 , 1 , 1 , visib_blue[3]})
			sasl.gl.drawText ( MainFont , 395 , 369 , 3 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 420 , 365 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 420 , 365 , 20 , 20, {1 , 1 , 1 , visib_blue[4]})
			sasl.gl.drawText ( MainFont , 425 , 369 , 4 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 450 , 365 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 450 , 365 , 20 , 20, {1 , 1 , 1 , visib_blue[5]})
			sasl.gl.drawText ( MainFont , 455 , 369 , 5 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 480 , 365 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 480 , 365 , 20 , 20, {1 , 1 , 1 , visib_blue[6]})
			sasl.gl.drawText ( MainFont , 485 , 369 , 6 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			--LOAD
			sasl.gl.drawText ( MainFont , 270 , 345 , langfile_sett[114] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 330 , 340 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 330 , 340 , 20 , 20, {1 , 1 , 1 , visib_blue[7]})
			sasl.gl.drawText ( MainFont , 335 , 344 , 1 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 360 , 340 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 360 , 340 , 20 , 20, {1 , 1 , 1 , visib_blue[8]})
			sasl.gl.drawText ( MainFont , 365 , 344 , 2 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 390 , 340 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 390 , 340 , 20 , 20, {1 , 1 , 1 , visib_blue[9]})
			sasl.gl.drawText ( MainFont , 395 , 344 , 3 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 420 , 340 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 420 , 340 , 20 , 20, {1 , 1 , 1 , visib_blue[10]})
			sasl.gl.drawText ( MainFont , 425 , 344 , 4 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 450 , 340 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 450 , 340 , 20 , 20, {1 , 1 , 1 , visib_blue[11]})
			sasl.gl.drawText ( MainFont , 455 , 344 , 5 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawTexture(get(gray_sq_pic) , 480 , 340 , 20 , 20, {1 , 1 , 1 , get(ro_sett,9)})
			sasl.gl.drawTexture(get(blue_sq_pic) , 480 , 340 , 20 , 20, {1 , 1 , 1 , visib_blue[12]})
			sasl.gl.drawText ( MainFont , 485 , 344 , 6 , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			---
			sasl.gl.drawText ( MainFont , 270 , 320 , langfile_sett[115]..": " , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 400 , 320 , round(get(ro_sett,9)*100,0) .." %", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 300 , langfile_sett[126]..": " , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 410 , 300 , round(get(ro_sett,11),0) .." %", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 310 , 280 , langfile_sett[127] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 310 , 260 , langfile_sett[116] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 610 , 260 , langfile_sett[128] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 265 , 250 , 787 , 250 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 230 , langfile_sett[117] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 210 , langfile_sett[118]..":  ", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 210 , get(ro_sett,6), sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 190 , langfile_sett[119]..":  ", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 190 , get(ro_sett,7), sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 170 , langfile_sett[120]..":  ", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 620 , 170 , get(ro_sett,8), sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawWideLine ( 265 , 160 , 787 , 160 , 2 , {0.8 , 0.8 , 0.8 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 310 , 140 , langfile_sett[121], sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			sasl.gl.drawText ( MainFont , 270 , 100 , langfile_sett[122]..":  ", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if get(ro_sett,5)==1 then
				sasl.gl.drawText ( MainFont , 410 , 100 , "English", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			elseif get(ro_sett,5)==2 then
				sasl.gl.drawText ( MainFont , 410 , 100 , "Russian", sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			end
			sasl.gl.drawText ( MainFont , 310 , 120 , langfile_sett[125] , sizetext2 , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , get(ro_sett,9) } )
			if scrollwheel>0 then
				sasl.gl.drawTexturePart(get(mousepointer) , sasl.getCSMouseXPos()-15 , sasl.getCSMouseYPos() , 45 , 45, 0, 384 ,64,64,{1,1,0 , get(ro_sett,9) })
			end
			if get(ro_sett,1)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 408 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 408 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(ro_sett,3)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 258 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 258 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(ro_sett,4)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 138 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 138 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(ro_sett,10)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 118 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 118 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(ro_sett,12)==0 then
				sasl.gl.drawTexture(get(off_pic) , 270 , 278 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 270 , 278 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9) })
			end
			if get(ro_sett,13)==0 then
				sasl.gl.drawTexture(get(off_pic) , 570 , 258 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9)})
			else
				sasl.gl.drawTexture(get(on_pic) , 570 , 258 , 30 , 15, {1 , 1 , 1 , get(ro_sett,9) })
			end
		end
	else
		
		
		
		
	--	if timercount>1 then
	--		mnm=mnm.."."
	--		timercount=0
	--	end
	--	if mnm=="......" then
	--		mnm=""
	--	end
	--	sasl.gl.drawText ( MainFont , 20 , 20 , "Loading Advanced Rendering Options plugin"..mnm, sizetext , false , false , TEXT_ALIGN_LEFT , {1 , 1 , 1 , 1 } )
		
	end
	
end
function savesettings()
---1-xEnviro enabled(0,1) , 2-load preset(0-6) , 3-autolod(0,1)
																							----4-gray horizon(0,1) , 5-language(1-x), 6-autolod min fps, 7-autolod max fps
																							----8-autolod timeout, 9-plugin visibility, 10-waterfix
	local settings_table = {"xEnviroenabled","presettoload","autolodenabled","autograyhorizonenabled","language","autolodminfps","autolodmaxfps","autolodtimeout","pluginvisibility","autowaterfix","sliderheight","showslider","AutoLodShowFPS"}
	settingsfilepath = moduleDirectory.."/settings and presets/settings.txt"
	settingsfile = io.open(settingsfilepath, "w")
	for ind=1,13,1 do
		settingsfile:write(settings_table[ind].."="..round(get(ro_sett,ind),2), "\n")
	end
	--print(langfile_sett[1])
	settingsfile:close()
end

function savepreset(pr_num)
	val_to_save[1]="Draw Deer Birds="..get(draw_deer_birds_ref)
	val_to_save[2]="Draw Fire Balls="..get(draw_fire_ball_ref)
	val_to_save[3]="Draw Boats="..get(draw_boats_ref)
	val_to_save[4]="Draw Aurora="..get(draw_aurora_ref)
	val_to_save[5]="Draw Scattering="..get(draw_scattering_ref)
	val_to_save[6]="Draw VolumeFog (0 or 1)="..get(draw_volume_fog01_ref)
	val_to_save[7]="Draw per pix liting="..get(draw_per_pix_liting_ref)
	val_to_save[8]="Static Plane Visibility="..get(static_plane_build_vis)
	val_to_save[9]="Static Plane Density="..get(static_plane_density)
	val_to_save[10]="Use Reflective Water="..get(use_reflective_water)
	val_to_save[11]="Draw FFT Water="..get(draw_fft_water)
	val_to_save[12]="Draw Reflect Water (0-5)="..get(draw_reflect_water05)
	val_to_save[13]="FFT Amp1="..round(get(fft_amp1_ref),1)
	val_to_save[14]="FFT Amp2="..round(get(fft_amp2_ref),1)
	val_to_save[15]="FFT Amp3="..round(get(fft_amp3_ref),1)
	val_to_save[16]="FFT Amp4="..round(get(fft_amp4_ref),1)
	val_to_save[17]="FFT Scale1="..get(fft_scale1_ref)
	val_to_save[18]="FFT Scale2="..get(fft_scale2_ref)
	val_to_save[19]="FFT Scale3="..get(fft_scale3_ref)
	val_to_save[20]="FFT Scale4="..get(fft_scale4_ref)
	val_to_save[21]="Noise speed="..round(get(noise_speed_ref),2)
	val_to_save[22]="Noise bias gen X="..round(get(noise_bias_gen_x_ref),2)
	val_to_save[23]="Noise bias gen Y="..round(get(noise_bias_gen_y_ref),2)
	val_to_save[24]="CSM Split exterior="..get(csm_split_exterior)
	val_to_save[25]="CSM Split interior="..get(csm_split_interior)
	val_to_save[26]="Far limit="..get(far_limit)
	val_to_save[27]="Scenery shadows="..get(scenery_shadows)
	val_to_save[28]="Cockpit near adjust="..get(cockpit_near_adjust)
	val_to_save[29]="Cockpit near proxy="..get(cockpit_near_proxy)
	val_to_save[30]="Shadow cam size="..get(shadow_cam_size)
	val_to_save[31]="Shadow size="..get(shadow_size)
	val_to_save[32]="Disable shadows="..get(disable_shadow_prep)
	val_to_save[33]="Last 3D pass="..get(last_3d_pass)
	val_to_save[34]="Draw objects (0-6)="..get(draw_objs_06_ref)
	val_to_save[35]="Draw cars (0-5)="..get(draw_cars_05_ref)
	val_to_save[36]="Draw vecs (0-3)="..get(draw_vecs_03_ref)
	val_to_save[37]="Draw for (0-5)="..get(draw_for_05_ref)
	val_to_save[38]="Forest inner ring density="..round(get(inn_ring_density_ref),2)
	val_to_save[39]="Forest middle ring density="..round(get(mid_ring_density_ref),2)
	val_to_save[40]="Forest outer ring density="..round(get(out_ring_density_ref),2)
	val_to_save[41]="Draw airport details (0-3)="..get(draw_detail_apt_03_ref)
	val_to_save[42]="Extended DSFs (0-1)="..get(extended_dsfs_ref)
	val_to_save[43]="Draw HDR="..get(draw_HDR_ref)
	val_to_save[44]="Texture compression="..get(comp_texes_ref)
	val_to_save[45]="Use bump textures (0-1)="..get(use_bump_maps_ref)
	val_to_save[46]="Use detail textures (0-1)="..get(use_detail_textures_ref)
	val_to_save[47]="SSAO enabled (0-1)="..get(ssao_enable_ref)
	val_to_save[48]="First 3D resolution="..get(first_res_3d_ref)
	val_to_save[49]="Last 3D resolution="..get(last_res_3d_ref)
	val_to_save[50]="Cloud shadow lighten ratio="..round(get(cloud_shadow_lighten_ratio_ref),2)
	val_to_save[51]="Plot radius="..round(get(plot_radius_ref),2)
	val_to_save[52]="Overdraw control="..round(get(overdraw_control_ref),2)
	val_to_save[53]="Ambient gain="..round(get(ambient_gain_ref),2)
	val_to_save[54]="Diffuse gain="..round(get(diffuse_gain_ref),2)
	val_to_save[55]="White point="..round(get(white_point_ref),2)
	val_to_save[56]="Atmo scale raleigh="..round(get(atmo_scale_raleigh_ref),2)
	val_to_save[57]="Inscatter gain raleigh="..get(inscatter_gain_raleigh_ref)
	val_to_save[58]="Min shadow angle="..get(min_shadow_angle_ref)
	val_to_save[59]="Max shadow angle="..get(max_shadow_angle_ref)
	val_to_save[60]="Max dsf vis="..get(max_dsf_vis_ever_ref)
	val_to_save[61]="Dsf fade ratio="..round(get(dsf_fade_ratio_ref),2)
	val_to_save[62]="Dsf cutover scale="..round(get(dsf_cutover_scale_ref),2)
	val_to_save[63]="Min tone angle="..get(min_tone_angle_ref)
	val_to_save[64]="Max tone angl="..get(max_tone_angle_ref)
	val_to_save[65]="Tone ratio clean="..round(get(tone_ratio_clean_ref),1)
	val_to_save[66]="Tone ratio foggy="..round(get(tone_ratio_foggy_ref),1)
	val_to_save[67]="Tone ratio hazy="..round(get(tone_ratio_hazy_ref),1)
	val_to_save[68]="Tone ratio snowy="..round(get(tone_ratio_snowy_ref),1)
	val_to_save[69]="Tone ratio overcast="..round(get(tone_ratio_ocast_ref),1)
	val_to_save[70]="Tone ratio strat="..round(get(tone_ratio_strat_ref),1)
	val_to_save[71]="Tone ratio hight altitude="..round(get(tone_ratio_hialt_ref),1)
	val_to_save[72]="Inscatter gain mie="..get(inscatter_gain_mie)
	val_to_save[73]="Scatter raleigh R="..get(scatter_raleigh_r)
	val_to_save[74]="Scatter raleigh G="..get(scatter_raleigh_g)
	val_to_save[75]="Scatter raleigh B="..get(scatter_raleigh_b)
	val_to_save[76]="Sky gain="..get(sky_gain)
	val_to_save[77]="Visibility (meters)="..round(get(visibility_reported_m_ref),0)
	val_to_save[78]="LOD="..get(LOD_bias_rat_ref)
	val_to_save[79]="Cars LOD="..get(cars_lod_min_ref)
	val_to_save[80]="Tile LOD="..round(get(tile_lod_bias_ref),2)
	val_to_save[81]="Fade start ratio="..round(get(fade_start_rat_ref),2)
	val_to_save[82]="Composite far dist bias="..round(get(composite_far_dist_bias_ref),2)
	val_to_save[83]="Fog be gone="..round(get(fog_be_gone_ref),2)
	val_to_save[84]="Scale near="..round(get(scale_near_ref),2)
	val_to_save[85]="Scale far="..round(get(scale_far_ref),2)
	val_to_save[86]="Dist near="..get(dist_near_ref)
	val_to_save[87]="Dist far="..get(dist_far_ref)
	val_to_save[88]="Exponent near="..round(get(exponent_near_ref),2)
	val_to_save[89]="Exponent far="..round(get(exponent_far_ref),2)
	val_to_save[90]="Bloom near="..get(bloom_near_ref)
	val_to_save[91]="Bloom far="..get(bloom_far_ref)
	settingsfilepath = moduleDirectory.."/settings and presets/preset_"..pr_num..".txt"
	settingsfile = io.open(settingsfilepath, "w")
	for ind=1,91,1 do
		settingsfile:write(val_to_save[ind], "\n")
	end
	--print(langfile_sett[1])
	settingsfile:close()
end

function load_preset(pr_num)
	settingsfilepath = moduleDirectory.."/settings and presets/preset_"..pr_num..".txt"
	existfile = isFileExists (settingsfilepath)
	settingsfile = io.open(settingsfilepath, "r")
	if existfile then
		local lines = settingsfile:read("*a")
		for k, v in string.gmatch(lines, "([%w%s%(%-%)]+)=([%d%p%-]+)") do
			set(ro_refs_values, tonumber(v), ii)
			ii=ii+1
		end
		settingsfile:close()
		ii=1
		set(draw_deer_birds_ref,get(ro_refs_values,1))
		set(draw_fire_ball_ref,get(ro_refs_values,2))
		set(draw_boats_ref,get(ro_refs_values,3))
		set(draw_aurora_ref,get(ro_refs_values,4))
		set(draw_scattering_ref,get(ro_refs_values,5))
		set(draw_volume_fog01_ref,get(ro_refs_values,6))
		set(draw_per_pix_liting_ref,get(ro_refs_values,7))
		set(static_plane_build_vis,get(ro_refs_values,8))
		set(static_plane_density,get(ro_refs_values,9))
		set(use_reflective_water,get(ro_refs_values,10))
		set(draw_fft_water,get(ro_refs_values,11))
		set(draw_reflect_water05,get(ro_refs_values,12))
		set(fft_amp1_ref,get(ro_refs_values,13))
		set(fft_amp2_ref,get(ro_refs_values,14))
		set(fft_amp3_ref,get(ro_refs_values,15))
		set(fft_amp4_ref,get(ro_refs_values,16))
		set(fft_scale1_ref,get(ro_refs_values,17))
		set(fft_scale2_ref,get(ro_refs_values,18))
		set(fft_scale3_ref,get(ro_refs_values,19))
		set(fft_scale4_ref,get(ro_refs_values,20))
		set(noise_speed_ref,get(ro_refs_values,21))
		set(noise_bias_gen_x_ref,get(ro_refs_values,22))
		set(noise_bias_gen_y_ref,get(ro_refs_values,23))
		set(csm_split_exterior,get(ro_refs_values,24))
		set(csm_split_interior,get(ro_refs_values,25))
		set(far_limit,get(ro_refs_values,26))
		set(scenery_shadows,get(ro_refs_values,27))
		set(cockpit_near_adjust,get(ro_refs_values,28))
		set(cockpit_near_proxy,get(ro_refs_values,29))
		set(shadow_cam_size,get(ro_refs_values,30))
		set(shadow_size,get(ro_refs_values,31))
		set(disable_shadow_prep,get(ro_refs_values,32))
		set(last_3d_pass,get(ro_refs_values,33))
		set(draw_objs_06_ref,get(ro_refs_values,34))
		set(draw_cars_05_ref,get(ro_refs_values,35))
		set(draw_vecs_03_ref,get(ro_refs_values,36))
		set(draw_for_05_ref,get(ro_refs_values,37))
		set(inn_ring_density_ref,get(ro_refs_values,38))
		set(mid_ring_density_ref,get(ro_refs_values,39))
		set(out_ring_density_ref,get(ro_refs_values,40))
		set(draw_detail_apt_03_ref,get(ro_refs_values,41))
		set(extended_dsfs_ref,get(ro_refs_values,42))
		set(draw_HDR_ref,get(ro_refs_values,43))
		set(comp_texes_ref,get(ro_refs_values,44))
		set(use_bump_maps_ref,get(ro_refs_values,45))
		set(use_detail_textures_ref,get(ro_refs_values,46))
		set(ssao_enable_ref,get(ro_refs_values,47))
		set(first_res_3d_ref,get(ro_refs_values,48))
		set(last_res_3d_ref,get(ro_refs_values,49))
		set(cloud_shadow_lighten_ratio_ref,get(ro_refs_values,50))
		set(plot_radius_ref,get(ro_refs_values,51))
		set(overdraw_control_ref,get(ro_refs_values,52))
		set(ambient_gain_ref,get(ro_refs_values,53))
		set(diffuse_gain_ref,get(ro_refs_values,54))
		set(white_point_ref,get(ro_refs_values,55))
		set(atmo_scale_raleigh_ref,get(ro_refs_values,56))
		set(inscatter_gain_raleigh_ref,get(ro_refs_values,57))
		set(min_shadow_angle_ref,get(ro_refs_values,58))
		set(max_shadow_angle_ref,get(ro_refs_values,59))
		set(max_dsf_vis_ever_ref,get(ro_refs_values,60))
		set(dsf_fade_ratio_ref,get(ro_refs_values,61))
		set(dsf_cutover_scale_ref,get(ro_refs_values,62))
		set(min_tone_angle_ref,get(ro_refs_values,63))
		set(max_tone_angle_ref,get(ro_refs_values,64))
		set(tone_ratio_clean_ref,get(ro_refs_values,65))
		set(tone_ratio_foggy_ref,get(ro_refs_values,66))
		set(tone_ratio_hazy_ref,get(ro_refs_values,67))
		set(tone_ratio_snowy_ref,get(ro_refs_values,68))
		set(tone_ratio_ocast_ref,get(ro_refs_values,69))
		set(tone_ratio_strat_ref,get(ro_refs_values,70))
		set(tone_ratio_hialt_ref,get(ro_refs_values,71))
		set(inscatter_gain_mie,get(ro_refs_values,72))
		set(scatter_raleigh_r,get(ro_refs_values,73))
		set(scatter_raleigh_g,get(ro_refs_values,74))
		set(scatter_raleigh_b,get(ro_refs_values,75))
		set(sky_gain,get(ro_refs_values,76))
		set(visibility_reported_m_ref,get(ro_refs_values,77))
		set(LOD_bias_rat_ref,get(ro_refs_values,78))
		set(cars_lod_min_ref,get(ro_refs_values,79))
		set(tile_lod_bias_ref,get(ro_refs_values,80))
		set(fade_start_rat_ref,get(ro_refs_values,81))
		set(composite_far_dist_bias_ref,get(ro_refs_values,82))
		set(fog_be_gone_ref,get(ro_refs_values,83))
		set(scale_near_ref,get(ro_refs_values,84))
		set(scale_far_ref,get(ro_refs_values,85))
		set(dist_near_ref,get(ro_refs_values,86))
		set(dist_far_ref,get(ro_refs_values,87))
		set(exponent_near_ref,get(ro_refs_values,88))
		set(exponent_far_ref,get(ro_refs_values,89))
		set(bloom_near_ref,get(ro_refs_values,90))
		set(bloom_far_ref,get(ro_refs_values,91))
	end
end

function update()
	for i=1,12,1 do
		if visib_blue[i]>0 then
			visib_blue[i]=visib_blue[i]-0.05
		elseif visib_blue[i]<0 then visib_blue[i]=0
		end
	end
	if StartTimerID ~= 0 then
		timevar = sasl.getElapsedSeconds(StartTimerID)
		timercount=timercount+0.1
	end
	if timevar>5 then					------LOADING TIMER
		readrefs()
		startlang()
		sasl.stopTimer(StartTimerID)
		sasl.deleteTimer(StartTimerID)
		StartTimerID=0
		timevar=0
	end
	if scrollwheel>0 then
		scrollwheel=scrollwheel-0.05
	end
	---Заготовка под мультиязычносить и гибкость интерфейса---------------
	--if get(selected_tab)==1 and sizetextset==false then
	---	lengthtext = sasl.gl.measureText ( MainFont , langfile_sett[16] , sizetext , false , false)
	--	if lengthtext>	415 then
	--		sizetext=sizetext-1
	--	else sizetextset=true
	--	end
	--end
end
function onMouseMove(component, x, y, button, parentX, parentY)
	if get(selected_tab)==1 then
		if x>352 and x<760 and y>188 and y<218 then
			scrollwheel=1
		elseif x>270 and x<760 and y>158 and y<188 then
			scrollwheel=1
		else
			scrollwheel=0
		end
	elseif get(selected_tab)==2 then
		if x>375 and x<415 and y>140 and y<260 then
			scrollwheel=1
		elseif x>540 and x<580 and y>140 and y<260 then
			scrollwheel=1
		elseif x>742 and x<787 and y>140 and y<260 then
			scrollwheel=1
		else
			scrollwheel=0
		end
	elseif get(selected_tab)==3 then
		if x>610 and x<787 and y>205 and y<420 then
			scrollwheel=1
		else
			scrollwheel=0
		end
	elseif get(selected_tab)==4 then
		if x>610 and x<787 and y>182 and y<420 then
			scrollwheel=1
		else
			scrollwheel=0
		end
	elseif get(selected_tab)==6 then
		if get(ro_sett,1)==0 then
			if page_cloud==1 then
				if x>440 and x<500 and y>255 and y<394 then
					scrollwheel=1
				elseif x>725 and x<787 and y>75 and y<394 then
					scrollwheel=1
				else
					scrollwheel=0
				end
			else
				if x>440 and x<500 and y>255 and y<394 then
					scrollwheel=1
				elseif x>725 and x<787 and y>270 and y<394 then
					scrollwheel=1
				else
					scrollwheel=0
				end
			end
		else
			if page_cloud==1 then
				if x>440 and x<500 and y>255 and y<394 then
					scrollwheel=1
				elseif x>725 and x<787 and y>374 and y<394 then
					scrollwheel=1
				elseif x>725 and x<787 and y>234 and y<330 then
					scrollwheel=1
				else
					scrollwheel=0
				end
			else
				if x>440 and x<500 and y>255 and y<394 then
					scrollwheel=1
				elseif x>725 and x<787 and y>270 and y<290 then
					scrollwheel=1
				else
					scrollwheel=0
				end
			end
		end
	elseif get(selected_tab)==7 then
		if get(ro_sett,1)==0 then
			if x>530 and x<590 and y>255 and y<394 then
				scrollwheel=1
			elseif x>730 and x<787 and y>325 and y<365 then
				scrollwheel=1
			elseif x>730 and x<787 and y>235 and y<280 then
				scrollwheel=1
			elseif x>730 and x<787 and y>155 and y<195 then
				scrollwheel=1
			elseif x>730 and x<787 and y>70 and y<115 then
				scrollwheel=1
			else
				scrollwheel=0
			end
		else
			if x>530 and x<590 and y>275 and y<370 then
				scrollwheel=1
			elseif x>730 and x<787 and y>325 and y<365 then
				scrollwheel=0
			elseif x>730 and x<787 and y>235 and y<280 then
				scrollwheel=1
			elseif x>730 and x<787 and y>155 and y<195 then
				scrollwheel=1
			elseif x>730 and x<787 and y>70 and y<115 then
				scrollwheel=1
			else
				scrollwheel=0
			end
		end
	elseif get(selected_tab)==8 then
		if x>520 and x<565 and y>390 and y<405 then
			scrollwheel=1
		elseif x>400 and x<450 and y>300 and y<335 then
			scrollwheel=1
		elseif x>620 and x<650 and y>170 and y<225 then
			scrollwheel=1
		elseif x>410 and x<470 and y>100 and y<115 then 
			scrollwheel=1
		else
			scrollwheel=0
		end
	end
end


function onMouseWheel ( component , x , y , button , parentX , parentY, value )
	if get(selected_tab)==1 then
			if x>270 and x<800 and y>188 and y<218 then
				set(static_plane_build_vis,get(static_plane_build_vis)+value*100)
				if get(static_plane_build_vis)<0 then
					set(static_plane_build_vis,0)
					set(static_plane_density,0)
				elseif get(static_plane_build_vis)==0 then set(static_plane_density,0)
				elseif get(static_plane_build_vis)>100000 then
					set(static_plane_build_vis,100000)
				end
			elseif x>270 and x<800 and y>158 and y<188 then
				set(static_plane_density,get(static_plane_density)+value)
				if get(static_plane_density)<0 then
					set(static_plane_density,0)
					set(static_plane_build_vis,0)
				elseif get(static_plane_density)==0 then set(static_plane_build_vis,0)
				elseif get(static_plane_density)>6 then
					set(static_plane_density,6)
				end
			end
	elseif get(selected_tab)==2 then
		if x>505 and x<690 and y>305 and y<330 then
			set(draw_reflect_water05,get(draw_reflect_water05)+value)
			if get(draw_reflect_water05)<0 then
					set(draw_reflect_water05,0)
			elseif get(draw_reflect_water05)==0 then set(draw_reflect_water05,0)
			elseif get(draw_reflect_water05)>5 then
					set(draw_reflect_water05,5)
			end
		elseif x>375 and x<415 and y>231 and y<260 then
			set(fft_amp1_ref,get(fft_amp1_ref)+value*0.1)
			if get(fft_amp1_ref)<0 then
					set(fft_amp1_ref,0)
			elseif get(fft_amp1_ref)==0 then set(fft_amp1_ref,0)
			end
		elseif x>375 and x<415 and y>201 and y<230 then
			set(fft_amp2_ref,get(fft_amp2_ref)+value*0.1)
			if get(fft_amp2_ref)<0 then
					set(fft_amp2_ref,0)
			elseif get(fft_amp2_ref)==0 then set(fft_amp2_ref,0)
			end
		elseif x>375 and x<415 and y>171 and y<200 then
			set(fft_amp3_ref,get(fft_amp3_ref)+value*0.1)
			if get(fft_amp3_ref)<0 then
					set(fft_amp3_ref,0)
			elseif get(fft_amp3_ref)==0 then set(fft_amp3_ref,0)
			end
		elseif x>375 and x<415 and y>141 and y<170 then
			set(fft_amp4_ref,get(fft_amp4_ref)+value*0.1)
			if get(fft_amp4_ref)<0 then
					set(fft_amp4_ref,0)
			elseif get(fft_amp4_ref)==0 then set(fft_amp4_ref,0)
			end
		elseif x>540 and x<580 and y>231 and y<260 then
			set(fft_scale1_ref,get(fft_scale1_ref)+value)
			if get(fft_scale1_ref)<0 then
					set(fft_scale1_ref,0)
			elseif get(fft_scale1_ref)==0 then set(fft_scale1_ref,0)
			end
		elseif x>540 and x<580 and y>201 and y<230 then
			set(fft_scale2_ref,get(fft_scale2_ref)+value)
			if get(fft_scale2_ref)<0 then
					set(fft_scale2_ref,0)
			elseif get(fft_scale2_ref)==0 then set(fft_scale2_ref,0)
			end
		elseif x>540 and x<580 and y>171 and y<200 then
			set(fft_scale3_ref,get(fft_scale3_ref)+value)
			if get(fft_scale3_ref)<0 then
					set(fft_scale3_ref,0)
			elseif get(fft_scale3_ref)==0 then set(fft_scale3_ref,0)
			end
		elseif x>540 and x<580 and y>140 and y<170 then
			set(fft_scale4_ref,get(fft_scale4_ref)+value)
			if get(fft_scale4_ref)<0 then
					set(fft_scale4_ref,0)
			elseif get(fft_scale4_ref)==0 then set(fft_scale4_ref,0)
			end
		elseif x>742 and x<787 and y>231 and y<260 then
			set(noise_speed_ref,get(noise_speed_ref)+value*0.1)
			if get(noise_speed_ref)<0 then
					set(noise_speed_ref,0)
			elseif get(noise_speed_ref)==0 then set(noise_speed_ref,0)
			elseif get(noise_speed_ref)>100 then
					set(noise_speed_ref,100)
			end
		elseif x>742 and x<787 and y>201 and y<230 then
			set(noise_bias_gen_x_ref,get(noise_bias_gen_x_ref)+value)
			if get(noise_bias_gen_x_ref)<0 then
					set(noise_bias_gen_x_ref,0)
			elseif get(noise_bias_gen_x_ref)==0 then set(noise_bias_gen_x_ref,0)
			elseif get(noise_bias_gen_x_ref)>100 then
					set(noise_bias_gen_x_ref,100)
			end
		elseif x>742 and x<787 and y>171 and y<200 then
			set(noise_bias_gen_y_ref,get(noise_bias_gen_y_ref)+value)
			if get(noise_bias_gen_y_ref)<0 then
					set(noise_bias_gen_y_ref,0)
			elseif get(noise_bias_gen_y_ref)==0 then set(noise_bias_gen_y_ref,0)
			elseif get(noise_bias_gen_y_ref)>100 then
					set(noise_bias_gen_y_ref,100)
			end
		end
	elseif get(selected_tab)==3 then
		if x>610 and x<787 and y>391 and y<420 then
			set(csm_split_exterior,get(csm_split_exterior)+value)
			if get(csm_split_exterior)<0 then
					set(csm_split_exterior,0)
			elseif get(csm_split_exterior)==0 then set(csm_split_exterior,0)
			elseif get(csm_split_exterior)>3 then
					set(csm_split_exterior,3)
			end
		elseif x>610 and x<787 and y>361 and y<390 then
			set(csm_split_interior,get(csm_split_interior)+value)
			if get(csm_split_interior)<0 then
					set(csm_split_interior,0)
			elseif get(csm_split_interior)==0 then set(csm_split_interior,0)
			elseif get(csm_split_interior)>3 then
					set(csm_split_interior,3)
			end
		elseif x>610 and x<787 and y>331 and y<360 then
			set(shadow_cam_size,get(shadow_cam_size)+value*512)
			if get(shadow_cam_size)<=512 then
					set(shadow_cam_size,512)
			elseif get(shadow_cam_size)>8192 then
					set(shadow_cam_size,8192)
			end
		elseif x>610 and x<787 and y>301 and y<330 then
			set(shadow_size,get(shadow_size)+value*512)
			if get(shadow_size)<=512 then
					set(shadow_size,512)
			elseif get(shadow_size)>8192 then
					set(shadow_size,8192)
			end
		elseif x>610 and x<787 and y>271 and y<300 then
			set(cockpit_near_adjust,get(cockpit_near_adjust)+value*0.1)
			if get(cockpit_near_adjust)<0 then
					set(cockpit_near_adjust,0)
			elseif get(cockpit_near_adjust)==0 then set(cockpit_near_adjust,0)
			elseif get(cockpit_near_adjust)>5 then
					set(cockpit_near_adjust,5)
			end
		elseif x>610 and x<787 and y>241 and y<270 then
			set(cockpit_near_proxy,get(cockpit_near_proxy)+value*0.1)
			if get(cockpit_near_proxy)<0 then
					set(cockpit_near_proxy,0)
			elseif get(cockpit_near_proxy)==0 then set(cockpit_near_proxy,0)
			elseif get(cockpit_near_proxy)>5 then
					set(cockpit_near_proxy,5)
			end
		elseif x>610 and x<787 and y>210 and y<240 then
			set(far_limit,get(far_limit)+value*50)
			if get(far_limit)<0 then
					set(far_limit,0)
			elseif get(far_limit)==0 then set(far_limit,0)
			elseif get(far_limit)>100000 then
					set(far_limit,100000)
			end
		end
		       
	elseif get(selected_tab)==4 then
		if x>610 and x<787 and y>391 and y<420 then
			set(draw_objs_06_ref,get(draw_objs_06_ref)+value)
			if get(draw_objs_06_ref)<0 then
					set(draw_objs_06_ref,0)
			elseif get(draw_objs_06_ref)==0 then set(draw_objs_06_ref,0)
			elseif get(draw_objs_06_ref)>6 then
					set(draw_objs_06_ref,6)
			end
		elseif x>610 and x<787 and y>361 and y<390 then
			set(draw_cars_05_ref,get(draw_cars_05_ref)+value)
			if get(draw_cars_05_ref)<0 then
					set(draw_cars_05_ref,0)
			elseif get(draw_cars_05_ref)==0 then set(draw_cars_05_ref,0)
			elseif get(draw_cars_05_ref)>5 then
					set(draw_cars_05_ref,5)
			end
		elseif x>610 and x<787 and y>331 and y<360 then
			set(draw_vecs_03_ref,get(draw_vecs_03_ref)+value)
			if get(draw_vecs_03_ref)<=0 then
					set(draw_vecs_03_ref,0)
			elseif get(draw_vecs_03_ref)==0 then set(draw_vecs_03_ref,0)
			elseif get(draw_vecs_03_ref)>3 then
					set(draw_vecs_03_ref,3)
			end
		elseif x>610 and x<787 and y>301 and y<330 then
			set(draw_for_05_ref,get(draw_for_05_ref)+value)
			if get(draw_for_05_ref)<=0 then
					set(draw_for_05_ref,0)
			elseif get(draw_for_05_ref)==0 then set(draw_for_05_ref,0)
			elseif get(draw_for_05_ref)>5 then
					set(draw_for_05_ref,5)
			end
		elseif x>610 and x<787 and y>271 and y<300 then
			set(inn_ring_density_ref,get(inn_ring_density_ref)+value*0.05)
			if get(inn_ring_density_ref)<0 then
					set(inn_ring_density_ref,0)
			elseif get(inn_ring_density_ref)==0 then set(inn_ring_density_ref,0)
			elseif get(inn_ring_density_ref)>2 then
					set(inn_ring_density_ref,2)
			end
		elseif x>610 and x<787 and y>241 and y<270 then
			set(mid_ring_density_ref,get(mid_ring_density_ref)+value*0.05)
			if get(mid_ring_density_ref)<0 then
					set(mid_ring_density_ref,0)
			elseif get(mid_ring_density_ref)==0 then set(mid_ring_density_ref,0)
			elseif get(mid_ring_density_ref)>2 then
					set(mid_ring_density_ref,2)
			end
		elseif x>610 and x<787 and y>211 and y<240 then
			set(out_ring_density_ref,get(out_ring_density_ref)+value*0.05)
			if get(out_ring_density_ref)<0 then
					set(out_ring_density_ref,0)
			elseif get(out_ring_density_ref)==0 then set(out_ring_density_ref,0)
			elseif get(out_ring_density_ref)>2 then
					set(out_ring_density_ref,2)
			end
		elseif x>610 and x<787 and y>181 and y<210 then
			set(draw_detail_apt_03_ref,get(draw_detail_apt_03_ref)+value)
			if get(draw_detail_apt_03_ref)<0 then
					set(draw_detail_apt_03_ref,0)
			elseif get(draw_detail_apt_03_ref)==0 then set(draw_detail_apt_03_ref,0)
			elseif get(draw_detail_apt_03_ref)>3 then
					set(draw_detail_apt_03_ref,3)
			end
		end
	elseif get(selected_tab)==6 then
			if x>440 and x<500 and y>371 and y<394 then
				set(first_res_3d_ref,get(first_res_3d_ref)+value)
				if get(first_res_3d_ref)<0 then
						set(first_res_3d_ref,0)
				elseif get(first_res_3d_ref)==0 then set(first_res_3d_ref,0)
				elseif get(first_res_3d_ref)>30 then
						set(first_res_3d_ref,30)
				end
			elseif x>440 and x<500 and y>351 and y<370 then
				set(last_res_3d_ref,get(last_res_3d_ref)+value)
				if get(last_res_3d_ref)<0 then
						set(last_res_3d_ref,0)
				elseif get(last_res_3d_ref)==0 then set(last_res_3d_ref,0)
				elseif get(last_res_3d_ref)>30 then
						set(last_res_3d_ref,30)
				end
			elseif x>440 and x<500 and y>331 and y<350 then
				set(cloud_shadow_lighten_ratio_ref,get(cloud_shadow_lighten_ratio_ref)+value*0.01)
				if get(cloud_shadow_lighten_ratio_ref)<0 then
						set(cloud_shadow_lighten_ratio_ref,0)
				elseif get(cloud_shadow_lighten_ratio_ref)==0 then set(cloud_shadow_lighten_ratio_ref,0)
				elseif get(cloud_shadow_lighten_ratio_ref)>1.99 then
						set(cloud_shadow_lighten_ratio_ref,1.99)
				end
			elseif x>440 and x<500 and y>311 and y<330 then
				set(plot_radius_ref,get(plot_radius_ref)+value*0.01)
				if get(plot_radius_ref)<0 then
						set(plot_radius_ref,0)
				elseif get(plot_radius_ref)==0 then set(plot_radius_ref,0)
				elseif get(plot_radius_ref)>100 then
						set(plot_radius_ref,100)
				end
			elseif x>440 and x<500 and y>291 and y<310 then
				set(overdraw_control_ref,get(overdraw_control_ref)+value*0.01)
				if get(overdraw_control_ref)<0 then
						set(overdraw_control_ref,0)
				elseif get(overdraw_control_ref)==0 then set(overdraw_control_ref,0)
				elseif get(overdraw_control_ref)>100 then
						set(overdraw_control_ref,100)
				end 
			elseif x>440 and x<500 and y>271 and y<290 then
				set(ambient_gain_ref,get(ambient_gain_ref)+value*0.1)
				if get(ambient_gain_ref)<0 then
						set(ambient_gain_ref,0)
				elseif get(ambient_gain_ref)==0 then set(ambient_gain_ref,0)
				elseif get(ambient_gain_ref)>50 then
						set(ambient_gain_ref,50)
				end
			elseif x>440 and x<500 and y>251 and y<270 then
				set(diffuse_gain_ref,get(diffuse_gain_ref)+value*0.1)
				if get(diffuse_gain_ref)<0 then
						set(diffuse_gain_ref,0)
				elseif get(diffuse_gain_ref)==0 then set(diffuse_gain_ref,0)
				elseif get(diffuse_gain_ref)>50 then
						set(diffuse_gain_ref,50)
				end
			end
			if page_cloud==1 then
				if x>725 and x<787 and y>371 and y<394 then
					set(white_point_ref,get(white_point_ref)+value*0.1)
					if get(white_point_ref)<0 then
							set(white_point_ref,0)
					elseif get(white_point_ref)==0 then set(white_point_ref,0)
					elseif get(white_point_ref)>100 then
							set(white_point_ref,100)
					end
				elseif x>725 and x<787 and y>351 and y<370 then
					if get(ro_sett,1)==0 then
						set(atmo_scale_raleigh_ref,get(atmo_scale_raleigh_ref)+value*0.1)
						if get(atmo_scale_raleigh_ref)<0 then
								set(atmo_scale_raleigh_ref,0)
						elseif get(atmo_scale_raleigh_ref)==0 then set(atmo_scale_raleigh_ref,0)
						elseif get(atmo_scale_raleigh_ref)>100 then
								set(atmo_scale_raleigh_ref,100)
						end
					end
				elseif x>725 and x<787 and y>331 and y<350 then
					if get(ro_sett,1)==0 then
						set(inscatter_gain_raleigh_ref,get(inscatter_gain_raleigh_ref)+value*0.1)
						if get(inscatter_gain_raleigh_ref)<0 then
								set(inscatter_gain_raleigh_ref,0)
						elseif get(inscatter_gain_raleigh_ref)==0 then set(inscatter_gain_raleigh_ref,0)
						elseif get(inscatter_gain_raleigh_ref)>100 then
								set(inscatter_gain_raleigh_ref,100)
						end
					end
				elseif x>725 and x<787 and y>311 and y<330 then
					set(min_shadow_angle_ref,get(min_shadow_angle_ref)+value)
					if get(min_shadow_angle_ref)<-180 then
							set(min_shadow_angle_ref,-180)
					elseif get(min_shadow_angle_ref)>180 then
							set(min_shadow_angle_ref,180)
					end
				elseif x>725 and x<787 and y>291 and y<310 then
					set(max_shadow_angle_ref,get(max_shadow_angle_ref)+value)
					if get(max_shadow_angle_ref)<-180 then
							set(max_shadow_angle_ref,-180)
					elseif get(max_shadow_angle_ref)>180 then
							set(max_shadow_angle_ref,180)
					end
				elseif x>725 and x<787 and y>271 and y<290 then
					set(max_dsf_vis_ever_ref,get(max_dsf_vis_ever_ref)+value*100)
					if get(max_dsf_vis_ever_ref)<0 then
							set(max_dsf_vis_ever_ref,0)
					elseif get(max_dsf_vis_ever_ref)==0 then set(max_dsf_vis_ever_ref,0)
					elseif get(max_dsf_vis_ever_ref)>100000 then
							set(max_dsf_vis_ever_ref,100000)
					end
				elseif x>725 and x<787 and y>251 and y<270 then
					set(dsf_fade_ratio_ref,get(dsf_fade_ratio_ref)+value*0.01)
					if get(dsf_fade_ratio_ref)<0 then
							set(dsf_fade_ratio_ref,0)
					elseif get(dsf_fade_ratio_ref)==0 then set(dsf_fade_ratio_ref,0)
					elseif get(dsf_fade_ratio_ref)>0.99 then
							set(dsf_fade_ratio_ref,0.99)
					end
				elseif x>725 and x<787 and y>231 and y<250 then
					set(dsf_cutover_scale_ref,get(dsf_cutover_scale_ref)+value*0.01)
					if get(dsf_cutover_scale_ref)<0 then
							set(dsf_cutover_scale_ref,0)
					elseif get(dsf_cutover_scale_ref)==0 then set(dsf_cutover_scale_ref,0)
					elseif get(dsf_cutover_scale_ref)>2 then
							set(dsf_cutover_scale_ref,2)
					end
				elseif x>725 and x<787 and y>211 and y<230 then
					if get(ro_sett,1)==0 then
						set(min_tone_angle_ref,get(min_tone_angle_ref)+value)
						if get(min_tone_angle_ref)<-100 then
								set(min_tone_angle_ref,-100)
						elseif get(min_tone_angle_ref)>100 then
								set(min_tone_angle_ref,100)
						end
					end
				elseif x>725 and x<787 and y>191 and y<210 then
					if get(ro_sett,1)==0 then
						set(max_tone_angle_ref,get(max_tone_angle_ref)+value)
						if get(max_tone_angle_ref)<-100 then
								set(max_tone_angle_ref,-100)
						elseif get(max_tone_angle_ref)>100 then
								set(max_tone_angle_ref,100)
						end
					end
				elseif x>725 and x<787 and y>171 and y<190 then
					if get(ro_sett,1)==0 then
						set(tone_ratio_clean_ref,get(tone_ratio_clean_ref)+value*0.1)
						if get(tone_ratio_clean_ref)<-50 then
								set(tone_ratio_clean_ref,-50)
						elseif get(tone_ratio_clean_ref)>50 then
								set(tone_ratio_clean_ref,50)
						end
					end
				elseif x>725 and x<787 and y>151 and y<170 then
					if get(ro_sett,1)==0 then
						set(tone_ratio_foggy_ref,get(tone_ratio_foggy_ref)+value*0.1)
						if get(tone_ratio_foggy_ref)<-50 then
								set(tone_ratio_foggy_ref,-50)
						elseif get(tone_ratio_foggy_ref)>50 then
								set(tone_ratio_foggy_ref,50)
						end
					end
				elseif x>725 and x<787 and y>131 and y<150 then
					if get(ro_sett,1)==0 then
						set(tone_ratio_hazy_ref,get(tone_ratio_hazy_ref)+value*0.1)
						if get(tone_ratio_hazy_ref)<-50 then
								set(tone_ratio_hazy_ref,-50)
						elseif get(tone_ratio_hazy_ref)>50 then
								set(tone_ratio_hazy_ref,50)
						end
					end
				elseif x>725 and x<787 and y>111 and y<130 then
					if get(ro_sett,1)==0 then
						set(tone_ratio_snowy_ref,get(tone_ratio_snowy_ref)+value*0.1)
						if get(tone_ratio_snowy_ref)<-50 then
								set(tone_ratio_snowy_ref,-50)
						elseif get(tone_ratio_snowy_ref)>50 then
								set(tone_ratio_snowy_ref,50)
						end
					end
				elseif x>725 and x<787 and y>91 and y<110 then
					if get(ro_sett,1)==0 then
						set(tone_ratio_ocast_ref,get(tone_ratio_ocast_ref)+value*0.1)
						if get(tone_ratio_ocast_ref)<-50 then
								set(tone_ratio_ocast_ref,-50)
						elseif get(tone_ratio_ocast_ref)>50 then
								set(tone_ratio_ocast_ref,50)
						end
					end
				elseif x>725 and x<787 and y>71 and y<90 then
					if get(ro_sett,1)==0 then
						set(tone_ratio_strat_ref,get(tone_ratio_strat_ref)+value*0.1)
						if get(tone_ratio_strat_ref)<-50 then
								set(tone_ratio_strat_ref,-50)
						elseif get(tone_ratio_strat_ref)>50 then
								set(tone_ratio_strat_ref,50)
						end
					end
				end
			else
				if x>725 and x<787 and y>371 and y<394 then
					if get(ro_sett,1)==0 then
						set(tone_ratio_hialt_ref,get(tone_ratio_hialt_ref)+value*0.1)
						if get(tone_ratio_hialt_ref)<-50 then
								set(tone_ratio_hialt_ref,-50)
						elseif get(tone_ratio_hialt_ref)>50 then
								set(tone_ratio_hialt_ref,50)
						end
					end
				elseif x>725 and x<787 and y>351 and y<370 then
					if get(ro_sett,1)==0 then
						set(inscatter_gain_mie,get(inscatter_gain_mie)+value*0.1)
						if get(inscatter_gain_mie)<-50 then
								set(inscatter_gain_mie,-50)
						elseif get(inscatter_gain_mie)>50 then
								set(inscatter_gain_mie,50)
						end
					end
				elseif x>725 and x<787 and y>331 and y<350 then
					if get(ro_sett,1)==0 then
						set(scatter_raleigh_r,get(scatter_raleigh_r)+value)
						if get(scatter_raleigh_r)<0 then
								set(scatter_raleigh_r,0)
						elseif get(scatter_raleigh_r)==0 then set(scatter_raleigh_r,0)
						elseif get(scatter_raleigh_r)>255 then
								set(scatter_raleigh_r,255)
						end
					end
				elseif x>725 and x<787 and y>311 and y<330 then
					if get(ro_sett,1)==0 then
						set(scatter_raleigh_g,get(scatter_raleigh_g)+value)
						if get(scatter_raleigh_g)<0 then
								set(scatter_raleigh_g,0)
						elseif get(scatter_raleigh_g)==0 then set(scatter_raleigh_g,0)
						elseif get(scatter_raleigh_g)>255 then
								set(scatter_raleigh_g,255)
						end
					end
				elseif x>725 and x<787 and y>291 and y<310 then
					if get(ro_sett,1)==0 then
						set(scatter_raleigh_b,get(scatter_raleigh_b)+value)
						if get(scatter_raleigh_b)<0 then
								set(scatter_raleigh_b,0)
						elseif get(scatter_raleigh_b)==0 then set(scatter_raleigh_b,0)
						elseif get(scatter_raleigh_b)>255 then
								set(scatter_raleigh_b,255)
						end
					end
				elseif x>725 and x<787 and y>271 and y<290 then
					set(sky_gain,get(sky_gain)+value*0.1)
					if get(sky_gain)<0.1 then
							set(sky_gain,0.1)
					elseif get(sky_gain)==0.1 then set(sky_gain,0.1)
					elseif get(sky_gain)>100 then
							set(sky_gain,100)
					end
				end		
			end
	elseif get(selected_tab)==7 then
		if x>530 and x<590 and y>371 and y<394 then
			if get(ro_sett,1)==0 then
				set(visibility_reported_m_ref,get(visibility_reported_m_ref)+value*500)
				if get(visibility_reported_m_ref)<0 then
						set(visibility_reported_m_ref,0)
				elseif get(visibility_reported_m_ref)==0 then set(visibility_reported_m_ref,0)
				elseif get(visibility_reported_m_ref)>150000 then
						set(visibility_reported_m_ref,150000)
				end
			end
		elseif x>530 and x<590 and y>351 and y<370 then
			set(LOD_bias_rat_ref,get(LOD_bias_rat_ref)+value*0.01)
			if get(LOD_bias_rat_ref)<0 then
					set(LOD_bias_rat_ref,0)
			elseif get(LOD_bias_rat_ref)==0 then set(LOD_bias_rat_ref,0)
			elseif get(LOD_bias_rat_ref)>10 then
					set(LOD_bias_rat_ref,10)
			end
		elseif x>530 and x<590 and y>331 and y<350 then
			set(cars_lod_min_ref,get(cars_lod_min_ref)+value*500)
			if get(cars_lod_min_ref)<0 then
					set(cars_lod_min_ref,0)
			elseif get(cars_lod_min_ref)==0 then set(cars_lod_min_ref,0)
			elseif get(cars_lod_min_ref)>100000 then
					set(cars_lod_min_ref,100000)
			end
		elseif x>530 and x<590 and y>311 and y<330 then
			set(tile_lod_bias_ref,get(tile_lod_bias_ref)+value*0.01)
			if get(tile_lod_bias_ref)<0 then
					set(tile_lod_bias_ref,0)
			elseif get(tile_lod_bias_ref)==0 then set(tile_lod_bias_ref,0)
			elseif get(tile_lod_bias_ref)>1 then
					set(tile_lod_bias_ref,1)
			end
		elseif x>530 and x<590 and y>291 and y<310 then
			set(fade_start_rat_ref,get(fade_start_rat_ref)+value*0.01)
			if get(fade_start_rat_ref)<0 then
					set(fade_start_rat_ref,0)
			elseif get(fade_start_rat_ref)==0 then set(fade_start_rat_ref,0)
			elseif get(fade_start_rat_ref)>1 then
					set(fade_start_rat_ref,1)
			end
		elseif x>530 and x<590 and y>271 and y<290 then
			set(composite_far_dist_bias_ref,get(composite_far_dist_bias_ref)+value*0.01)
			if get(composite_far_dist_bias_ref)<0 then
					set(composite_far_dist_bias_ref,0)
			elseif get(composite_far_dist_bias_ref)==0 then set(composite_far_dist_bias_ref,0)
			elseif get(composite_far_dist_bias_ref)>1 then
					set(composite_far_dist_bias_ref,1)
			end
		elseif x>530 and x<590 and y>251 and y<270 then
			if get(ro_sett,1)==0 then
				set(fog_be_gone_ref,get(fog_be_gone_ref)+value*0.01)
				if get(fog_be_gone_ref)<0 then
						set(fog_be_gone_ref,0)
				elseif get(fog_be_gone_ref)==0 then set(fog_be_gone_ref,0)
				elseif get(fog_be_gone_ref)>1 then
						set(fog_be_gone_ref,1)
				end
			end
		elseif x>730 and x<787 and y>346 and y<365 then
			if get(ro_sett,1)==0 then
				set(scale_near_ref,get(scale_near_ref)+value*0.01)
				if get(scale_near_ref)<0 then
						set(scale_near_ref,0)
				elseif get(scale_near_ref)==0 then set(scale_near_ref,0)
				elseif get(scale_near_ref)>1 then
						set(scale_near_ref,1)
				end
			end
		elseif x>730 and x<787 and y>325 and y<344 then
			if get(ro_sett,1)==0 then
				set(scale_far_ref,get(scale_far_ref)+value*0.01)
				if get(scale_far_ref)<0 then
						set(scale_far_ref,0)
				elseif get(scale_far_ref)==0 then set(scale_far_ref,0)
				elseif get(scale_far_ref)>1 then
						set(scale_far_ref,1)
				end
			end
		elseif x>730 and x<787 and y>261 and y<280 then
			set(dist_near_ref,get(dist_near_ref)+value*100)
			if get(dist_near_ref)<0 then
					set(dist_near_ref,0)
			elseif get(dist_near_ref)==0 then set(dist_near_ref,0)
			elseif get(dist_near_ref)>50000 then
					set(dist_near_ref,50000)
			end
		elseif x>730 and x<787 and y>240 and y<260 then
			set(dist_far_ref,get(dist_far_ref)+value*100)
			if get(dist_far_ref)<0 then
					set(dist_far_ref,0)
			elseif get(dist_far_ref)==0 then set(dist_far_ref,0)
			elseif get(dist_far_ref)>50000 then
					set(dist_far_ref,50000)
			end
		elseif x>730 and x<787 and y>176 and y<195 then
			set(exponent_near_ref,get(exponent_near_ref)+value*0.01)
			if get(exponent_near_ref)<0 then
					set(exponent_near_ref,0)
			elseif get(exponent_near_ref)==0 then set(exponent_near_ref,0)
			elseif get(exponent_near_ref)>1 then
					set(exponent_near_ref,1)
			end
		elseif x>730 and x<787 and y>155 and y<175 then
			set(exponent_far_ref,get(exponent_far_ref)+value*0.01)
			if get(exponent_far_ref)<0 then
					set(exponent_far_ref,0)
			elseif get(exponent_far_ref)==0 then set(exponent_far_ref,0)
			elseif get(exponent_far_ref)>1 then
					set(exponent_far_ref,1)
			end
		elseif x>730 and x<787 and y>96 and y<115 then
			set(bloom_near_ref,get(bloom_near_ref)+value*100)
			if get(bloom_near_ref)<0 then
					set(bloom_near_ref,0)
			elseif get(bloom_near_ref)==0 then set(bloom_near_ref,0)
			elseif get(bloom_near_ref)>50000 then
					set(bloom_near_ref,50000)
			end
		elseif x>730 and x<787 and y>75 and y<95 then
			set(bloom_far_ref,get(bloom_far_ref)+value*100)
			if get(bloom_far_ref)<0 then
					set(bloom_far_ref,0)
			elseif get(bloom_far_ref)==0 then set(bloom_far_ref,0)
			elseif get(bloom_far_ref)>50000 then
					set(bloom_far_ref,50000)
			end
		end
	elseif get(selected_tab)==8 then
		if x>520 and x<565 and y>390 and y<405 then
			set(ro_sett,get(ro_sett,2)+value,2)
			if get(ro_sett,2)<0 then
				set(ro_sett,0,2)
			elseif get(ro_sett,2)>6 then
				set(ro_sett,6,2)
			end
			savesettings()
		elseif x>400 and x<450 and y>320 and y<335 then
			set(ro_sett,get(ro_sett,9)+value*0.05,9)
			if get(ro_sett,9)<0.1 then
				set(ro_sett,0.1,9)
			elseif get(ro_sett,9)>1 then
				set(ro_sett,1,9)
			end
			savesettings()
		elseif x>620 and x<650 and y>210 and y<225 then
			set(ro_sett,get(ro_sett,6)+value,6)
			if get(ro_sett,6)<5 then
				set(ro_sett,5,6)
			elseif get(ro_sett,6)>150 then
				set(ro_sett,1,150)
			end
			if get(ro_sett,6)>get(ro_sett,7) then
				set(ro_sett,get(ro_sett,6)+5,7)
			end
			savesettings()
		elseif x>620 and x<650 and y>190 and y<205 then
			set(ro_sett,get(ro_sett,7)+value,7)
			if get(ro_sett,7)<5 then
				set(ro_sett,5,7)
			elseif get(ro_sett,7)>150 then
				set(ro_sett,150,7)
			end
			if get(ro_sett,6)>get(ro_sett,7) then
				set(ro_sett,get(ro_sett,7)-5,6)
			end
			savesettings()
		elseif x>620 and x<650 and y>170 and y<185 then
			set(ro_sett,get(ro_sett,8)+value*50,8)
			if get(ro_sett,8)<50 then
				set(ro_sett,50,8)
			elseif get(ro_sett,8)>10000 then
				set(ro_sett,10000,8)
			end
			savesettings()
		elseif x>410 and x<470 and y>100 and y<115 then
			set(ro_sett,get(ro_sett,5)+value,5)
			if get(ro_sett,5)<1 then
				set(ro_sett,1,5)
			elseif get(ro_sett,5)>2 then
				set(ro_sett,2,5)
			end
			savesettings()
		elseif x>400 and x<450 and y>300 and y<315 then
			set(ro_sett,get(ro_sett,11)+value,11)
			if get(ro_sett,11)<0 then
				set(ro_sett,0,11)
			elseif get(ro_sett,11)>85 then
				set(ro_sett,85,11)
			end
			slidetab.position = {get(screen_width)-10, get(screen_height)*(get(ro_sett,11)/100), 110, 35}
			savesettings()
		end
	end
	return true
end
function onMouseDown ( component , x , y , button , parentX , parentY )
	if button == MB_LEFT then
		if x>15 and x<250 and y >390 and y <430 then
			set(selected_tab,1)
		elseif x>15 and x<250 and y > 350 and y < 390 then
			set(selected_tab,2)
		elseif x>15 and x<250 and y > 310 and y < 350 then
			set(selected_tab,3)
		elseif x>15 and x<250 and y > 270 and y < 310 then
			set(selected_tab,4)
		elseif x>15 and x<250 and y > 230 and y < 270 then
			set(selected_tab,5)
		elseif x>15 and x<250 and y > 190 and y < 230 then
			set(selected_tab,6)
		elseif x>15 and x<250 and y > 150 and y < 190 then
			set(selected_tab,7)
		elseif x>15 and x<250 and y > 110 and y < 150 then
			set(selected_tab,8)
		elseif x>145 and x<245 and y>60 and y<95 then
			sasl.commandOnce(openmainwindow)
		elseif x>22 and x<130 and y>60 and y<95 then
			if get(need_reload,1)==1 then
				set(need_reload,1,2)
			end
		end
		--Main logic for tabs
		if get(selected_tab)==1 then
			if x>270 and x<310 and y>398 and y<418 then
				if get(draw_deer_birds_ref)==0 then set(draw_deer_birds_ref,1) else set(draw_deer_birds_ref,0) end
			elseif x>270 and x<310 and y>368 and y<398 then
				if get(draw_fire_ball_ref)==0 then set(draw_fire_ball_ref,1) else set(draw_fire_ball_ref,0) end
			elseif x>270 and x<310 and y>338 and y<368 then
				if get(draw_boats_ref)==0 then set(draw_boats_ref,1) else set(draw_boats_ref,0) end
			elseif x>270 and x<310 and y>308 and y<338 then
				if get(ro_sett,1)==0 then
					if get(draw_aurora_ref)==0 then set(draw_aurora_ref,1) else set(draw_aurora_ref,0) end
				end
			elseif x>270 and x<310 and y>278 and y<308 then
				if get(draw_scattering_ref)==0 then set(draw_scattering_ref,1) else set(draw_scattering_ref,0) end
			elseif x>270 and x<310 and y>248 and y<278 then
				if get(draw_volume_fog01_ref)==0 then set(draw_volume_fog01_ref,1) else set(draw_volume_fog01_ref,0) end
			elseif x>270 and x<310 and y>218 and y<248 then
				if get(draw_per_pix_liting_ref)==0 then set(draw_per_pix_liting_ref,1) else set(draw_per_pix_liting_ref,0) end
			end    
		elseif get(selected_tab)==2 then
			if x>270 and x<310 and y>397 and y<418 then
				if get(use_reflective_water)==0 then set(use_reflective_water,1) else set(use_reflective_water,0) end
			elseif x>270 and x<310 and y>365 and y<396 then
				if get(draw_fft_water)==0 then set(draw_fft_water,1) else set(draw_fft_water,0) end
			end
		elseif get(selected_tab)==3 then
			if x>270 and x<310 and y>170 and y<195 then
				if get(scenery_shadows)==0 then set(scenery_shadows,1) else set(scenery_shadows,0) end
			elseif x>270 and x<310 and y>144 and y<165 then
				if get(disable_shadow_prep)==0 then set(disable_shadow_prep,1) else set(disable_shadow_prep,0) end
			end
		elseif get(selected_tab)==4 then
			if x>270 and x<310 and y>142 and y<164 then
				if get(extended_dsfs_ref)==0 then set(extended_dsfs_ref,1) else set(extended_dsfs_ref,0) end
			end
		elseif get(selected_tab)==5 then
			if x>270 and x<310 and y>398 and y<418 then
				if get(draw_HDR_ref)==0 then set(draw_HDR_ref,1) else set(draw_HDR_ref,0) end
			elseif x>270 and x<310 and y>368 and y<398 then
				if get(comp_texes_ref)==0 then set(comp_texes_ref,1) else set(comp_texes_ref,0) end
			elseif x>270 and x<310 and y>338 and y<368 then
				if get(use_bump_maps_ref)==0 then set(use_bump_maps_ref,1) else set(use_bump_maps_ref,0) end
			elseif x>270 and x<310 and y>308 and y<338 then
				if get(use_detail_textures_ref)==0 then set(use_detail_textures_ref,1) else set(use_detail_textures_ref,0) end
			elseif x>270 and x<310 and y>278 and y<308 then
				if get(ssao_enable_ref)==0 then set(ssao_enable_ref,1) else set(ssao_enable_ref,0) end
			end
		elseif get(selected_tab)==6 then
			if page_cloud==1 then
				if x>760 and x<780 and y>50 and y<70 then
					page_cloud=2
				end
			else
				if x>760 and x<780 and y>50 and y<70 then
					page_cloud=1
				end
			end
		elseif get(selected_tab)==8 then
			if x>330 and x<350 and y>365 and y<385 then
				savepreset(1)
				visib_blue[1]=1
			elseif x>360 and x<380 and y>365 and y<385 then
				savepreset(2)
				visib_blue[2]=1
			elseif x>390 and x<410 and y>365 and y<385 then
				savepreset(3)
				visib_blue[3]=1
			elseif x>420 and x<440 and y>365 and y<385 then
				savepreset(4)
				visib_blue[4]=1
			elseif x>450 and x<470 and y>365 and y<385 then
				savepreset(5)
				visib_blue[5]=1
			elseif x>480 and x<500 and y>365 and y<385 then
				savepreset(6)
				visib_blue[6]=1
			elseif x>330 and x<350 and y>340 and y<360 then
				load_preset(1)
				visib_blue[7]=1
			elseif x>360 and x<380 and y>340 and y<360 then
				load_preset(2)
				visib_blue[8]=1
			elseif x>390 and x<410 and y>340 and y<360 then
				load_preset(3)
				visib_blue[9]=1
			elseif x>420 and x<440 and y>340 and y<360 then
				load_preset(4)
				visib_blue[10]=1
			elseif x>450 and x<470 and y>340 and y<360 then
				load_preset(5)
				visib_blue[11]=1
			elseif x>480 and x<500 and y>340 and y<360 then
				load_preset(6)
				visib_blue[12]=1
			elseif x>270 and x<300 and y>280 and y<295 then
				if get(ro_sett,12)==0 then set(ro_sett,1,12) else set(ro_sett,0,12) end
				savesettings()
			elseif x>270 and x<300 and y>260 and y<275 then
				if get(ro_sett,3)==0 then set(ro_sett,1,3) else set(ro_sett,0,3) end
				savesettings()
			elseif x>570 and x<600 and y>260 and y<275 then
				if get(ro_sett,13)==0 then set(ro_sett,1,13) else set(ro_sett,0,13) end
				savesettings()
			elseif x>270 and x<300 and y>140 and y<155 then
				if get(ro_sett,4)==0 then set(ro_sett,1,4) else set(ro_sett,0,4) end
				savesettings()
			elseif x>270 and x<300 and y>120 and y<135 then
				if get(ro_sett,10)==0 then set(ro_sett,1,10) else set(ro_sett,0,10) end
				savesettings()
			end
		end
	end
end
