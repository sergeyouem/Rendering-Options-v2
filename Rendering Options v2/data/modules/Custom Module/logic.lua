window_height= globalPropertyi("sim/graphics/view/window_height")
window_width= globalPropertyi("sim/graphics/view/window_width")
wheight=get(window_height)
wwidth=get(window_width)
ro_sett=globalPropertyfa ( "pnv/ro/ro_sett", false )
wave_length=globalPropertyf("sim/weather/wave_length")
altitude=globalPropertyf(	"sim/flightmodel/position/elevation")
clouds_base_0=globalPropertyf("sim/weather/cloud_base_msl_m[0]")
clouds_base_1=globalPropertyf("sim/weather/cloud_base_msl_m[1]")
clouds_base_2=globalPropertyf("sim/weather/cloud_base_msl_m[2]")
clouds_top_0=globalPropertyf("sim/weather/cloud_tops_msl_m[0]")
clouds_top_1=globalPropertyf("sim/weather/cloud_tops_msl_m[1]")
clouds_top_2=globalPropertyf("sim/weather/cloud_tops_msl_m[2]")
clouds_type_0=globalPropertyi("sim/weather/cloud_type[0]")
clouds_type_1=globalPropertyi("sim/weather/cloud_type[1]")
clouds_type_2=globalPropertyi("sim/weather/cloud_type[2]")

id_env = sasl.findPluginBySignature("css.aero.xenviro")
id_env2 = sasl.findPluginBySignature("dark.space.xenviro")
if id_env~=-1 then
	env_active= globalPropertyi("env/active", true)
elseif id_env2~=-1 then
	env_active= globalPropertyi("env/active", true)
else
	env_active=0
end



ro_refs_values=globalPropertyfa ( "pnv/ro/ro_refs_values", false )
LOD_xp_paused= globalPropertyi("sim/time/paused")
LOD_xp_framerate=globalPropertyf("sim/operation/misc/frame_rate_period")   -- 1/frame_rate_period = FPS
need_reload=globalPropertyia ( "pnv/ro/need_reload", false )
reload_scenery = sasl.findCommand("sim/operation/reload_scenery")
StartTimerIDLogic = sasl.createTimer ()
sasl.startTimer(StartTimerIDLogic)
local ii=1
local load_at_start=0
reload_true_false={}
temp_data_to_reload={}
function readrefslogic()
	LOD_xp_aif_akt= globalPropertyi("sim/private/controls/reno/aniso_filter")
	LOD_xp_obf_akt=	globalPropertyf("sim/private/controls/tex/ortho_boost_factor")
	white_out_in_clouds=globalPropertyf("sim/private/controls/skyc/white_out_in_clouds")
	LOD_fsaa_x=	globalPropertyf("sim/private/controls/hdr/fsaa_ratio_x")
	LOD_fsaa_y=	globalPropertyf("sim/private/controls/hdr/fsaa_ratio_y")
	LOD_post_aa= globalPropertyf("sim/private/controls/hdr/use_post_aa")
	fft_amp1_ref=globalProperty("sim/private/controls/water/fft_amp1")
	fft_amp2_ref=globalProperty("sim/private/controls/water/fft_amp2")
	fft_amp3_ref=globalProperty("sim/private/controls/water/fft_amp3")
	fft_amp4_ref=globalProperty("sim/private/controls/water/fft_amp4")
	fft_scale1_ref=globalPropertyf("sim/private/controls/water/fft_scale1")
	fft_scale2_ref=globalPropertyf("sim/private/controls/water/fft_scale2")
	fft_scale3_ref=globalPropertyf("sim/private/controls/water/fft_scale3")
	fft_scale4_ref=globalPropertyf("sim/private/controls/water/fft_scale4")
	noise_speed_ref=globalPropertyf("sim/private/controls/water/noise_speed")
	LOD_bias_rat_ref=globalPropertyf("sim/private/controls/reno/LOD_bias_rat")
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
	scale_near_ref=globalPropertyf("sim/private/controls/lights/scale_near")
end

