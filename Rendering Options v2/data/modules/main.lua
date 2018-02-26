size = { 2048, 2048 }

screen_height=globalPropertyi("sim/graphics/view/window_height",false)
screen_width=globalPropertyi("sim/graphics/view/window_width",false)
popupmain = sasl.createCommand ( "pnv/ro/popup" , "Popup main window" )
local coeff=1
local ii=1
selected_tab = createGlobalPropertyi("pnv/ro/selected_tab",1,false,false)
ro_sett=createGlobalPropertyfa ( "pnv/ro/ro_sett", {0,1,0,0,1,30,40,500,1,0,50,1,0,0,0,0,0,0,0,0} , false , false )----настройки 1-xEnviro enabled(0,1) , 2-load preset(0-6) , 3-autolod(0,1)
																							----4-gray horizon(0,1) , 5-language(1-x), 6-autolod min fps, 7-autolod max fps
																							----8-autolod timeout, 9-plugin visibility, 10-waterfix, 11-slider height(%), 12-slider visibility, 13-autolod fps show
																							---
ro_refs_values=createGlobalPropertyfa ( "pnv/ro/ro_refs_values", 150 , false , false )
need_reload=createGlobalPropertyia ( "pnv/ro/need_reload", {0,0,0} , false , false )  ---- 1-button on-off; 2-reload_func; 3-trigger to reload once at start
reload_scenery = sasl.findCommand("sim/operation/reload_scenery")
MainFont = sasl.gl.loadFont ( "fonts/DejaVuSans.ttf" )


function load_settings()
	settingsfilepath = moduleDirectory.."/settings and presets/settings.txt"
	settingsfile = io.open(settingsfilepath, "r")
	local lines = settingsfile:read("*a")
	
	for k, v in string.gmatch(lines, "(%w+)=([%d%p%-]+)") do
		set(ro_sett, tonumber(v), ii)
		ii=ii+1
		--print(k, v)
	end
	settingsfile:close()
	ii=1
end
function load_params()
	if get(ro_sett,2)>0 and get(need_reload,3)==0 then
		paramsfilepath = moduleDirectory.."/settings and presets/preset_"..get(ro_sett,2)..".txt"
		paramsfile = io.open(paramsfilepath, "r")
		existfile = isFileExists (paramsfilepath)
		if existfile then
			local lines = paramsfile:read("*a")
			for k, v in string.gmatch(lines, "([%w%s%(%-%)]+)=([%d%p%-]+)") do
				set(ro_refs_values, tonumber(v), ii)
				ii=ii+1
			end
			paramsfile:close()
			ii=1
			set(draw_deer_birds_ref,get(ro_refs_values,1))
			set(draw_fire_ball_ref,get(ro_refs_values,2))
			set(draw_boats_ref,get(ro_refs_values,3))
			set(draw_aurora_ref,get(ro_refs_values,4))
			set(draw_scattering_ref,get(ro_refs_values,5))
			set(draw_volume_fog01_ref,get(ro_refs_values,6))
			set(draw_per_pix_liting_ref,get(ro_refs_values,7))
			set(draw_objs_06_ref,get(ro_refs_values,34))
			set(draw_vecs_03_ref,get(ro_refs_values,36))
			set(draw_for_05_ref,get(ro_refs_values,37))
			set(inn_ring_density_ref,get(ro_refs_values,38))
			set(mid_ring_density_ref,get(ro_refs_values,39))
			set(out_ring_density_ref,get(ro_refs_values,40))
			set(draw_detail_apt_03_ref,get(ro_refs_values,41))
			set(extended_dsfs_ref,get(ro_refs_values,42))
			set(comp_texes_ref,get(ro_refs_values,44))
			set(tile_lod_bias_ref,get(ro_refs_values,80))
			set(composite_far_dist_bias_ref,get(ro_refs_values,82))
			if get(need_reload,3)==0 then
				set(need_reload,1,3)
				--sasl.commandOnce(reload_scenery)
				sasl.reloadScenery()
			end
		end
		set(need_reload,1,3)
	end
end
load_settings()

function onSceneryLoaded()
draw_deer_birds_ref=globalPropertyi("sim/private/controls/reno/draw_deer_birds")
draw_fire_ball_ref=globalPropertyi("sim/private/controls/reno/draw_fire_ball")
draw_boats_ref=globalPropertyi("sim/private/controls/reno/draw_boats")
draw_aurora_ref=globalPropertyi("sim/private/controls/reno/draw_aurora") ---------ENVIRO
draw_scattering_ref=globalPropertyi("sim/private/controls/reno/draw_scattering")
draw_volume_fog01_ref=globalPropertyi("sim/private/controls/reno/draw_volume_fog01")
draw_per_pix_liting_ref=globalPropertyi("sim/private/controls/reno/draw_per_pix_liting")
draw_objs_06_ref=globalPropertyi("sim/private/controls/reno/draw_objs_06")--
draw_vecs_03_ref=globalPropertyi("sim/private/controls/reno/draw_vecs_03")--
draw_for_05_ref=globalPropertyi("sim/private/controls/reno/draw_for_05")--
inn_ring_density_ref=globalPropertyf("sim/private/controls/forest/inn_ring_density")--
mid_ring_density_ref=globalPropertyf("sim/private/controls/forest/mid_ring_density")--
out_ring_density_ref=globalPropertyf("sim/private/controls/forest/out_ring_density")--
draw_detail_apt_03_ref=globalPropertyi("sim/private/controls/reno/draw_detail_apt_03")
extended_dsfs_ref=globalPropertyf("sim/private/controls/geoid/extended_dsfs")
comp_texes_ref=globalPropertyi("sim/private/controls/reno/comp_texes")				--to apply
tile_lod_bias_ref=globalPropertyf("sim/private/controls/ag/tile_lod_bias")
composite_far_dist_bias_ref=globalPropertyf("sim/private/controls/terrain/composite_far_dist_bias") 
load_params()


end

mainpanel = subpanel {

    position = { 0, 0, 800*coeff, 480*coeff };
    noBackground = true;
	visible=false;
	noClose = true;
	noMove = true;
	savePosition = true;
	pinnedToXWindow = {false,false};
	noResize = true;
    command = "pnv/ro/popup";
    description = "Toggle Main window";
	components = {
        interface {  position = { 0, 0, 800*coeff, 480*coeff } };
    };


};
slidetab = subpanel {

    position = {get(screen_width)-10, get(screen_height)*(get(ro_sett,11)/100), 110, 35 };
    noBackground = true;
	visible=true;
	noClose = true;
	noMove = true;
	savePosition = true;
	--pinnedToXWindow = {false,false};
	noResize = true;
	components = {
        starttab {  position = { 0, 0, 110, 35 } };
	};


};
autolodtab = subpanel {

    position = {get(screen_width), get(screen_height)*(get(ro_sett,11)/100)+45, 110, 35 };
    noBackground = true;
	visible=true;
	noClose = true;
	noMove = true;
	savePosition = true;
	--pinnedToXWindow = {false,false};
	noResize = true;
	components = {
        autolodtab {  position = { 0, 0, 110, 35 } };
	};


};

components = {
logic{}

}

