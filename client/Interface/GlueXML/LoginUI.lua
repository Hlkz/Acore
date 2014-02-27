
if Mod1==nil then
	Mod1 = CreateFrame("Model"); Mod1:SetCamera(0); Mod1:SetLight(1,0,0,-0.5,-0.5,0.5,0.8,0.6,0.5,0.8,1.0,1.0,0.8); Mod1:SetPoint("CENTER",0,0); Mod1:SetFrameStrata("MEDIUM"); Mod1:SetFrameLevel(3);
	local x,y,z = Mod1:GetPosition(); Mod1:SetPosition(x-12,y-4.67,z-3.45); Mod1:SetWidth(10000); Mod1:SetHeight(6000); Mod1:SetFacing(Mod1:GetFacing()); Mod1:SetModelScale(Mod1:GetModelScale()); Mod1:SetAlpha(Mod1:GetAlpha());
	Mod2 = CreateFrame("Model"); Mod2:SetCamera(0); Mod2:SetLight(1,0,0,-0.5,-0.5,0.5,0.8,0.6,0.5,0.8,1.0,1.0,0.8); Mod2:SetPoint("CENTER",0,0); Mod2:SetFrameStrata("MEDIUM"); Mod2:SetFrameLevel(3);
	local x,y,z = Mod2:GetPosition(); Mod2:SetPosition(x-12,y-9.95,z-2.9); Mod2:SetWidth(10000); Mod2:SetHeight(6000); Mod2:SetFacing(Mod2:GetFacing()-0.3); Mod2:SetModelScale(Mod2:GetModelScale()-0.38); Mod2:SetAlpha(Mod2:GetAlpha());
	BGL1 = CreateFrame("Model"); BGL1:SetCamera(0); BGL1:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); BGL1:SetPoint("CENTER",0,0); BGL1:SetFrameStrata("MEDIUM"); BGL1:SetFrameLevel(3);
	local x,y,z = BGL1:GetPosition(); BGL1:SetPosition(x-1.5,y+2.5,z); BGL1:SetWidth(10000); BGL1:SetHeight(6000); BGL1:SetFacing(BGL1:GetFacing()); BGL1:SetModelScale(BGL1:GetModelScale()); BGL1:SetAlpha(BGL1:GetAlpha());
	BGL2 = CreateFrame("Model"); BGL2:SetCamera(0); BGL2:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); BGL2:SetPoint("CENTER",0,0); BGL2:SetFrameStrata("MEDIUM"); BGL2:SetFrameLevel(3);
	local x,y,z = BGL2:GetPosition(); BGL2:SetPosition(x+4.3,y+5,z); BGL2:SetWidth(10000); BGL2:SetHeight(10000); BGL2:SetFacing(BGL2:GetFacing()); BGL2:SetModelScale(BGL2:GetModelScale()-0.4); BGL2:SetAlpha(BGL2:GetAlpha()/2);
	BGL3 = CreateFrame("Model"); BGL3:SetCamera(0); BGL3:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); BGL3:SetPoint("CENTER",0,0); BGL3:SetFrameStrata("MEDIUM"); BGL3:SetFrameLevel(3);
	local x,y,z = BGL3:GetPosition(); BGL3:SetPosition(x+4.3,y+4,z); BGL3:SetWidth(10000); BGL3:SetHeight(10000); BGL3:SetFacing(BGL3:GetFacing()); BGL3:SetModelScale(BGL3:GetModelScale()-0.4); BGL3:SetAlpha(BGL3:GetAlpha()/2);
	BGL4 = CreateFrame("Model"); BGL4:SetCamera(0); BGL4:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); BGL4:SetPoint("CENTER",0,0); BGL4:SetFrameStrata("MEDIUM"); BGL4:SetFrameLevel(3);
	local x,y,z = BGL4:GetPosition(); BGL4:SetPosition(x+5.5,y+4.5,z); BGL4:SetWidth(10000); BGL4:SetHeight(10000); BGL4:SetFacing(BGL4:GetFacing()); BGL4:SetModelScale(BGL4:GetModelScale()-0.2); BGL4:SetAlpha(BGL4:GetAlpha()/2.5);
	L1 = CreateFrame("Model"); L1:SetCamera(0); L1:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); L1:SetPoint("CENTER",0,0); L1:SetFrameStrata("MEDIUM"); L1:SetFrameLevel(3);
	local x,y,z = L1:GetPosition(); L1:SetPosition(x+1.6,y+3.35,z); L1:SetWidth(10000); L1:SetHeight(10000); L1:SetFacing(L1:GetFacing()); L1:SetModelScale(L1:GetModelScale()-0.85); L1:SetAlpha(L1:GetAlpha()/1.5);
	L2 = CreateFrame("Model"); L2:SetCamera(0); L2:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); L2:SetPoint("CENTER",0,0); L2:SetFrameStrata("MEDIUM"); L2:SetFrameLevel(3);
	local x,y,z = L2:GetPosition(); L2:SetPosition(x+5.12,y+3.45,z); L2:SetWidth(10000); L2:SetHeight(10000); L2:SetFacing(L2:GetFacing()); L2:SetModelScale(L2:GetModelScale()-0.9); L2:SetAlpha(L2:GetAlpha()/1.5);
	L3 = CreateFrame("Model"); L3:SetCamera(0); L3:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); L3:SetPoint("CENTER",0,0); L3:SetFrameStrata("MEDIUM"); L3:SetFrameLevel(3);
	local x,y,z = L3:GetPosition(); L3:SetPosition(x+5.4,y+3.7,z); L3:SetWidth(10000); L3:SetHeight(10000); L3:SetFacing(L3:GetFacing()); L3:SetModelScale(L3:GetModelScale()-0.9); L3:SetAlpha(L3:GetAlpha()/1.5);
	L4 = CreateFrame("Model"); L4:SetCamera(0); L4:SetLight(1,0,0,-0.5,-0.5,1.0,1.0,1.0,1.0,0.8,1.0,1.0,0.8); L4:SetPoint("CENTER",0,0); L4:SetFrameStrata("MEDIUM"); L4:SetFrameLevel(3);
	local x,y,z = L4:GetPosition(); L4:SetPosition(x+5.64,y+3.4,z); L4:SetWidth(10000); L4:SetHeight(10000); L4:SetFacing(L4:GetFacing()); L4:SetModelScale(L4:GetModelScale()-0.9); L4:SetAlpha(L4:GetAlpha()/1.5);