local LOD_fps_average = 0
local LOD_version = "Auto_LOD 1.3"
local LOD_akt_time = os.clock()
local count = 0
local grayhor=0
function assign_values()
	temp_data_to_reload[1]=get(draw_deer_birds_ref)
	temp_data_to_reload[2]=get(draw_fire_ball_ref)
	temp_data_to_reload[3]=get(draw_boats_ref)
	temp_data_to_reload[4]=get(draw_aurora_ref)
	temp_data_to_reload[5]=get(draw_scattering_ref)
	temp_data_to_reload[6]=get(draw_volume_fog01_ref)
	temp_data_to_reload[7]=get(draw_per_pix_liting_ref)
	temp_data_to_reload[8]=get(draw_objs_06_ref)
	temp_data_to_reload[9]=get(draw_vecs_03_ref)
	temp_data_to_reload[10]=get(draw_for_05_ref)
	temp_data_to_reload[11]=get(inn_ring_density_ref)
	temp_data_to_reload[12]=get(mid_ring_density_ref)
	temp_data_to_reload[13]=get(out_ring_density_ref)
	temp_data_to_reload[14]=get(draw_detail_apt_03_ref)
	temp_data_to_reload[15]=get(comp_texes_ref)
	temp_data_to_reload[16]=get(extended_dsfs_ref)
	temp_data_to_reload[17]=get(tile_lod_bias_ref)
	temp_data_to_reload[18]=get(composite_far_dist_bias_ref)
end

function check_need_reload(locvar, drf)
if locvar==drf then return true
else return false
end
end

function need_reload_func()
	reload_true_false[1]=check_need_reload(temp_data_to_reload[1], get(draw_deer_birds_ref))
	reload_true_false[2]=check_need_reload(temp_data_to_reload[2], get(draw_fire_ball_ref))
	reload_true_false[3]=check_need_reload(temp_data_to_reload[3], get(draw_boats_ref))
	reload_true_false[4]=check_need_reload(temp_data_to_reload[4], get(draw_aurora_ref))
	reload_true_false[5]=check_need_reload(temp_data_to_reload[5], get(draw_scattering_ref))
	reload_true_false[6]=check_need_reload(temp_data_to_reload[6], get(draw_volume_fog01_ref))
	reload_true_false[7]=check_need_reload(temp_data_to_reload[7], get(draw_per_pix_liting_ref))
	reload_true_false[8]=check_need_reload(temp_data_to_reload[8], get(draw_objs_06_ref))
	reload_true_false[9]=check_need_reload(temp_data_to_reload[9], get(draw_vecs_03_ref))
	reload_true_false[10]=check_need_reload(temp_data_to_reload[10], get(draw_for_05_ref))
	reload_true_false[11]=check_need_reload(temp_data_to_reload[11], get(inn_ring_density_ref))
	reload_true_false[12]=check_need_reload(temp_data_to_reload[12], get(mid_ring_density_ref))
	reload_true_false[13]=check_need_reload(temp_data_to_reload[13], get(out_ring_density_ref))
	reload_true_false[14]=check_need_reload(temp_data_to_reload[14], get(draw_detail_apt_03_ref))
	reload_true_false[15]=check_need_reload(temp_data_to_reload[15], get(comp_texes_ref))
	reload_true_false[16]=check_need_reload(temp_data_to_reload[16], get(extended_dsfs_ref))
	reload_true_false[17]=check_need_reload(temp_data_to_reload[17], get(tile_lod_bias_ref))
	reload_true_false[18]=check_need_reload(temp_data_to_reload[18], get(composite_far_dist_bias_ref))
	for iii = 1, 18, 1 do
		if reload_true_false[iii]==false then
			set(need_reload,1,1)
			break
		else
			set(need_reload,0,1)
		end
	
	end
end

