local Point = game.Players.LocalPlayer.Character.HumanoidRootPart
local TweenService = game:GetService("TweenService")
local Virtual = game:GetService("VirtualInputManager")

local function Notify(Title,Desc)
        local CoreGui = game:GetService("CoreGui")
    local CorePackages = game:GetService("CorePackages")
    local UIBlox = getrenv().require(CorePackages.UIBlox)
    UIBlox.init()
    local StylePalette = getrenv().require(CorePackages.AppTempCommon.LuaApp.Style.StylePalette)
    local stylePalette = StylePalette.new()
    stylePalette:updateTheme("dark")
    stylePalette:updateFont("gotham")
    local Roact = getrenv().require(CorePackages.Roact)
    local Images = getrenv().require(CorePackages.Packages._Index.UIBlox.UIBlox.App.ImageSet.Images)
    local Gui =
        Roact.createElement(
        "ScreenGui",
        {IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Global},
        {
            Gui = Roact.createElement(
                UIBlox.Core.Style.Provider,
                {style = stylePalette},
                {
                    Toast = Roact.createElement(
                        UIBlox.App.Dialog.Toast,
                        {
                            toastContent = {
                                toastTitle = Title,
                                toastSubtitle = Desc,
                                iconImage = Images["icons/menu/trade"]
                            }
                        }
                    )
                }
            )
        }
    )
    Roact.mount(Gui, CoreGui, "InternalStuff")
end

local function Bypass()
    coroutine.wrap(Notify)("Teleporting...","Please wait. Do not move while the script teleports you to the desired position.")
    for i = 1, 6 do
        task.wait()
        game.Players.LocalPlayer.PlayerGui.PermanentGui.Notifications.Visible = false

        Virtual:SendKeyEvent(true, "One", false, game)
        task.wait(.2)
    end
    
    task.wait(2)
    game:GetService("CoreGui").InternalStuff:Destroy()
end



local function TeleportPlayer(player)
    coroutine.wrap(Bypass)()
    local Target = game.Players:FindFirstChild(player).Character.HumanoidRootPart.CFrame
    task.wait()
    TweenService:Create(Point, TweenInfo.new(.5, Enum.EasingStyle.Linear), {CFrame = Target}):Play()
    task.wait(.2)
    Point.Anchored = true
    Point.CFrame = CFrame.new(1,1,1)
    Point.CFrame = Target
    task.wait(.2)
    TweenService:Create(Point, TweenInfo.new(.5, Enum.EasingStyle.Linear), {CFrame = Target}):Play()
    task.wait()
    Point.CFrame = Target
    Point.Anchored = false
    coroutine.wrap(Unanchor)()
    task.wait()
    Point.CFrame = Target
    Point.Anchored = true
    task.wait()
    Point.CFrame = Target
    Point.Anchored = false
end

local function TeleportPos(pos)
    coroutine.wrap(Bypass)()
    local Target = pos
    task.wait()
    TweenService:Create(Point, TweenInfo.new(.5, Enum.EasingStyle.Linear), {CFrame = Target}):Play()
    task.wait(.2)
    Point.Anchored = true
    Point.CFrame = CFrame.new(1,1,1)
    Point.CFrame = Target
    task.wait(.2)
    TweenService:Create(Point, TweenInfo.new(.5, Enum.EasingStyle.Linear), {CFrame = Target}):Play()
     getgenv().Teleporting = false
    task.wait()
    Point.CFrame = Target
    Point.Anchored = false
    task.wait()
    Point.CFrame = Target
    Point.Anchored = true
    task.wait()
    Point.CFrame = Target
    Point.Anchored = false
end
