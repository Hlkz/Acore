/*
 * Copyright (C) 2008-2014 TrinityCore <http://www.trinitycore.org/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

/* ScriptData
Name: arena_commandscript
%Complete: 100
Comment: All arena team related commands
Category: commandscripts
EndScriptData */

#include "ObjectMgr.h"
#include "Chat.h"
#include "Language.h"
#include "ArenaTeamMgr.h"
#include "Player.h"
#include "ScriptMgr.h"

class arena_commandscript : public CommandScript
{
public:
   arena_commandscript() : CommandScript("arena_commandscript") { }

    ChatCommand* GetCommands() const override
    {
           static ChatCommand commandTable[] =
           {
               { "arena",          SEC_PLAYER,          false, &HandleArenaCommand, "", NULL },
               { NULL,             0,                   false, NULL,                "", NULL }
           };
           return commandTable;
   }

       static bool HandleArenaCommand(ChatHandler* handler, const char* /*args*/)
       {
            BattlegroundTypeId bgTypeId = BATTLEGROUND_AA;
            handler->GetSession()->SendBattleGroundList(handler->GetSession()->GetPlayer()->GetGUID(), bgTypeId);
            return true;
       }
};

void AddSC_arena_commandscript()
{
   new arena_commandscript();
}
