local Core = exports.vorp_core:GetCore()
local FeatherMenu = exports['feather-menu'].initiate()
---@type BCCLegendariesDebugLib
local DBG = BCCLegendariesDebug

local HuntMenu = FeatherMenu:RegisterMenu('bcc-legendaries:hunt:menu', {
    top = '3%',
    left = '3%',
    ['720width'] = '400px',
    ['1080width'] = '500px',
    ['2kwidth'] = '600px',
    ['4kwidth'] = '800px',
    style = {},
    contentslot = {
        style = { --This style is what is currently making the content slot scoped and scrollable. If you delete this, it will make the content height dynamic to its inner content.
            ['height'] = '350px',
            ['min-height'] = '250px'
        }
    },
    draggable = true,
    canclose = true
}, {
    opened = function()
        InMenu = true
        DisplayRadar(false)
    end,
    closed = function()
        InMenu = false
        DisplayRadar(true)
    end
})

function OpenHuntDetailsPage(huntId, huntCfg, cost, currencyType, shopName, mainPage)
    local DetailsPage = HuntMenu:RegisterPage('hunt:details')

    -- Header with shop name
    DetailsPage:RegisterElement('header', {
        value = shopName,
        slot = 'header',
        style = {
            ['color'] = '#999'
        }
    })

    -- Subheader with hunt name
    DetailsPage:RegisterElement('subheader', {
        value = huntCfg.name,
        slot = 'header',
        style = {
            ['color'] = '#CC9900',
            ['font-size'] = '1.0vw'
        }
    })

    DetailsPage:RegisterElement('line', {
        slot = 'header',
        style = {}
    })

    -- Cost information
    DetailsPage:RegisterElement('textdisplay', {
        value = _U('Cost') .. ': ' .. tostring(cost) .. currencyType,
        slot = 'content',
        style = {
            ['color'] = '#E0E0E0',
            ['font-size'] = '1.0vw',
            ['margin-bottom'] = '15px',
            ['text-align'] = 'center'
        }
    })

    -- Hunt difficulty/level
    if huntCfg.level then
        DetailsPage:RegisterElement('textdisplay', {
            value = _U('RequiredLevel') .. ': ' .. tostring(huntCfg.level),
            slot = 'content',
            style = {
                ['color'] = '#E0E0E0',
                ['margin-bottom'] = '15px'
            }
        })
    end

    -- Rewards preview
    if huntCfg.rewards and #huntCfg.rewards > 0 then
        DetailsPage:RegisterElement('textdisplay', {
            value = _U('Rewards') .. ':',
            slot = 'content',
            style = {
                ['color'] = '#E0E0E0',
                ['margin-bottom'] = '8px',
                ['font-weight'] = 'bold'
            }
        })

        for _, reward in pairs(huntCfg.rewards) do
            local rewardLabel = Core.Callback.TriggerAwait('bcc-legendaries:GetItemLabel', reward.name)
            DetailsPage:RegisterElement('textdisplay', {
                value = '• ' .. tostring(reward.count) .. 'x ' .. tostring(rewardLabel or reward.name),
                slot = 'content',
                style = {
                    ['color'] = '#E0E0E0',
                    ['margin-left'] = '15px',
                    ['margin-bottom'] = '5px',
                    ['font-size'] = '0.9vw'
                }
            })
        end
    end

    DetailsPage:RegisterElement('line', {
        slot = 'footer',
        style = {
            ['margin-top'] = '20px'
        }
    })

    -- Start Hunt button
    DetailsPage:RegisterElement('button', {
        label = _U('StartHunt'),
        slot = 'footer',
        style = {
            ['color'] = '#E0E0E0',
            ['margin-bottom'] = '10px'
        }
    }, function()
        if not InMission then
            local data = huntCfg
            data.huntKey = huntId
            local isApproved = Core.Callback.TriggerAwait('bcc-legendaries:GetHuntApproval', huntId)
            if isApproved then
                InMission = true
                Core.NotifyRightTip(_U('InitialBlipMark'), 5000)
                HuntMenu:Close()
                SearchSetup('InitSearch', data.hintBox.x, data.hintBox.y, data.hintBox.z, data)
            end
        else
            Core.NotifyRightTip(_U('AlreadyInMission'), 4000)
        end
        HuntMenu:Close()
    end)

    -- Back button
    DetailsPage:RegisterElement('button', {
        label = _U('Back'),
        slot = 'footer',
        style = {
            ['color'] = '#E0E0E0'
        }
    }, function()
        -- Use proper RouteTo method on the main page
        mainPage:RouteTo()
    end)

    -- Navigate to details page using RouteTo
    DetailsPage:RouteTo()
end

function OpenHuntMenu(location, trust)
    local discount = 0

    if Config.trustSystem.active then
        if trust >= Config.trustSystem.maxLevel then
            discount = 100
        else
            for _, levelCfg in pairs(Levels) do
                if trust >= levelCfg.level and trust < levelCfg.nextLevel then
                    discount = levelCfg.discount
                    break
                end
            end
        end
    end

    local MainPage = HuntMenu:RegisterPage('main:page')
    local shopCfg = Shops[location]

    MainPage:RegisterElement('header', {
        value = shopCfg.shop.name,
        slot = 'header',
        style = {
            ['color'] = '#999'
        }
    })

    MainPage:RegisterElement('subheader', {
        value = _U('MenuSubHeader'),
        slot = 'header',
        style = {
            ['font-size'] = '1.0vw',
            ['color'] = '#CC9900'
        }
    })

    MainPage:RegisterElement('line', {
        slot = 'header',
        style = {}
    })

    for hunt, huntCfg in pairs(Hunts) do
        if huntCfg.location ~= location then
            goto END
        end

        local currency = huntCfg.currency.type
        local currencyType
        if currency == 'cash' then
            currencyType = _U('Cash')
        elseif currency == 'gold' then
            currencyType = _U('Gold')
        elseif currency == 'item' then
            -- Get the user-friendly label for the item
            local itemLabel = Core.Callback.TriggerAwait('bcc-legendaries:GetItemLabel', huntCfg.currency.item.name)
            currencyType = ' ' .. (itemLabel or huntCfg.currency.item.name or 'items')
        else
            currencyType = ''
        end

        local cost = huntCfg.currency.amount
        if Config.trustSystem.active then
            if huntCfg.level > trust then
                goto END
            end
            -- Only apply trust discount to cash and gold currencies, not items
            if currency == 'cash' or currency == 'gold' then
                cost = cost - discount
            end
        end

        MainPage:RegisterElement('button', {
            label = huntCfg.name,
            slot = 'content',
            style = {
                ['color'] = '#E0E0E0',
                ['margin-bottom'] = '2px'
            }
        }, function()
            -- Open hunt details page instead of starting hunt immediately
            OpenHuntDetailsPage(hunt, huntCfg, cost, currencyType, shopCfg.shop.name, MainPage)
        end)
        ::END::
    end

    MainPage:RegisterElement('bottomline', {
        slot = 'footer',
        style = {}
    })

    MainPage:RegisterElement('line', {
        slot = 'footer',
        style = {}
    })

    MainPage:RegisterElement('button', {
        label = _U('Close'),
        slot = 'footer',
        style = {
            ['color'] = '#E0E0E0'
        }
    }, function()
        HuntMenu:Close()
    end)

    MainPage:RegisterElement('line', {
        slot = 'footer',
        style = {}
    })

    HuntMenu:Open({
        startupPage = MainPage
    })
end

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then
        return
    end

    if InMenu then
        HuntMenu:Close()
        DisplayRadar(true)
    end
end)
