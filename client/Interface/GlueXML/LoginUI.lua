M = {}
function ModelOptions()
	if M[1]==nil then
	
	Mod1 = CreateFrame("Model"); Mod1:SetCamera(1); Mod1:SetLight(1,0,0,-0.5,-0.5,0.5,0.8,0.6,0.5,0.8,1.0,1.0,0.8); Mod1:SetPoint("CENTER",0,0); Mod1:SetFrameStrata("MEDIUM"); Mod1:SetFrameLevel(3);
	local x,y,z = Mod1:GetPosition(); Mod1:SetPosition(x-0,y-0,z-1); Mod1:SetWidth(10000); Mod1:SetHeight(6000); Mod1:SetFacing(Mod1:GetFacing()); Mod1:SetModelScale(Mod1:GetModelScale()); Mod1:SetAlpha(Mod1:GetAlpha());
	table.insert(M, Mod1);
	
	end
end

function PlayBackgroundModels()
-- Creature\Alexstrasza\ladyalexstrasa.m2
-- World\Generic\activedoodads\worldtreeportals\worldtreeportal01.m2
	--Mod1:SetModel("World\\Generic\\activedoodads\\worldtreeportals\\worldtreeportal01.m2"); 
	--Mod1:SetModel("Creature\\Tempscarletcrusaderheavy\\scarletcrusaderheavy.m2");
	--Mod1:SetModel("Creature\\Tempscarletcrusaderheavy\\scarletcrusaderheavy.m2");
end

function ShowScene(self)
	--self:SetModel(vx.SceneList[rnd]);
	--self:SetCamera(0);
	--self:SetSequence(0);
	ModelOptions();
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

	VX_MUSICTIMER = GetTime() + 161;
	VX_ONMUSIC = true;
	PlayMusic("Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3");
	--309 "Sound\\Music\\GlueScreenMusic\\valkyries.mp3"
	--161 "Sound\\Music\\GlueScreenMusic\\wow_main_theme.mp3"
	--309 "Sound\\Music\\GlueScreenMusic\\valkyries.mp3"
end

function StopLoginMusic()
	StopMusic();
	StopGlueMusic();
	VX_ONMUSIC = nil;
	VX_MUSICTIMER = nil;
end