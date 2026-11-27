repeat task.wait() until Drawing
local CG=game:GetService("CoreGui") local UI=game:GetService("UserInputService") local RS=game:GetService("RunService") local PL=game:GetService("Players") local CM=workspace.CurrentCamera local LP=PL.LocalPlayer
local S={Aimbot=false,FOV=150,ShowFOV=true,TeamCheck=false,WallCheck=false,AimbotLegit=false,LockButtons=false,RGB=false,Speed=false,SpeedValue=50,Fly=false,ESP_Enabled=false,ShowBox=false,ShowSkeleton=false,ShowHealthBar=false,ShowSnapLines=false,TracerTop=false,ShowName=false,ShowDistance=false,Glow=false,LineThickness=1,AimPart="Head",MenuColor=Color3.fromRGB(220,0,0)}
local DBG=Color3.fromRGB(15,15,15) local EBG=Color3.fromRGB(25,25,25)
local FOV=Drawing.new("Circle") FOV.Thickness=S.LineThickness FOV.NumSides=60 FOV.Radius=S.FOV FOV.Filled=false FOV.Transparency=0.5 FOV.Color=S.MenuColor FOV.Visible=false
local function C() if S.RGB then return Color3.fromHSV((tick()%5)/5,1,1) end return S.MenuColor end
local function GT()
    local cl,sd=nil,S.FOV local cn=Vector2.new(CM.ViewportSize.X/2,CM.ViewportSize.Y/2) local mh=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") if not mh then return nil end
    for _,p in pairs(PL:GetPlayers()) do if p~=LP and p.Character then
        local h=p.Character:FindFirstChild("Humanoid") local pt
        if S.AimPart=="Head" then pt=p.Character:FindFirstChild("Head") elseif S.AimPart=="Torso" then pt=p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("Torso") else pt=p.Character:FindFirstChild("LowerLeg") or p.Character:FindFirstChild("Right Leg") or p.Character:FindFirstChild("Left Leg") end
        local oh=p.Character:FindFirstChild("HumanoidRootPart")
        if S.TeamCheck and p.Team==LP.Team then continue end
        if h and h.Health>0 and pt and oh then local sp,on=CM:WorldToViewportPoint(pt.Position) if on then local d=(Vector2.new(sp.X,sp.Y)-cn).Magnitude if d<sd then
            if S.WallCheck then local rp=RaycastParams.new() rp.FilterDescendantsInstances={LP.Character} rp.FilterType=Enum.RaycastFilterType.Blacklist local hit=workspace:Raycast(CM.CFrame.Position,(pt.Position-CM.CFrame.Position).Unit*1000,rp) if hit and not hit.Instance:IsDescendantOf(p.Character) then continue end end
            cl=p sd=d
        end end end
    end end return cl
