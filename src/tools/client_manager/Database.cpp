#include "ClientManager.h"

void ClientSelector::NamesFromUnusedDatabase()
{
    TC_LOG_INFO("client.selector", "  Names from Unused Database");
    QueryResult result;

    if (mFlags & EXTRACT_DATABASE) //if (mFlags & EXTRACT_MODELS)
    {
        // CinematicCamera
        TC_LOG_INFO("client.selector", "    CinematicCamera");
        result = UnusedDatabase.Query("SELECT Filepath FROM cinematiccamera WHERE Filepath != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eMdx_M, fields[0].GetString());
        } while (result->NextRow());

        // GroundEffectDoodad
        TC_LOG_INFO("client.selector", "    GroundEffectDoodad");
        result = UnusedDatabase.Query("SELECT Model FROM groundeffectdoodad WHERE Model != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddFile(MdxGround, "World\\NoDXT\\Detail\\" + fields[0].GetString());
        } while (result->NextRow());

        // ItemVisualEffects
        TC_LOG_INFO("client.selector", "    ItemVisualEffects");
        result = UnusedDatabase.Query("SELECT Model FROM itemvisualeffects WHERE Model != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eMdx_M, fields[0].GetString());
        } while (result->NextRow());

        // LightSkyBox
        TC_LOG_INFO("client.selector", "    LightSkyBox");
        result = UnusedDatabase.Query("SELECT Model FROM lightskybox WHERE Model != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eMdx_M, fields[0].GetString());
        } while (result->NextRow());

        // SpellVisualEffectName
        TC_LOG_INFO("client.selector", "    SpellVisualEffectName");
        result = UnusedDatabase.Query("SELECT Model FROM spellvisualeffectname WHERE Model != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eMdx_M, fields[0].GetString());
        } while (result->NextRow());

        // SpellVisualKitAreaModel
        TC_LOG_INFO("client.selector", "    SpellVisualKitAreaModel");
        result = UnusedDatabase.Query("SELECT Name FROM spellvisualkitareamodel WHERE Name != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eMdx_M, fields[0].GetString());
        } while (result->NextRow());
    }

    if (mFlags & EXTRACT_DATABASE) //if (mFlags & EXTRACT_TEXTURES)
    {
        // FootprintTextures
        TC_LOG_INFO("client.selector", "    FootprintTextures");
        result = UnusedDatabase.Query("SELECT FileName FROM footprinttextures WHERE FileName != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eBlp_M, fields[0].GetString() + ".blp"); // path/name (.blp)
        } while (result->NextRow());

        // SpellChainEffects note: 3 records are single file names without path
        TC_LOG_INFO("client.selector", "    SpellChainEffects");
        result = UnusedDatabase.Query("SELECT Texture FROM spellchaineffects WHERE Texture != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eBlp_M, fields[0].GetString()); // path/name.blp/tga
        } while (result->NextRow());

        // SpellIcon
        TC_LOG_INFO("client.selector", "    SpellIcon");
        result = UnusedDatabase.Query("SELECT Name FROM spellicon WHERE Name != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eBlp, fields[0].GetString() + ".blp"); // path/name (.blp)
        } while (result->NextRow());

        // Weather
        TC_LOG_INFO("client.selector", "    Weather");
        result = UnusedDatabase.Query("SELECT Texture FROM weather WHERE Texture != ''");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eBlp_M, fields[0].GetString()); // path/name.blp
        } while (result->NextRow());
    }

    if (mFlags & EXTRACT_DATABASE) //if (mFlags & EXTRACT_MODELS || mFlags & EXTRACT_TEXTURES)
    {
        // GameobjectArtkit
        TC_LOG_INFO("client.selector", "    GameobjectArtkit");
        result = UnusedDatabase.Query("SELECT Texture1, Texture2, Texture3, Model1, Model2, Model3, Model4 FROM gameobjectartkit "
            "WHERE (NULLIF(Texture1, '') AND NULLIF(Texture2, '') AND NULLIF(Texture3, '') AND NULLIF(Model1, '') AND NULLIF(Model2, '') AND NULLIF(Model3, '') AND NULLIF(Model4, '')) IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            //if (mFlags & EXTRACT_TEXTURES)
            {
                if (strlen(fields[0].GetCString()))
                    AddExactFile(eBlp_M, fields[0].GetString());
                if (strlen(fields[1].GetCString()))
                    AddExactFile(eBlp_M, fields[1].GetString());
                if (strlen(fields[2].GetCString()))
                    AddExactFile(eBlp_M, fields[2].GetString());
            }
            //if (mFlags & EXTRACT_MODELS)
            {
                if (strlen(fields[3].GetCString()))
                    AddExactFile(eMdx_M, fields[3].GetString());
                if (strlen(fields[4].GetCString()))
                    AddExactFile(eMdx_M, fields[4].GetString());
                if (strlen(fields[5].GetCString()))
                    AddExactFile(eMdx_M, fields[5].GetString());
                if (strlen(fields[6].GetCString()))
                    AddExactFile(eMdx_M, fields[6].GetString());
            }
        } while (result->NextRow());

        if (!(mFlags & DONT_EXTRACT_ITEMS))
        {
            // ItemDisplayInfo
            TC_LOG_INFO("client.selector", "    ItemDisplayInfo");

            if (result = WorldDatabase.Query("SELECT DisplayId FROM item_template WHERE DisplayId != 0"))
                do {
                    Field* fields = result->Fetch();
                    if (fields[0].GetUInt32())
                        AddUInt(fields[0].GetUInt32(), ItemDisplayIds);
                } while (result->NextRow());

            for (std::vector<uint32>::const_iterator itr = ItemDisplayIds.begin(); itr != ItemDisplayIds.end(); ++itr)
            {
                std::stringstream query;
                query << "SELECT LeftModel, RightModel, LeftModelTexture, RightModelTexture, Icon1, Icon2, UpperArmTexture, LowerArmTexture, HandsTexture, "
                    "UpperTorsoTexture, LowerTorsoTexture, UpperLegTexture, LowerLegTexture, FootTexture FROM itemdisplayinfo WHERE Id = " << (*itr);
                if (result = UnusedDatabase.Query(query.str().c_str()))
                    do {
                        Field* fields = result->Fetch();
                        //if (mFlags & EXTRACT_MODELS)
                        {
                            if (strlen(fields[0].GetCString()))
                                AddFile(MdxItem, "Item\\ObjectComponents\\" + fields[0].GetString()); // name.mdx
                            if (strlen(fields[1].GetCString()))
                                AddFile(MdxItem, "Item\\ObjectComponents\\" + fields[1].GetString()); // name.mdx
                        }
                        //if (mFlags & EXTRACT_TEXTURES)
                        {
                            if (strlen(fields[2].GetCString())) AddFile(BlpItem, "Item\\ObjectComponents\\" + fields[2].GetString(), ".blp"); // name (blp)
                            if (strlen(fields[3].GetCString())) AddFile(BlpItem, "Item\\ObjectComponents\\" + fields[3].GetString(), ".blp"); // name (blp)
                            if (strlen(fields[4].GetCString())) AddExactFile(BlpIcon, "Interface\\Icons\\" + fields[4].GetString() + ".blp"); // name (blp)
                            if (strlen(fields[5].GetCString())) AddExactFile(BlpIcon, "Interface\\Icons\\" + fields[5].GetString() + ".blp"); // name (blp)
                            if (strlen(fields[6].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\ArmUpperTexture\\" + fields[6].GetString(), ".*\\.blp");        // name (blp)
                            if (strlen(fields[7].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\ArmLowerTexture\\" + fields[7].GetString(), ".*\\.blp");        // name (blp)
                            if (strlen(fields[8].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\HandTexture\\" + fields[8].GetString(), ".*\\.blp");            // name (blp)
                            if (strlen(fields[9].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\TorsoUpperTexture\\" + fields[9].GetString(), ".*\\.blp");      // name (blp)
                            if (strlen(fields[10].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\TorsoLowerTexture\\" + fields[10].GetString(), ".*\\.blp");    // name (blp)
                            if (strlen(fields[11].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\LegUpperTexture\\" + fields[11].GetString(), ".*\\.blp");      // name (blp)
                            if (strlen(fields[12].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\LegLowerTexture\\" + fields[12].GetString(), ".*\\.blp");      // name (blp)
                            if (strlen(fields[13].GetCString())) AddFile(BlpItem2, "Item\\TextureComponents\\FootTexture\\" + fields[13].GetString(), ".*\\.blp");          // name (blp)
                        }
                    } while (result->NextRow());
            }
        }
    }

    TC_LOG_INFO("client.selector", "");
}

void ClientSelector::NamesFromWorldDatabase()
{
    if (!(mFlags & EXTRACT_DATABASE) && !(mFlags & EXTRACT_SOUNDS))
        return;

    TC_LOG_INFO("client.selector", "  Names from World Database");
    QueryResult result;

    if (mFlags & EXTRACT_DATABASE) //if (mFlags & EXTRACT_MODELS || mFlags & EXTRACT_TEXTURES)
    {
        // CreatureModelData
        TC_LOG_INFO("client.selector", "    CreatureModelData");
        result = WorldDatabase.Query("SELECT Id, Model FROM creaturemodeldatadbc WHERE NULLIF(Model, '') IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            if (/*mFlags & EXTRACT_MODELS && */strlen(fields[1].GetCString()))
                AddExactFile(eMdx_M, fields[1].GetString());
            CreaModelData[fields[0].GetUInt32()] = Util::RemoveName(fields[1].GetString());
        } while (result->NextRow());
    }

    if (mFlags & EXTRACT_DATABASE || mFlags & EXTRACT_SOUNDS) //if (mFlags & EXTRACT_MODELS)
    {
        // GameObjectDisplayInfo
        TC_LOG_INFO("client.selector", "    GameObjectDisplayInfo");
        result = WorldDatabase.Query("SELECT FileName FROM gameobjectdisplayinfodbc WHERE NULLIF(FileName, '') IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eWmoMdx_M, fields[0].GetString());
        } while (result->NextRow());
    }

    if (mFlags & EXTRACT_DATABASE) //if(mFlags & EXTRACT_TEXTURES)
    {
        // CharSections
        TC_LOG_INFO("client.selector", "    CharSections");
        result = WorldDatabase.Query("SELECT Texture1, Texture2, Texture3 FROM charsectionsdbc WHERE (NULLIF(Texture1, '') AND NULLIF(Texture2, '') AND NULLIF(Texture3, '')) IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(eBlp_M, fields[0].GetString()); // path/name.blp
            if (strlen(fields[1].GetCString()))
                AddExactFile(eBlp_M, fields[1].GetString()); // path/name.blp
            if (strlen(fields[2].GetCString()))
                AddExactFile(eBlp_M, fields[2].GetString()); // path/name.blp
        } while (result->NextRow());

        // CreatureDisplayInfoExtra
        TC_LOG_INFO("client.selector", "    CreatureDisplayInfoExtra");
        result = WorldDatabase.Query("SELECT Texture FROM creaturedisplayinfoextradbc WHERE NULLIF(Texture, '') IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(BlpBaked, "Textures\\BakedNpcTextures\\" + fields[0].GetString());
        } while (result->NextRow());

        // CreatureFamily
        TC_LOG_INFO("client.selector", "    CreatureFamily");
        result = WorldDatabase.Query("SELECT IconFile FROM creaturefamilydbc WHERE NULLIF(IconFile, '') IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddExactFile(BlpIcon, fields[0].GetString() + ".blp"); // path/name (blp)
        } while (result->NextRow());

        // CreatureDisplayInfo (after CreatureModelData)
        TC_LOG_INFO("client.selector", "    CreatureDisplayInfo");
        if (result = WorldDatabase.Query("SELECT modelid1, modelid2, modelid3, modelid4 FROM creature_template"))
        {
            do {
                Field* fields = result->Fetch();
                if (fields[0].GetUInt32())
                    AddUInt(fields[0].GetUInt32(), CreatureDisplayIds);
                if (fields[1].GetUInt32())
                    AddUInt(fields[1].GetUInt32(), CreatureDisplayIds);
                if (fields[2].GetUInt32())
                    AddUInt(fields[2].GetUInt32(), CreatureDisplayIds);
                if (fields[3].GetUInt32())
                    AddUInt(fields[3].GetUInt32(), CreatureDisplayIds);
            } while (result->NextRow());

            for (std::vector<uint32>::const_iterator itr = CreatureDisplayIds.begin(); itr != CreatureDisplayIds.end(); ++itr)
            {
                std::stringstream query;
                query << "SELECT ModelId, Skin1, Skin2, Skin3, PortraitTextureName FROM creaturedisplayinfodbc WHERE Id = " << (*itr);
                if (result = WorldDatabase.Query(query.str().c_str()))
                    do {
                        Field* fields = result->Fetch();
                        if (strlen(fields[1].GetCString()))
                            AddExactFile(eBlp_M, CreaModelData[fields[0].GetUInt32()] + fields[1].GetString() + ".blp");
                        if (strlen(fields[2].GetCString()))
                            AddExactFile(eBlp_M, CreaModelData[fields[0].GetUInt32()] + fields[2].GetString() + ".blp");
                        if (strlen(fields[3].GetCString()))
                            AddExactFile(eBlp_M, CreaModelData[fields[0].GetUInt32()] + fields[3].GetString() + ".blp");
                        if (strlen(fields[4].GetCString()))
                            AddExactFile(BlpIcon, "Interface\\Icons" + fields[4].GetString() + ".blp");
                    } while (result->NextRow());
            }
        }

        // Holiday
        TC_LOG_INFO("client.selector", "    Holiday");
        result = WorldDatabase.Query("SELECT TextureFilename FROM holidaysdbc WHERE NULLIF(TextureFilename, '') IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            if (strlen(fields[0].GetCString()))
                AddFile(Blp_RL, "Interface\\Calendar\\Holidays" + fields[0].GetString(), ".*\\.blp"); // name.* (blp)
        } while (result->NextRow());

        // Vehicle
        TC_LOG_INFO("client.selector", "    Vehicle");
        result = WorldDatabase.Query("SELECT MSSLTrgtArcTexture, MSSLTrgtImpactTexture FROM vehicledbc WHERE (NULLIF(MSSLTrgtArcTexture, '') AND NULLIF(MSSLTrgtImpactTexture, '')) IS NOT NULL");
        do {
            Field* fields = result->Fetch();
            std::string ArcTexture = fields[0].GetString();
            if (ArcTexture.length())
                AddExactFile(eBlp, ArcTexture); // path/name.blp / tga
            std::string ImpactTexture = fields[1].GetString();
            if (ImpactTexture.length())
                AddExactFile(eBlp, ImpactTexture); // path/name.blp / tga
        } while (result->NextRow());
    }

    // LiquidType
    // Map
    // Movie
    // WorldMapOverlay
    TC_LOG_INFO("client.selector", "");
}

void ClientSelector::NamesOfSounds()
{
    if (!(mFlags & EXTRACT_SOUNDS))
        return;

    TC_LOG_INFO("client.selector", "  Names of Sounds\n");
    QueryResult result;
    std::vector<uint32> Ambiences, Musics, Intros;

    result = WorldDatabase.Query("SELECT SoundAmbience, ZoneMusic, ZoneIntroMusic FROM areatabledbc");
    do {
        Field* fields = result->Fetch();
        if (fields[0].GetUInt32())
            AddUInt(fields[0].GetUInt32(), Ambiences);
        if (fields[1].GetUInt32())
            AddUInt(fields[1].GetUInt32(), Musics);
        if (fields[2].GetUInt32())
            AddUInt(fields[2].GetUInt32(), Intros);
    } while (result->NextRow());

    for (std::vector<uint32>::const_iterator itr = WMOIds.begin(); itr != WMOIds.end(); ++itr)
    {
        std::stringstream query;
        query << "SELECT AmbienceId, ZoneMusic, IntroSound FROM wmoareatabledbc WHERE id = " << (*itr);
        if (result = WorldDatabase.Query(query.str().c_str()))
            do {
                Field* fields = result->Fetch();
                if (fields[0].GetUInt32())
                    AddUInt(fields[0].GetUInt32(), Ambiences);
                if (fields[1].GetUInt32())
                    AddUInt(fields[1].GetUInt32(), Musics);
                if (fields[2].GetUInt32())
                    AddUInt(fields[2].GetUInt32(), Intros);
            } while (result->NextRow());
    }

    for (std::vector<uint32>::const_iterator itr = Ambiences.begin(); itr != Ambiences.end(); ++itr)
    {
        std::stringstream query;
        query << "SELECT SoundDay, SoundNight FROM soundambience WHERE id = " << (*itr);
        if (result = UnusedDatabase.Query(query.str().c_str()))
            do {
                Field* fields = result->Fetch();
                if (fields[0].GetUInt32())
                    AddUInt(fields[0].GetUInt32(), SoundsToExtract);
                if (fields[1].GetUInt32())
                    AddUInt(fields[1].GetUInt32(), SoundsToExtract);
            } while (result->NextRow());
    }

    for (std::vector<uint32>::const_iterator itr = Musics.begin(); itr != Musics.end(); ++itr)
    {
        std::stringstream query;
        query << "SELECT DayMusic, NightMusic FROM zonemusic WHERE Id = " << (*itr);
        if (result = UnusedDatabase.Query(query.str().c_str()))
            do {
                Field* fields = result->Fetch();
                if (fields[0].GetUInt32())
                    AddUInt(fields[0].GetUInt32(), SoundsToExtract);
                if (fields[1].GetUInt32())
                    AddUInt(fields[1].GetUInt32(), SoundsToExtract);
            } while (result->NextRow());
    }

    for (std::vector<uint32>::const_iterator itr = Intros.begin(); itr != Intros.end(); ++itr)
    {
        std::stringstream query;
        query << "SELECT Sound FROM zoneintromusictable WHERE Id = " << (*itr);
        if (result = UnusedDatabase.Query(query.str().c_str()))
            do {
                Field* fields = result->Fetch();
                if (fields[0].GetUInt32())
                    AddUInt(fields[0].GetUInt32(), SoundsToExtract);
            } while (result->NextRow());
    }

    for (std::vector<uint32>::const_iterator itr = SoundsToExtract.begin(); itr != SoundsToExtract.end(); ++itr)
    {
        std::stringstream query;
        query << "SELECT FileName1, FileName2, FileName3, FileName4, FileName5, FileName6, FileName7, FileName8, FileName9, FileName10, Path FROM soundentriesdbc WHERE Id = " << (*itr);
        if (result = WorldDatabase.Query(query.str().c_str()))
            do {
                Field* fields = result->Fetch();
                std::string path = fields[10].GetString();
                if (!path.length())
                    continue;
                path += "\\"; // path/
                if (strlen(fields[0].GetCString()))
                    AddFile(Sounds, path + fields[0].GetString()); // name.wav
                if (strlen(fields[1].GetCString()))
                    AddFile(Sounds, path + fields[1].GetString()); // name.wav
                if (strlen(fields[2].GetCString()))
                    AddFile(Sounds, path + fields[2].GetString()); // name.wav
                if (strlen(fields[3].GetCString()))
                    AddFile(Sounds, path + fields[3].GetString()); // name.wav
                if (strlen(fields[4].GetCString()))
                    AddFile(Sounds, path + fields[4].GetString()); // name.wav
                if (strlen(fields[5].GetCString()))
                    AddFile(Sounds, path + fields[5].GetString()); // name.wav
                if (strlen(fields[6].GetCString()))
                    AddFile(Sounds, path + fields[6].GetString()); // name.wav
                if (strlen(fields[7].GetCString()))
                    AddFile(Sounds, path + fields[7].GetString()); // name.wav
                if (strlen(fields[8].GetCString()))
                    AddFile(Sounds, path + fields[8].GetString()); // name.wav
                if (strlen(fields[9].GetCString()))
                    AddFile(Sounds, path + fields[9].GetString()); // name.wav
            } while (result->NextRow());
    }

    // SoundEntries (without Ambiences and Musics)
    result = WorldDatabase.Query("SELECT FileName1, FileName2, FileName3, FileName4, FileName5, FileName6, FileName7, FileName8, FileName9, FileName10, Path "
        "FROM soundentriesdbc WHERE `Type` != 28 AND `Type` != 50 ");
    do {
        Field* fields = result->Fetch();
        std::string path = fields[10].GetString();
        if (!path.length())
            continue;
        path += "\\"; // path/
        if (strlen(fields[0].GetCString()))
            AddFile(Sounds, path + fields[0].GetString()); // name.wav
        if (strlen(fields[1].GetCString()))
            AddFile(Sounds, path + fields[1].GetString()); // name.wav
        if (strlen(fields[2].GetCString()))
            AddFile(Sounds, path + fields[2].GetString()); // name.wav
        if (strlen(fields[3].GetCString()))
            AddFile(Sounds, path + fields[3].GetString()); // name.wav
        if (strlen(fields[4].GetCString()))
            AddFile(Sounds, path + fields[4].GetString()); // name.wav
        if (strlen(fields[5].GetCString()))
            AddFile(Sounds, path + fields[5].GetString()); // name.wav
        if (strlen(fields[6].GetCString()))
            AddFile(Sounds, path + fields[6].GetString()); // name.wav
        if (strlen(fields[7].GetCString()))
            AddFile(Sounds, path + fields[7].GetString()); // name.wav
        if (strlen(fields[8].GetCString()))
            AddFile(Sounds, path + fields[8].GetString()); // name.wav
        if (strlen(fields[9].GetCString()))
            AddFile(Sounds, path + fields[9].GetString()); // name.wav
    } while (result->NextRow());
}
