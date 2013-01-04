# Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
  Custom/beast_master.cpp
  Custom/bienvenue.cpp
  Custom/news_serv.cpp
  Custom/job_master.cpp
  Custom/char_custom.cpp
  Custom/rand_item.cpp
  Custom/universal_teleporter.cpp
  Custom/class_master.cpp
  Custom/enchant_npc.cpp
  Custom/transmo.cpp
  Custom/kahz.cpp
  Custom/arenaspectator.cpp
)

message("  -> Prepared: Custom")
