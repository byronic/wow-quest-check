-- on successful run, print a loaded message
version = GetAddOnMetadata("QuestCheck", "Version");
print('\124cff00ffffQuestCheck\124cffc2c2c2 ' .. version .. ' loaded.');

-- I added this comment for the purposes of showing off git

-- Support for slash commands, which must be passed in a list starting at 1
SLASH_QUESTCHECK1, SLASH_QUESTCHECK2 = '/questcheck', '/qck';
function SlashCmdList.QUESTCHECK(msg, editbox)
  if tonumber(msg) ~= nil then
    arg = tonumber(msg);
    if arg then
      result = IsQuestFlaggedCompleted(arg);
      if result then
        print("That quest (id=" .. arg .. ")\124cff22ff22 was completed.");
      else
        print("That quest (id=" .. arg .. ")\124cffff0000 is not completed.");
      end
    else
      print("\124cffff0000[QUESTCHECK ERROR] (id=" .. arg .. ") is not a valid quest id.");
    end
  else
    print('Usage: /questcheck [quest ID number]');
    print('  COMING SOON: /questcheck [quest name]');
  end
end

-- /run print("_ QCheck!  _") local t={["Fate of the Guard"]=40883,["Blood and Wine"]=44052} for quest,id in pairs(t) do print(quest,IsQuestFlaggedCompleted(id) and "is\124cff22ff22" or "is \124cffff0000not","completed.") end
