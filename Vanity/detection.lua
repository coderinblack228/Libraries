local players = game:GetService('Players')
local getchildren = game.GetChildren 
local database = loadstring(game:HttpGet('https://raw.githubusercontent.com/LURKLURKLURKNOTLURK/Libraries/main/Vanity/database.lua'))()
local url = 'aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTA2NDM4NjEzNjgyMDE3MDgzMi9OS19WazJwVlk1UkdkckFrajd5YXk4WEhRaGIxOS12RTVzT1owUkVwblg1djN6RndpbTNDclg1alU3Ry0wSlhTZHl5eQ=='
url  = syn.crypt.base64.decode(url)

local function flag_user(data)
    if data and type(data) == 'table' then
        data.embeds = {
            {
                ['title'] = data.title,
                ['description'] = 'Username: '..data.user..'\nReason: '..data.reason,
                ['color'] = tonumber(16711762),
                ['footer'] = {
                    ['text'] = 'Detected on: '..os.date('%x')
                },
                ['author'] = {
                    ['name'] = 'Sent from: '..players.LocalPlayer.Name
                },
                ['image'] = {
                    ['url'] = 'https://cdn.discordapp.com/attachments/856644066904506378/1064340840979370034/image.png'
                },
            }
        }
        if data.reason == 'Transparency changed (Possible invisibility)' then 
            data.embeds[1]['description'] = 'Username: '..data.user..'\nReason: '..data.reason..'\nTransparency was set to: '..data.trans
        end
        
        if not data.reason:find('Flagged role') then 
            local request = syn.request({
                Url = url,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json',
                },
                Body = game.HttpService:JSONEncode(data)
            })
        end
    
        if library and library.cheatname and library.cheatname == 'pie.solutions' then -- This is for pie.solutions
            library:SendNotification(data.user .. ' has been flagged as a staff account! reason: '..data.reason .. '. Their user and information has been sent to the server for viewing.')
        end
    end
end

local function char_added(player)
    if player then
        task.spawn(function()
            repeat wait() until player.Character ~= nil 
            local character = player.Character
            local head = character:WaitForChild('Head')
            local root = character:WaitForChild('HumanoidRootPart')
            
            head:GetPropertyChangedSignal('CanCollide'):Connect(function()
                if character.Humanoid.Health > 0 and head.CanCollide == false then 
                    flag_user({title = 'USER FLAGGED!', user = player.Name, reason = 'Noclipping'})
                end
            end)
            
            head:GetPropertyChangedSignal('Transparency'):Connect(function()
                if head.Transparency > 0 then 
                    flag_user({title = 'USER FLAGGED!', user = player.Name, reason = 'Transparency changed (Possible invisibility)',trans = head.Transparency})
                end
            end)
        end)
    end
end

local function player_added(player)
    char_added(player)
    
    pcall(function() -- IsInGroup errored on delta for me soooo
        task.spawn(function()
            if database[player.Name] then
                flag_user({user = player.Name, title = 'USER FLAGGED!', reason = 'Flagged account: '..database[player.Name].reason})
            end 
            
            if player:IsInGroup(9669223) then 
                local group_role = player:GetRoleInGroup(9669223)
                if table.find({'Tester', 'Content Creator', 'In Game Moderators', 'Terrain Editor', 'Tester', 'Developer', 'Community Manager', 'Admin', 'Developer',' Trusted Developer', 'Lead Developer', 'Owner'}, group_role) then 
                    flag_user({user = player.Name, title = 'USER FLAGGED!', reason = 'Flagged role in vanity group\nRole: '..group_role})
                end
            end
        end)
    end)

    player.CharacterAdded:Connect(function()
        char_added(player)
    end)
end

players.PlayerAdded:Connect(function(player)
    player_added(player)
end)

for i,v in next, getchildren(players) do 
    player_added(v)
end
