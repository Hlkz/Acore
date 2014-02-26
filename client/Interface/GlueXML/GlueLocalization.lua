function Localize()
	-- Put all locale specific string adjustments here
	--SHOW_CONTEST_AGREEMENT = 1;

	-- Show termination of service without notice agreement
	SHOW_TERMINATION_WITHOUT_NOTICE_AGREEMENT = 1;
end

function LocalizeFrames()
	-- Put all locale specific UI adjustments here
	RealmWizardSuggest:SetWidth(235);
	RealmCharactersSort:SetWidth(RealmCharactersSort:GetWidth() + 8);
	RealmLoadSort:SetWidth(RealmLoadSort:GetWidth() - 8);
end
