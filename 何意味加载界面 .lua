local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if getgenv().LoadingGui then
    getgenv().LoadingGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoadingGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
pcall(function()
    if syn and syn.protect_gui then syn.protect_gui(ScreenGui) end
    ScreenGui.Parent = game:GetService("CoreGui")
end)
if not ScreenGui.Parent then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end
getgenv().LoadingGui = ScreenGui

local Overlay = Instance.new("Frame")
Overlay.Size = UDim2.fromScale(1, 1)
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Overlay.BackgroundTransparency = 0.3
Overlay.BorderSizePixel = 0
Overlay.Parent = ScreenGui
local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(350, 254)          
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(20, 90, 200)
MainStroke.Thickness = 1.2
MainStroke.Parent = Main
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 24)
Title.Position = UDim2.fromOffset(0, 10)
Title.BackgroundTransparency = 1
Title.Text = "加载制作版(窗)LibraryUI"
Title.TextColor3 = Color3.fromRGB(30, 110, 240)
Title.TextSize = 20
Title.Font = Enum.Font.Code
Title.Parent = Main
local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 14)
SubTitle.Position = UDim2.fromOffset(0, 34)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "正在加载脚本"
SubTitle.TextColor3 = Color3.fromRGB(160, 160, 160)
SubTitle.TextSize = 12
SubTitle.Font = Enum.Font.Code
SubTitle.Parent = Main
local SpinnerHolder = Instance.new("Frame")
SpinnerHolder.Size = UDim2.fromOffset(40, 40)
SpinnerHolder.Position = UDim2.new(0.5, 0, 0, 52)
SpinnerHolder.AnchorPoint = Vector2.new(0.5, 0)
SpinnerHolder.BackgroundTransparency = 1
SpinnerHolder.Parent = Main

local Spinner = Instance.new("ImageLabel")
Spinner.Size = UDim2.fromScale(1, 1)
Spinner.BackgroundTransparency = 1
Spinner.Image = "rbxassetid://4965945816"
Spinner.ImageColor3 = Color3.fromRGB(30, 110, 240)
Spinner.Parent = SpinnerHolder

local spinnerConn
spinnerConn = RunService.RenderStepped:Connect(function()
    if not Spinner or not Spinner.Parent then
        if spinnerConn then spinnerConn:Disconnect() end
        return
    end
    Spinner.Rotation = (tick() * 180) % 360
end)
local LoadingText = Instance.new("TextLabel")
LoadingText.Size = UDim2.new(1, 0, 0, 14)
LoadingText.Position = UDim2.fromOffset(0, 96)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "Loading... 0%"
LoadingText.TextColor3 = Color3.fromRGB(220, 220, 220)
LoadingText.TextSize = 12
LoadingText.Font = Enum.Font.Code
LoadingText.Parent = Main
local BarBg = Instance.new("Frame")
BarBg.Size = UDim2.new(1, -40, 0, 6)
BarBg.Position = UDim2.fromOffset(20, 116)
BarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
BarBg.BorderSizePixel = 0
BarBg.Parent = Main

local BarBgCorner = Instance.new("UICorner")
BarBgCorner.CornerRadius = UDim.new(1, 0)
BarBgCorner.Parent = BarBg

local BarFill = Instance.new("Frame")
BarFill.Size = UDim2.fromScale(0, 1)
BarFill.BackgroundColor3 = Color3.fromRGB(30, 110, 240)
BarFill.BorderSizePixel = 0
BarFill.Parent = BarBg

local BarFillCorner = Instance.new("UICorner")
BarFillCorner.CornerRadius = UDim.new(1, 0)
BarFillCorner.Parent = BarFill
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -40, 0, 1)
Divider.Position = UDim2.fromOffset(20, 140)
Divider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Divider.BorderSizePixel = 0
Divider.Parent = Main
local Tips = Instance.new("TextLabel")
Tips.Size = UDim2.new(1, -40, 0, 14)
Tips.Position = UDim2.fromOffset(20, 150)
Tips.BackgroundTransparency = 1
Tips.Text = "加载界面"
Tips.TextColor3 = Color3.fromRGB(90, 90, 90)
Tips.TextSize = 12
Tips.Font = Enum.Font.Code
Tips.TextXAlignment = Enum.TextXAlignment.Left
Tips.Parent = Main
local Discord = Instance.new("TextLabel")
Discord.Size = UDim2.new(1, 0, 0, 0)
Discord.Position = UDim2.fromOffset(0, 240)
Discord.BackgroundTransparency = 1
Discord.Text = "想做的脚本就进入1107181697群"
Discord.TextColor3 = Color3.fromRGB(20, 100, 150)
Discord.TextSize = 14
Discord.Font = Enum.Font.Code
Discord.Parent = Main
local PROGRESS_SPEED = 0.32

local progress = 0
local done = false

local progressConn
progressConn = RunService.Heartbeat:Connect(function(dt)
    if done then return end
    if not BarFill or not BarFill.Parent then
        if progressConn then progressConn:Disconnect() end
        return
    end

    progress = math.min(progress + dt * PROGRESS_SPEED, 1)

    BarFill.Size = UDim2.fromScale(progress, 1)
    LoadingText.Text = string.format("Loading... %d%%", math.floor(progress * 100))

    if progress >= 1 then
        done = true
        if progressConn then progressConn:Disconnect() end

        LoadingText.Text = "加载完毕"
        LoadingText.TextColor3 = Color3.fromRGB(0, 255, 120)

        task.wait(1.2)

        TweenService:Create(Main, TweenInfo.new(0.3), {
            BackgroundTransparency = 1,
        }):Play()
        TweenService:Create(MainStroke, TweenInfo.new(0.3), {
            Transparency = 1,
        }):Play()
        TweenService:Create(Overlay, TweenInfo.new(0.3), {
            BackgroundTransparency = 1,
        }):Play()

        for _, obj in ipairs(Main:GetDescendants()) do
            if obj:IsA("TextLabel") or obj:IsA("ImageLabel") then
                pcall(function()
                    TweenService:Create(obj, TweenInfo.new(0.25), {
                        TextTransparency = obj:IsA("TextLabel") and 1 or nil,
                        ImageTransparency = obj:IsA("ImageLabel") and 1 or nil,
                    }):Play()
                end)
            end
        end

        task.wait(1)
        if getgenv().LoadingGui then
            getgenv().LoadingGui:Destroy()
            getgenv().LoadingGui = nil
        end
    end
end)