end
local function TP() local t=GT() if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then local m=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") if m then m.CFrame=t.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,3) end end end
local SG=Instance.new("ScreenGui") SG.Name="Uriel_Android" SG.Parent=CG SG.ResetOnSpawn=false
local M=Instance.new("Frame",SG) M.Size=UDim2.new(0,440,0,280) M.Position=UDim2.new(0.5,-220,0.5,-140) M.BackgroundColor3=DBG M.BorderSizePixel=0 local MS=Instance.new("UIStroke",M) MS.Color=S.MenuColor MS.Thickness=1
local T=Instance.new("Frame",M) T.Size=UDim2.new(1,0,0,25) T.BackgroundColor3=S.MenuColor T.BorderSizePixel=0 local TL=Instance.new("TextLabel",T) TL.Size=UDim2.new(1,-60,1,0) TL.Position=UDim2.new(0,25,0,0) TL.BackgroundTransparency=1 TL.Text="Uriel Xiter Android 1.108 X" TL.TextColor3=Color3.fromRGB(255,255,255) TL.Font=Enum.Font.GothamBold TL.TextSize=11 TL.TextXAlignment=Enum.TextXAlignment.Center
local CB=Instance.new("TextButton",T) CB.Size=UDim2.new(0,25,1,0) CB.Position=UDim2.new(1,-25,0,0) CB.BackgroundTransparency=1 CB.Text="X" CB.TextColor3=Color3.fromRGB(255,255,255) CB.Font=Enum.Font.GothamBold CB.TextSize=12
local TB=Instance.new("Frame",M) TB.Size=UDim2.new(1,-10,0,25) TB.Position=UDim2.new(0,5,0,30) TB.BackgroundTransparency=1
local function CT(x,w,y) local b=Instance.new("TextButton",TB) b.Size=UDim2.new(0,w,1,0) b.Position=UDim2.new(0,x,0,0) b.BackgroundColor3=S.MenuColor b.BorderSizePixel=0 b.Text=y b.TextColor3=Color3.fromRGB(255,255,255) b.Font=Enum.Font.GothamBold b.TextSize=10 return b end
local TA=CT(0,105,"⛓ Aimbot") local TE=CT(110,105,"👁 Esp") local TR=CT(220,105,"🚀 Rage") local TM=CT(330,105,"⚙ Misc")
local CN=Instance.new("ScrollingFrame",M) CN.Size=UDim2.new(1,0,1,-60) CN.Position=UDim2.new(0,0,0,60) CN.BackgroundTransparency=1 CN.BorderSizePixel=0 CN.ScrollBarThickness=4 CN.ScrollBarImageColor3=S.MenuColor CN.CanvasSize=UDim2.new(0,0,0,400)
local function CC(p,t,x,y,s,cb)
    local bg=Instance.new("TextButton",p) bg.Size=UDim2.new(0,190,0,20) bg.Position=UDim2.new(0,x,0,y) bg.BackgroundTransparency=1 bg.Text=""
    local b=Instance.new("Frame",bg) b.Size=UDim2.new(0,16,0,16) b.Position=UDim2.new(0,0,0.5,-8) b.BackgroundColor3=s and S.MenuColor or EBG b.BorderColor3=Color3.fromRGB(60,60,60) b.BorderSizePixel=1 Instance.new("UICorner",b).CornerRadius=UDim.new(0,2)
    local l=Instance.new("TextLabel",bg) l.Size=UDim2.new(1,-30,1,0) l.Position=UDim2.new(0,25,0,0) l.BackgroundTransparency=1 l.Text=t l.TextColor3=Color3.fromRGB(200,200,200) l.Font=Enum.Font.Gotham l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left
    local is=s bg.MouseButton1Click:Connect(function() is=not is b.BackgroundColor3=is and S.MenuColor or EBG if cb then cb(is) end end)
end
local function CS(p,y,x,w,cb)
    local bg=Instance.new("Frame",p) bg.Size=UDim2.new(0,w,0,20) bg.Position=UDim2.new(0,x,0,y) bg.BackgroundColor3=EBG bg.BorderSizePixel=0
    local f=Instance.new("Frame",bg) f.Size=UDim2.new(0,0,1,0) f.BackgroundColor3=S.MenuColor f.BorderSizePixel=0
    local t=Instance.new("TextLabel",bg) t.Size=UDim2.new(1,0,1,0) t.BackgroundTransparency=1 t.Text="0" t.TextColor3=Color3.fromRGB(255,255,255) t.Font=Enum.Font.GothamBold t.TextSize=10
    local b=Instance.new("TextButton",bg) b.Size=UDim2.new(1,0,1,0) b.BackgroundTransparency=1 b.Text="" local dr=false
    b.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dr=true end end)
    UI.InputChanged:Connect(function(i) if dr and (i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseMovement) then local pc=math.clamp((i.Position.X-bg.AbsolutePosition.X)/bg.AbsoluteSize.X,0,1) local v=math.floor(pc*100) t.Text=tostring(v) f.Size=UDim2.new(pc,0,1,0) cb(v) end end)
    UI.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.Touch or i.UserInputType==Enum.UserInputType.MouseButton1 then dr=false end end)