function loading_preset_at_start(pr_num)
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
		set(draw_cars_05_ref,get(ro_refs_values,35))
		set(draw_HDR_ref,get(ro_refs_values,43))
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
		set(fade_start_rat_ref,get(ro_refs_values,81))
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
	if get(need_reload,2)==1 then
		assign_values()
		set(need_reload,0,2)
		set(need_reload,0,1)
		sasl.commandOnce(reload_scenery)
	end	
	if StartTimerIDLogic ~= 0 then
		timevarlogic = sasl.getElapsedSeconds(StartTimerIDLogic)
	end
	if timevarlogic>3 and load_at_start==0 and get(ro_sett,2)>0 then
		readrefslogic()
		assign_values()
		loading_preset_at_start(get(ro_sett,2))
		load_at_start=1
	elseif timevarlogic>3 and load_at_start==0 and get(ro_sett,2)==0 then
		readrefslogic()
		assign_values()
		load_at_start=1
	elseif timevarlogic>5 then					------LOADING TIMER
		sasl.stopTimer(StartTimerIDLogic)
		sasl.deleteTimer(StartTimerIDLogic)
		StartTimerIDLogic=0
		timevarlogic=0
	end
	if StartTimerIDLogic==0 then
		need_reload_func()
		if get(ro_sett,3) == 1 and get(LOD_xp_paused) == 0 then                                              -- do it only when in "auto"-mode
			if os.clock() > LOD_akt_time + (get(ro_sett,8)/1000) then                  -- check if wait-time is over
			  local akt_fps = 1/get(LOD_xp_framerate)
			  if akt_fps > get(ro_sett,7) then 
				set(LOD_bias_rat_ref, get(LOD_bias_rat_ref)-0.1)
			  end
			  if akt_fps < get(ro_sett,6) then 
				set(LOD_bias_rat_ref, get(LOD_bias_rat_ref)+0.1)
			  end
			  if LOD_fps_average > get(ro_sett,6) + 1 and akt_fps > get(ro_sett,6) then
				set(LOD_bias_rat_ref, get(LOD_bias_rat_ref) - ((LOD_fps_average - get(ro_sett,6)) / 200))
			  end
			  LOD_akt_time = os.clock()
			end
			if get(LOD_bias_rat_ref) > 9.9 then set(LOD_bias_rat_ref, 9.9) end
			if get(LOD_bias_rat_ref) < 0 then set(LOD_bias_rat_ref,0) end
			if get(LOD_xp_obf_akt) > 1.0 then set(LOD_xp_obf_akt, 1.0) end
			if get(LOD_xp_obf_akt) < 0 then set(LOD_xp_obf_akt, 0) end
		end
	  
	  
		if get(LOD_xp_paused) == 0 then 
			LOD_fps_average = ((LOD_fps_average * count) + (1/get(LOD_xp_framerate))) / (count + 1)
			count = count + 1
			if count > 5 then count = 5 end
		end
	  -----GrayHorizon
		if get(ro_sett,4) == 1 then
			if (get(altitude) > (get(clouds_base_0) - 50)) and (get(altitude) < get(clouds_top_0)) and (get(clouds_type_0) > 0)	then grayhor = 0
				
			elseif (get(altitude) > (get(clouds_base_1) - 50)) and (get(altitude) < get(clouds_top_1)) and (get(clouds_type_1) > 0)	then grayhor = 0
				
			elseif (get(altitude) > (get(clouds_base_2) - 50)) and (get(altitude) < get(clouds_top_2)) and (get(clouds_type_2) > 0)	then grayhor = 0
					
			else grayhor = 1
					
			end
			set(white_out_in_clouds, grayhor)
		end
		if get(env_active)==1 then set(ro_sett,1,1) elseif get(env_active)==0 then set(ro_sett,0,1) end
		if get(ro_sett,10)==1 then
			if get(wave_length) < 12 then
				set(fft_amp1_ref, 0.5)
				set(fft_amp2_ref, 1.0)
				set(fft_amp3_ref, 0.5)
				set(fft_amp4_ref, 0.5)
				set(fft_scale1_ref, 5)
				set(fft_scale2_ref, 1)
				set(fft_scale3_ref, 20)
				set(fft_scale4_ref, 128)
				set(noise_speed_ref,8.809999)
			elseif get(wave_length) >= 12 and get(wave_length) < 45 then
				set(fft_amp1_ref, 0.5)
				set(fft_amp2_ref, 1.0)
				set(fft_amp3_ref, 0.5)
				set(fft_amp4_ref, 1)
				set(fft_scale1_ref, 5)
				set(fft_scale2_ref, 2)
				set(fft_scale3_ref, 20)
				set(fft_scale4_ref, 64)
				set(noise_speed_ref,6.809999)
			else
				set(fft_amp1_ref, 0.5)
				set(fft_amp2_ref, 1.0)
				set(fft_amp3_ref, 0.5)
				set(fft_amp4_ref, 1)
				set(fft_scale1_ref, 5)
				set(fft_scale2_ref, 3)
				set(fft_scale3_ref, 20)
				set(fft_scale4_ref, 64)
				set(noise_speed_ref,3.809999)
			end
		end
	end
end	