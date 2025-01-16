local FeatherMenu =  exports['feather-menu'].initiate()

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

function OpenHuntMenu(location, trust)
    local discount = 0

    if Config.levelSystem.active then
        if trust >= Config.levelSystem.maxLevel then
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
            ['font-size'] = '0.94vw',
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
        end

        local cost = huntCfg.currency.amount
        if Config.levelSystem.active then
            if huntCfg.level > trust then
                goto END
            end
            cost = cost - discount
        end

        MainPage:RegisterElement('button', {
            label = huntCfg.name .. ' - ' .. tostring(cost) .. currencyType,
            slot = 'content',
            style = {
                ['color'] = '#E0E0E0'
            }
        }, function()
            if not InMission then
                local data = huntCfg
                data.id = hunt
                local isApproved = Core.Callback.TriggerAwait('bcc-legendaries:GetHuntApproval', data.id)
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