end
local function CD(p,t,x,y,opt,cb)
    local f=Instance.new("TextButton",p) f.Size=UDim2.new(0,140,0,20) f.Position=UDim2.new(0,x,0,y) f.BackgroundColor3=EBG f.BorderSizePixel=0 Instance.new("UICorner",f).CornerRadius=UDim.new(0,4)
    local l=Instance.new("TextLabel",f) l.Size=UDim2.new(1,-20,1,0) l.Position=UDim2.new(0,5,0,0) l.BackgroundTransparency=1 l.Text=opt[1] l.TextColor3=Color3.fromRGB(200,200,200) l.Font=Enum.Font.Gotham l.TextSize=11 l.TextXAlignment=Enum.TextXAlignment.Left
    local b=Instance.new("TextLabel",f) b.Size=UDim2.new(0,20,1,0) b.Position=UDim2.new(1,-20,0,0) b.BackgroundTransparency=1 b.Text="▼" b.TextColor3=Color3.fromRGB(200,200,200) b.TextSize=8
    local op=false local of=Instance.new("Frame",f) of.Size=UDim2.new(1,0,0,#opt*20) of.Position=UDim2.new(0,0,1,0) of.BackgroundColor3=EBG of.Visible=false
    for i,o in ipairs(opt) do local ob=Instance.new("TextButton",of) ob.Size=UDim2.new(1,0,0,20) ob.Position=UDim2.new(0,0,0,(i-1)*20) ob.BackgroundTransparency=1 ob.Text=o ob.TextColor3=Color3.fromRGB(200,200,200) ob.Font=Enum.Font.Gotham ob.TextSize=11 ob.MouseButton1Click:Connect(function() l.Text=o of.Visible=false op=false if cb then cb(o) end end) end
    f.MouseButton1Click:Connect(function() op=not op of.Visible=op end)
end
local function CCB(p,txt,col,x,y)
    local b=Instance.new("TextButton",p) b.Size=UDim2.new(0,60,0,20) b.Position=UDim2.new(0,x,0,y) b.BackgroundColor3=col b.Text=txt b.TextColor3=Color3.fromRGB(255,255,255) b.Font=Enum.Font.GothamBold b.TextSize=10 Instance.new("UICorner",b).CornerRadius=UDim.new(0,4)
    b.MouseButton1Click:Connect(function() S.MenuColor=col MS.Color=col T.BackgroundColor3=col CN.ScrollBarImageColor3=col TA.BackgroundColor3=col TE.BackgroundColor3=col TR.BackgroundColor3=col TM.BackgroundColor3=col FOV.Color=col end)
end
local PA=Instance.new("Frame",CN) PA.Size=UDim2.new(1,0,0,250) PA.BackgroundTransparency=1
local VLA=Instance.new("Frame",PA) VLA.Size=UDim2.new(0,1,1,-20) VLA.Position=UDim2.new(0.5,0,0,10) VLA.BackgroundColor3=S.MenuColor VLA.BorderSizePixel=0
local AT,BA=CC(PA,"Ativar Aimbot",10,5,false,function(s) S.Aimbot=s if not S.Aimbot then FOV.Visible=false elseif S.Aimbot and S.ShowFOV then FOV.Visible=true end end)
CC(PA,"Team Check",10,35,false,function(s) S.TeamCheck=s end)
CC(PA,"Wall Check",10,65,false,function(s) S.WallCheck=s end)
CC(PA,"Exibir FOV",10,95,true,function(s) S.ShowFOV=s if S.Aimbot and S.ShowFOV then FOV.Visible=true else FOV.Visible=false end end)
CS(PA,145,10,140,function(v) local rv=math.clamp(v*4,50,400) S.FOV=rv FOV.Radius=rv end)
CD(PA,"Aimbot Part",10,170,{"Cabeça","Peito","Pernas"},function(o) if o=="Cabeça" then S.AimPart="Head" elseif o=="Peito" then S.AimPart="Torso" else S.AimPart="Pernas" end end)
CC(PA,"Ativar Legit",230,35,false,function(s) S.AimbotLegit=s if s and S.Aimbot then S.Aimbot=false FOV.Visible=false end end)
local PE=Instance.new("Frame",CN) PE.Size=UDim2.new(1,0,0,300) PE.BackgroundTransparency=1 PE.Visible=false
local VLE=Instance.new("Frame",PE) VLE.Size=UDim2.new(0,1,1,-20) VLE.Position=UDim2.new(0.5,0,0,10) VLE.BackgroundColor3=S.MenuColor VLE.BorderSizePixel=0
CC(PE,"Ativar ESP",10,5,false,function(s) S.ESP_Enabled=s end)
CC(PE,"Show Box",10,35,false,function(s) S.ShowBox=s end)
CC(PE,"Show Skeleton",10,65,false,function(s) S.ShowSkeleton=s end)
CC(PE,"Show HealthBar",10,95,false,function(s) S.ShowHealthBar=s end)
CC(PE,"Show SnapLines",10,125,false,function(s) S.ShowSnapLines=s end)
CC(PE,"Tracer Cima",10,155,false,function(s) S.TracerTop=s end)
CC(PE,"Show Name",230,30,false,function(s) S.ShowName=s end)
CC(PE,"Show Distance",230,60,false,function(s) S.ShowDistance=s end)
CC(PE,"Glow",230,115,false,function(s) S.Glow=s end)
CC(PE,"RGB",230,145,false,function(s) S.RGB=s end)
local PR=Instance.new("Frame",CN) PR.Size=UDim2.new(1,0,0,250) PR.BackgroundTransparency=1 PR.Visible=false
CC(PR,"Speed",10,5,false,function(s) S.Speed=s if not s and LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=16 end end)
CS(PR,35,10,140,function(v) S.SpeedValue=math.clamp(v*2,16,200) end)
CC(PR,"Fly",10,75,false,function(s) S.Fly=s if s then loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-fly-v3-by-hibatzzz-243731"))() end end)
CC(PR,"Botao Flutuante TP",10,105,false,function(s) S.ShowTPButton=s if s then if not SG:FindFirstChild("TPFloat") then
    local b=Instance.new("TextButton",SG) b.Name="TPFloat" b.Size=UDim2.new(0,45,0,45) b.Position=UDim2.new(0,140,0.5,-22) b.BackgroundColor3=Color3.fromRGB(0,150,255) b.Text="TP" b.TextColor3=Color3.fromRGB(255,255,255) b.Font=Enum.Font.GothamBold b.TextSize=14 b.BorderSizePixel=0 b.Active=true Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
    local dr,st,ps=false,nil,nil b.InputBegan:Connect(function(i) if (i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch) and not S.LockButtons then dr=true st=i.Position ps=b.Position end end)
    UI.InputChanged:Connect(function(i) if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-st b.Position=UDim2.new(ps.X.Scale,ps.X.Offset+d.X,ps.Y.Scale,ps.Y.Offset+d.Y) end end)
    UI.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end)
    b.MouseButton1Click:Connect(TP)
end else local e=SG:FindFirstChild("TPFloat") if e then e:Destroy() end end end)
local PM=Instance.new("Frame",CN) PM.Size=UDim2.new(1,0,0,250) PM.BackgroundTransparency=1 PM.Visible=false
local FB=Instance.new("TextButton",SG) FB.Size=UDim2.new(0,45,0,45) FB.Position=UDim2.new(0,20,0.5,-22) FB.BackgroundColor3=S.MenuColor FB.Text="🥶" FB.TextColor3=Color3.fromRGB(255,255,255) FB.Font=Enum.Font.GothamBold FB.TextSize=20 FB.BorderSizePixel=0 FB.Visible=false Instance.new("UICorner",FB).CornerRadius=UDim.new(1,0)
CC(PM,"Botao Flutuante Aimbot",10,5,false,function(s) if s then if not SG:FindFirstChild("AimFloat") then
    local b=Instance.new("TextButton",SG) b.Name="AimFloat" b.Size=UDim2.new(0,45,0,45) b.Position=UDim2.new(0,80,0.5,-22) b.BackgroundColor3=S.MenuColor b.Text="🎯" b.TextColor3=Color3.fromRGB(255,255,255) b.Font=Enum.Font.GothamBold b.TextSize=20 b.BorderSizePixel=0 b.Active=true Instance.new("UICorner",b).CornerRadius=UDim.new(1,0)
    local dr,st,ps=false,nil,nil b.InputBegan:Connect(function(i) if (i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch) and not S.LockButtons then dr=true st=i.Position ps=b.Position end end)
    UI.InputChanged:Connect(function(i) if dr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-st b.Position=UDim2.new(ps.X.Scale,ps.X.Offset+d.X,ps.Y.Scale,ps.Y.Offset+d.Y) end end)
    UI.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then dr=false end end)
    b.MouseButton1Click:Connect(function() S.Aimbot=not S.Aimbot if not S.Aimbot then FOV.Visible=false elseif S.Aimbot and S.ShowFOV then FOV.Visible=true end b.BackgroundColor3=S.Aimbot and Color3.fromRGB(0,255,0) or S.MenuColor end)
end else local e=SG:FindFirstChild("AimFloat") if e then e:Destroy() end end end)
CC(PM,"Travar Botoes",10,25,false,function(s) S.LockButtons=s end)
local LT=Instance.new("TextLabel",PM) LT.Size=UDim2.new(0,100,0,20) LT.Position=UDim2.new(0,10,0,50) LT.BackgroundTransparency=1 LT.Text="Transparencia" LT.TextColor3=Color3.fromRGB(200,200,200) LT.Font=Enum.Font.Gotham LT.TextSize=11 LT.TextXAlignment=Enum.TextXAlignment.Left
CS(PM,70,10,160,function(v) local a=1-(v/100) FB.BackgroundTransparency=a FB.TextTransparency=a local b=SG:FindFirstChild("AimFloat") if b then b.BackgroundTransparency=a b.TextTransparency=a end local t=SG:FindFirstChild("TPFloat") if t then t.BackgroundTransparency=a t.TextTransparency=a end end)
local LT2=Instance.new("TextLabel",PM) LT2.Size=UDim2.new(0,100,0,20) LT2.Position=UDim2.new(0,10,0,95) LT2.BackgroundTransparency=1 LT2.Text="Grossura" LT2.TextColor3=Color3.fromRGB(200,200,200) LT2.Font=Enum.Font.Gotham LT2.TextSize=11 LT2.TextXAlignment=Enum.TextXAlignment.Left
CS(PM,115,10,160,function(v) local t=math.clamp(v/10,1,10) S.LineThickness=t FOV.Thickness=t end)
CCB(PM,"Roxo",Color3.fromRGB(150,0,200),10,150)
CCB(PM,"Rosa",Color3.fromRGB(255,105,180),80,150)
CCB(PM,"Vermelho",Color3.fromRGB(220,0,0),150,150)
CCB(PM,"Azul",Color3.fromRGB(0,150,255),10,175)
CCB(PM,"Verde",Color3.fromRGB(0,200,100),80,175)
TA.MouseButton1Click:Connect(function() PA.Visible=true PE.Visible=false PR.Visible=false PM.Visible=false end)
TE.MouseButton1Click:Connect(function() PA.Visible=false PE.Visible=true PR.Visible=false PM.Visible=false end)
TR.MouseButton1Click:Connect(function() PA.Visible=false PE.Visible=false PR.Visible=true PM.Visible=false end)
TM.MouseButton1Click:Connect(function() PA.Visible=false PE.Visible=false PR.Visible=false PM.Visible=true end)
CB.MouseButton1Click:Connect(function() M.Visible=false FB.Visible=true end)
FB.MouseButton1Click:Connect(function() M.Visible=true FB.Visible=false end)
local mdr,ms,mp=false,nil,nil T.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then mdr=true ms=i.Position mp=M.Position end end)
UI.InputChanged:Connect(function(i) if mdr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-ms M.Position=UDim2.new(mp.X.Scale,mp.X.Offset+d.X,mp.Y.Scale,mp.Y.Offset+d.Y) end end)
UI.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then mdr=false end end)
local fdr,fs,fp=false,nil,nil FB.InputBegan:Connect(function(i) if (i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch) and not S.LockButtons then fdr=true fs=i.Position fp=FB.Position end end)
UI.InputChanged:Connect(function(i) if fdr and (i.UserInputType==Enum.UserInputType.MouseMovement or i.UserInputType==Enum.UserInputType.Touch) then local d=i.Position-fs FB.Position=UDim2.new(fp.X.Scale,fp.X.Offset+d.X,fp.Y.Scale,fp.Y.Offset+d.Y) end end)
UI.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 or i.UserInputType==Enum.UserInputType.Touch then fdr=false end end)
UI.InputBegan:Connect(function(input, gameProcessed) if not gameProcessed then
    if input.KeyCode == Enum.KeyCode.DPadLeft then TP() end
end end)
local EO={} local function CE() for _,v in pairs(EO) do v:Remove() end EO={} end
RS.RenderStepped:Connect(function()
    local cc=C() FOV.Position=Vector2.new(CM.ViewportSize.X/2,CM.ViewportSize.Y/2) FOV.Color=cc
    if LP.Character then local h=LP.Character:FindFirstChild("Humanoid") if S.Speed and h then h.WalkSpeed=S.SpeedValue end end
    if S.Aimbot then local t=GT() if t and t.Character then local pt if S.AimPart=="Head" then pt=t.Character:FindFirstChild("Head") elseif S.AimPart=="Torso" then pt=t.Character:FindFirstChild("UpperTorso") or t.Character:FindFirstChild("Torso") else pt=t.Character:FindFirstChild("LowerLeg") or t.Character:FindFirstChild("Right Leg") or t.Character:FindFirstChild("Left Leg") end if pt then local cf=CFrame.lookAt(CM.CFrame.Position,pt.Position) local f=S.FOV>=400 and 1 or 0.5 CM.CFrame=CM.CFrame:Lerp(cf,f) end end end
    if S.AimbotLegit then local t=GT() if t and t.Character then local pt if S.AimPart=="Head" then pt=t.Character:FindFirstChild("Head") elseif S.AimPart=="Torso" then pt=t.Character:FindFirstChild("UpperTorso") or t.Character:FindFirstChild("Torso") else pt=t.Character:FindFirstChild("LowerLeg") or t.Character:FindFirstChild("Right Leg") or t.Character:FindFirstChild("Left Leg") end if pt then local cf=CFrame.lookAt(CM.CFrame.Position,pt.Position) CM.CFrame=CM.CFrame:Lerp(cf,0.05) end end end
    CE() if not S.ESP_Enabled then return end
    local mh=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") if not mh then return end
    for _,p in pairs(PL:GetPlayers()) do if p~=LP and p.Character then
        local h=p.Character:FindFirstChild("Humanoid") local hd=p.Character:FindFirstChild("Head") local rt=p.Character:FindFirstChild("HumanoidRootPart")
        if h and h.Health>0 and hd and rt then if S.TeamCheck and p.Team==LP.Team then continue end
            local ds=(mh.Position-rt.Position).Magnitude local tS,tO=CM:WorldToViewportPoint(hd.Position+Vector3.new(0,0.5,0)) local bS,bO=CM:WorldToViewportPoint(rt.Position-Vector3.new(0,3,0)) local hg=bS.Y-tS.Y
            if S.ShowBox and tO and bO and hg>5 then local b={} for i=1,4 do b[i]=Drawing.new("Line") b[i].Thickness=S.LineThickness b[i].Color=cc b[i].Visible=true end local w=hg/2 local x,y=tS.X-(w/2),tS.Y b[1].From=Vector2.new(x,y) b[1].To=Vector2.new(x+w,y) b[2].From=Vector2.new(x,y+hg) b[2].To=Vector2.new(x+w,y+hg) b[3].From=Vector2.new(x,y) b[3].To=Vector2.new(x,y+hg) b[4].From=Vector2.new(x+w,y) b[4].To=Vector2.new(x+w,y+hg) for _,l in pairs(b) do table.insert(EO,l) end end
            if S.ShowSnapLines and tO then local l=Drawing.new("Line") l.Thickness=S.LineThickness l.Color=cc l.Visible=true if S.TracerTop then l.From=Vector2.new(CM.ViewportSize.X/2,0) else l.From=Vector2.new(CM.ViewportSize.X/2,CM.ViewportSize.Y) end l.To=Vector2.new(tS.X,tS.Y) table.insert(EO,l) end
            if S.ShowHealthBar and tO and hg>5 then local l=Drawing.new("Line") l.Thickness=S.LineThickness+1 l.Color=Color3.fromRGB(0,255,0) l.Visible=true local w=hg/2 l.From=Vector2.new(tS.X-(w/2)-5,tS.Y) l.To=Vector2.new(tS.X-(w/2)-5,tS.Y+(hg*(h.Health/h.MaxHealth))) table.insert(EO,l) end
            if S.ShowName and tO then local n=Drawing.new("Text") n.Text=p.Name n.Size=14 n.Center=true n.Outline=true n.Color=cc n.Position=Vector2.new(tS.X,tS.Y-20) n.Visible=true table.insert(EO,n) end
            if S.ShowDistance and tO then local d=Drawing.new("Text") d.Text="["..math.floor(ds).."m]" d.Size=14 d.Center=true d.Outline=true d.Color=cc d.Position=Vector2.new(tS.X,tS.Y-35) d.Visible=true table.insert(EO,d) end
            if S.Glow then local hl=Instance.new("Highlight") hl.Parent=p.Character hl.FillTransparency=0.5 hl.OutlineTransparency=0 hl.FillColor=cc hl.OutlineColor=cc table.insert(EO,hl) end
            if S.ShowSkeleton then
                local la=p.Character:FindFirstChild("LeftUpperArm") or p.Character:FindFirstChild("Left Arm") local ra=p.Character:FindFirstChild("RightUpperArm") or p.Character:FindFirstChild("Right Arm") local ll=p.Character:FindFirstChild("LeftUpperLeg") or p.Character:FindFirstChild("Left Leg") local rl=p.Character:FindFirstChild("RightUpperLeg") or p.Character:FindFirstChild("Right Leg") local to=p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("Torso")
                if la and ra and ll and rl and to and hd then
                    local hS,hO=CM:WorldToViewportPoint(hd.Position) local tS2,tO2=CM:WorldToViewportPoint(to.Position) local a1,a1O=CM:WorldToViewportPoint(la.Position) local a2,a2O=CM:WorldToViewportPoint(ra.Position) local l1,l1O=CM:WorldToViewportPoint(ll.Position) local l2,l2O=CM:WorldToViewportPoint(rl.Position)
                    if hO and tO2 and a1O and a2O and l1O and l2O then local s={} for i=1,5 do s[i]=Drawing.new("Line") s[i].Thickness=S.LineThickness s[i].Color=cc s[i].Visible=true end s[1].From=Vector2.new(hS.X,hS.Y) s[1].To=Vector2.new(tS2.X,tS2.Y) s[2].From=Vector2.new(tS2.X,tS2.Y) s[2].To=Vector2.new(a1.X,a1.Y) s[3].From=Vector2.new(tS2.X,tS2.Y) s[3].To=Vector2.new(a2.X,a2.Y) s[4].From=Vector2.new(tS2.X,tS2.Y) s[4].To=Vector2.new(l1.X,l1.Y) s[5].From=Vector2.new(tS2.X,tS2.Y) s[5].To=Vector2.new(l2.X,l2.Y) for _,l in pairs(s) do table.insert(EO,l) end end
                end
            end
        end
    end end
end)
