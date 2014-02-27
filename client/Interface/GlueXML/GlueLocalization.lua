function Localize()
	-- Put all locale specific string adjustments here
	--SHOW_CONTEST_AGREEMENT = 1;

	ACCOUNT_NAME = "Nom de compte";
	PASSWORD = "Mot de passe";
	SAVE_ACCOUNT_NAME = "Se souvenir du nom de compte";
	LOGIN = "Connexion";
	COMMUNITY_SITE = "Site web";
	MANAGE_ACCOUNT = "Compte";
	DONATE = "Donations";
	VERSION_STRING = "World of Warcraft pour Aviana version 1.0.0 - 26 Février 2014";
	LOGIN_FAILED = "<html><body><p align=\"CENTER\">Impossible de se connecter.</p><p align=\"CENTER\">Veuillez réessayer ultérieurement.</p></body></html>";
	LOGIN_MALFORMED_ACCOUNT_NAME = "<html><body><p align=\"CENTER\">Les informations que vous avez tapées ne sont pas valides. Si vous avez besoin d'aide pour retrouver un mot de passe oublié ou volé, rendez-vous sur <a href=\"https://www.aviana-online.com/account.php\">aviana-online.com/account</a> pour plus d'informations.</p></body></html>";
	LOGIN_UNKNOWN_ACCOUNT = "<html><body><p align=\"CENTER\">Les informations que vous avez tapées ne sont pas valides. Si vous avez besoin d'aide pour retrouver un mot de passe oublié ou volé, rendez-vous sur <a href=\"https://www.aviana-online.com/account.php\">aviana-online.com/account</a> pour plus d'informations.</p></body></html>";
	LOGIN_BANNED = "<html><body><p align=\"CENTER\">Ce compte Aviana a été fermé et n'est plus en service.</p></body></html>";--Veuillez aller à l'adresse <a href=\"http://www.wow-europe.com/fr/misc/banned.html\">http://www.wow-europe.com/fr/misc/banned.html</a> pour obtenir de plus amples informations.
	LOGIN_SUSPENDED = "<html><body><p align=\"CENTER\">Ce compte Aviana a été temporairement suspendu.</p></body></html>";--Veuillez aller à l'adresse <a href=\"http://www.wow-europe.com/fr/misc/banned.html\">http://www.wow-europe.com/fr/misc/banned.html</a> pour obtenir de plus amples informations.

	-- Show termination of service without notice agreement
	SHOW_TERMINATION_WITHOUT_NOTICE_AGREEMENT = 1;
end

function LocalizeFrames()
	-- Put all locale specific UI adjustments here
	RealmWizardSuggest:SetWidth(235);
	RealmCharactersSort:SetWidth(RealmCharactersSort:GetWidth() + 8);
	RealmLoadSort:SetWidth(RealmLoadSort:GetWidth() - 8);
end