end

function PlayBackgroundModels()
	Mod1:SetModel("Creature\\Tempscarletcrusaderheavy\\scarletcrusaderheavy.m2");
	Mod2:SetModel("Creature\\Tempscarletcrusaderheavy\\scarletcrusaderheavy.m2");
	
	BGL1:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	BGL2:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	BGL3:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	BGL4:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	
	L1:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	L2:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	L3:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
	L4:SetModel("World\\Kalimdor\\silithus\\passivedoodads\\ahnqirajglow\\quirajglow.m2")
end

function ShowScene(self)
	--self:SetModel(vx.SceneList[rnd]);
	--self:SetCamera(0);
	--self:SetSequence(0);
	PlayBackgroundModels();
	PlayGlueAmbience("GlueScreenUndead", 4.0);
	PlayLoginMusic();
end

-- fade times
VX_FADE_LOAD = 2; -- time in seconds
VX_FADE_UNLOAD = 1; -- time in seconds
VX_FADE_REFRESH = 0.25; -- time in seconds

function PlayLoginMusic()
	if VX_ONMUSIC then return; end
	StopGlueMusic();

	VX_MUSICTIMER = GetTime() + 309;
	VX_ONMUSIC = true;
	PlayMusic("Sound\\Music\\GlueScreenMusic\\valkyries.mp3");
	--161 "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3"
	--309 "Sound\\Music\\GlueScreenMusic\\valkyries.mp3"
end

function StopLoginMusic()
	StopMusic();
	StopGlueMusic();
	VX_ONMUSIC = nil;
	VX_MUSICTIMER = nil;
end