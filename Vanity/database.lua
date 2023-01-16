local database = {}
local function add_staff(data)
    if data and type(data) == 'table' then 
        local reason = data.reason 
        local user = data.user 
        
        database[user] = {
            reason = reason,
            user = user,
        }
    end
end

add_staff({user = 'KitcheRules', reason = 'Moderation association (Friends with staff)'})
add_staff({user = 'CheaterClarifyEL', reason = 'Moderation association (Friends with staff)'})
add_staff({user = 'Trimti', reason = 'Staff member, not much known, unmarked account'})
add_staff({user = 'WarthogNation6', reason = 'Staff member, not much known, unmarked account'})
--[[
** Currently removed until they move their accounts out of the groups 
add_staff({user = 'alphaplayer91', reason = 'High ranking staff, quick to abuse his power. The SteffJonez of Vanity.'})
add_staff({user = 'SteveGuy477', reason = 'Highly active staff member, moderates a lot. Quick to ban, will ban for any reason.'})
add_staff({user = 'NoProfits', reason = 'Group holder for vanity'})
add_staff({user = 'VanityFPS', reason = 'Developer'})
add_staff({user = 'HiLzD', reason = 'Developer'})
add_staff({user = 'Logan52403', reason = 'CURRENT OWNER OF VANITY.'})
add_staff({user = 'RealKronikle', reason = 'Content creator, apparently has mod powers.'})
add_staff({user = 'TW_Dessi', reason = 'Content creator.'})
add_staff({user = 'SkuRBX', reason = 'Content creator.'})
add_staff({user = 'MercilessBanditTaken', reason = 'Content creator.'})
add_staff({user = 'Rblizzard2', reason = 'Content creator.'})
add_staff({user = 'lavalthelion101', reason = 'Content creator.'})
add_staff({user = 'ShxdowBlxck', reason = 'Content creator.'})
add_staff({user = 'NotRQRQ', reason = 'Content creator.'})
add_staff({user = 'kinwater', reason = 'Content creator.'})
add_staff({user = 'BTagent', reason = 'Content creator.'})
add_staff({user = 'NoloRave', reason = 'Developer'})
add_staff({user = 'MASTERKSKHA', reason = 'Developer'})
add_staff({user = 'Slightly_Vexed', reason = 'Developer'})
add_staff({user = 'Games_Incorporated', reason = 'Developer'})]]
return database
