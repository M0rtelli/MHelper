local res, imgui = pcall(require, 'imgui')
assert(res, 'not found imgui')
local key = require 'vkeys'
local vkeys = require 'vkeys'
local effil = require"effil"
local cjson = require"cjson"
local sampev = require 'lib.samp.events'
local main_window_state = imgui.ImBool(false)
imgui.ToggleButton = require('imgui_addons').ToggleButton
imgui.HotKey = require('imgui_addons').HotKey
local hk = require 'lib.imcustom.hotkey'
local sec_window_state = imgui.ImBool(false)
local main_menu = imgui.ImBool(false)
local gps1 = imgui.ImBool(false)
local itogip = ''
local gps2 = imgui.ImBool(false)
local gps3 = imgui.ImBool(false)
local gps4 = imgui.ImBool(false)
local gps5 = imgui.ImBool(false)
local gps6 = imgui.ImBool(false)
local gps7 = imgui.ImBool(false)
local color = imgui.ImFloat4(0.26, 0.59, 0.98, 0.40)
local colorfon = imgui.ImFloat4(0.06, 0.06, 0.06, 0.94)
local colorname = imgui.ImFloat4(0.04, 0.04, 0.04, 1.00)
local lvla = imgui.ImBool(false)
local ipcheck = imgui.ImBool(false)
local test8 = imgui.ImBool(false)
local gps8 = imgui.ImBool(false)
local sppo = imgui.ImBool(false)
local mh = imgui.ImBool(false)
local sosi = imgui.ImBool(false)
local wh = imgui.ImBool(false)
local gm = imgui.ImBool(false)
local nofall = imgui.ImBool(false)
local add_zone = imgui.ImBool(false)
local air = imgui.ImBool(false)
local panel = imgui.ImBool(true)
local zm = imgui.ImBool(true)
local lvlspec = imgui.ImBuffer(256)
local povs = imgui.ImBool(false)
local emenu = imgui.ImBool(true)
local cheats = imgui.ImBool(false)
local cum1 = imgui.ImBool(false)
local tforms = imgui.ImBool(true)
local srep = imgui.ImBool(true)
local fixrec = imgui.ImBool(true)
local slave = imgui.ImBool(false)
local help = imgui.ImBool(false)
local amenu = imgui.ImBool(false)
local fag = 0
local cnick = ''

local inicfg = require 'inicfg'
local ccd = ''
local ffi = require "ffi"
local getBonePosition = ffi.cast("int (__thiscall*)(void*, float*, int, bool)", 0x5E4280)
Enable = false
local first = 'dada'
local encoding = require "encoding" --� ����������
encoding.default = 'CP1251'
u8 = encoding.UTF8 
local mem = require "memory"
local fa = require 'faIcons'
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
script_name('HELPER BY DEXTER MARTELLI')
script_version('3.6')
require"lib.moonloader"
require"lib.sampfuncs"
local Matrix3X3 = require "matrix3x3"
local Vector3D = require "vector3d"
local render = require 'lib.render'
local rkeys = require 'rkeys'
imgui.HotKey = require('imgui_addons').HotKey

--- Config
local settings = {}
local adminList = {}
keyToggle = VK_MBUTTON
keyApply = VK_LBUTTON
local rdata = {}
local distances = 0
forms = {u8'/warn','/ban','/jail','/fv','/get','/offget','/ipaccounts','/skick','/sethp','/skin','/unwarn','/banip','/unjail','/offban','/offwarn','/spcar','/sban','/offjail','/offmute','/spcarid','/oad','/spawn'}
local conf = {
    DialogID = {
    	DID = 579
    },
	settings = {
		forms = true,
		rephelp = true,
		fastm = true,
		emenu = true,
		fixrec = true,
		sobeit = true
	},
	az = {
		["AZ #1"] = "2570,-1281,1065, INT: 2",
		["AZ #2"] = "1221, 8, 1001, INT: 2"
	}, 
	style = {
		rbutton = 0.26,
		gbutton = 0.59,
		bbutton = 0.98,
		abutton = 0.40,
		rfon = 0.06,
		gfon = 0.06,
		bfon = 0.06,
		afon = 0.94,
		rname = 0.04,
		gname = 0.04,
		bname = 0.04,
		aname = 1.00,
		theme = 0
	},
	amenu = {
		lvladm = 0,
		password = '',
		skin = 0,
		auth = false,
		inter = 0,
		templeader = 0,
		achat = 0, 
		fixtp = true,
		prefix = 0,
		admpass = '',
		admauth = false,
		gm = false,
		aprefix = true,
		clickwarp = false,
		admrend = true
	},
	hotkey = {
		bind1 =  "[18,82]", -- alt + r
	
	}
}
local cfg = inicfg.load(conf, "MHelper")
local quest = ""
local selected_item = imgui.ImInt(0)

local iddial = 0
local namedial = ''
local eD = false
local textdial = ''
local c152 = 1
require 'lib.sampfuncs'
require 'lib.moonloader'



Functions =
{
	{name = 'WH', data = {}},
	{name = 'GM', data = {}},
	{name = 'AirBrk', data = {}},
	{name = 'FastWalk', data = {}},
	{name = 'NoFall', data = {}}
}
VehiclePool = {}
Activated = true
FuncsToReenable = {}
Notification = {name = nil, posttime = nil}

function sampev.onShowDialog(id, style, title, button1, button2, text)
if title == '�����' then
local ne1, ne2 = text:match('(%w+_%w+):%s?{%x%x%x%x%x%x}%s?(.-)\n')
local cid = ''
cnick = ne1
first = ne2
cid = sampGetPlayerIdByNickname(cnick)
--sampAddChatMessage(cid , -1)
main_window_state.v = not main_window_state.v
imgui.Process = main_window_state.v
iddial = id
namedial = title
textdial = text
ccd = cid

end
if title:match('�����������') and conf.amenu.auth == true then

if conf.amenu.password ~= '' then
--sampAddChatMessage('OK')
sampSendDialogResponse(id, 1, nil, conf.amenu.password)
else
sampAddChatMessage('{00FA9A}[MHelper]: ������! ���� "{1E90FF}������ �� ��������{00FA9A}" �� ���������!')
end
local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
end

if title:match('������������� ���� ��������������') and conf.amenu.apass then
if conf.amenu.admpass ~= '' then
sampSendDialogResponse(id, 1, nil, conf.ameni.admpass)
lua_thread.create(function()
wait(2000)
local _, id = sampGetPlayerIdByCharHandle(PLAYER_PED)
if tonumber(conf.amenu.lvladm) > 1 and achat ~= 0 then
sampSendChat('/achat ' .. achat)
end
wait(600)
if tonumber(conf.amenu.templeader) ~= 0 then
sampSendChat('/templeader ' .. conf.amenu.templeader)
end
wait(600)
if tonumber(conf.amenu.skin) ~= 0 then
sampSendChat('/setskin ' .. id .. ' '  .. conf.amenu.skin)
end
if tonumber(conf.amenu.inter) ~= 0 then
sampSendChat('/inter ' .. conf.amenu.inter)
end
end)
end
end
end

oc = 0

local chan = false

function onScriptTerminate(script_id, quit) --����� ������ �����������
if script_id == thisScript() then
sampAddChatMessage('{00FA9A}[MHelper]: ������ ����������! ���� ���, �� ���� � ������� {1E90FF}vk.com/dexter_martelli ', -1)
end
end


function sampev.onSetPlayerPos(pos)
chan = true
lua_thread.create(function()
wait(5000)
chan = false
end)
end

function sampev.onSendCommand(message)
if message == 'spoff' then
main_menu.v = not main_menu.v
imgui.Process = false
end

if conf.amenu.prefix ~= nil then
for i = 1, #forms do
	if message:match('^' .. forms[i] .. ' (.*)') then
local nak = message:match('^' .. forms[i] .. ' (.*)')
		if conf.amenu.lvladm < 2 then
		local rets = string.format('/a ' .. forms[i] .. ' ' .. nak .. ' // ' .. conf.amenu.prefix)
		sampSendChat(rets)
		return false
		end
	end
	end
	end
end

function sampev.onSpectatePlayer(playerid, cam)
imgui.ShowCursor = false
oc = playerid

imgui.Process = main_menu.v
end

local igr = {}
local igr1 = {}

function sampev.onTogglePlayerSpectating(state) main_menu.v = state 
test8.v = state
end

function teleport(x, y, z)
    if x == nil then
        z = -100
	end

    if x ~= 0 and y ~= 0 then
        setCharCoordinates(PLAYER_PED, x, y, z)
    end
end
local state = false

local answer = imgui.ImBuffer(256)
local Xinput = imgui.ImBuffer(256)
local Yinput = imgui.ImBuffer(256)
local lvladm = imgui.ImBuffer(256)
local passakk = imgui.ImBuffer(256)
local skin = imgui.ImBuffer(256)
local pr1 = imgui.ImBool(false)
local pr2 = imgui.ImBool(false)
local pr3 = imgui.ImBool(false)
local pr4 = imgui.ImBool(false)
local aprefix = imgui.ImBool(false)
local pr5 = imgui.ImBool(false)
local pr6 = imgui.ImBool(false)
local admauth = imgui.ImBool(false)
local fixtp = imgui.ImBool(false)
local admgm = imgui.ImBool(false)
local clickwarp = imgui.ImBool(false)
local Zinput = imgui.ImBuffer(256)
local prefix = imgui.ImBuffer(256)
local intInput = imgui.ImBuffer(256)
local nameint = imgui.ImBuffer(256)
local achat = imgui.ImBuffer(256)
local admpass = imgui.ImBuffer(256)
local templeader = imgui.ImBuffer(256)
local inter = imgui.ImBuffer(256)
keyAdminMenu = ""
local hotkey1 = imgui.ImBuffer(keyAdminMenu, 256)

local selected = 1
local metka = false
local pervcordx = 0
local pervcordy = 0
local pervcordz = 0

function sampev.onRequestSpawnResponse() if state then return false end end
function sampev.onRequestClassResponse() if state then return false end end
function sampev.onResetPlayerWeapons() if state then return false end end
function sampev.onSetCameraBehind() if state then return false end end
function sampev.onTogglePlayerControllable() if state then return false end end
function sampev.onSetPlayerSkin() if state then return false end end
function sampev.onSetPlayerHealth() if state then return false end end
function sampev.onBulletSync() if state then return false end end


function loadSettings(source)
	local a = false
	local settingsString = ''
	for line in io.lines('moonloader/config/admin-checker.ini') do
		if a then a = false; settingsString = line; break end
		if line == '[Settings]' then a = true end
	end
	for k in (source or settingsString):gmatch('[^,]+') do
		local pair = k:gsub('^%s+', ''):gsub('%s+$', '')
		local prop, value = pair:match('(.+)=(.+)')
		settings[prop] = value
	end
end

function saveSettings()
	local a = false
	local output = ''
	for line in io.lines('moonloader/config/admin-checker.ini') do
		if a then a = false; output = output .. stringifySettings(settings) .. '\n'
		else output = output .. line .. '\n' end
		if line == '[Settings]' then a = true end
	end
	local file = io.open('moonloader/config/admin-checker.ini', 'w')
	file:write(output:sub(0, -2))
	file:close()
end

function stringifySettings()
	local str = ''
	for k, v in pairs(settings) do
		str = str .. k .. '=' .. v .. ','
	end
	return str:sub(0, -2)
end

function loadAdminList()
	adminList = {}
	local a = false
	local addr = string.format('%s:%s', sampGetCurrentServerAddress())
	local pattern = '%[%d+%.%d+%.%d+%.%d+%:%d+%]'
	local output = ''
	for line in io.lines('moonloader/config/admin-checker.ini') do
		if a and not line:find(pattern) then adminList[line] = true end
		if line == '[' .. addr .. ']' then a = true
		elseif line:find(pattern) then a = false end
	end
end

function addAdmin(nick)
	local addr = string.format('%s:%s', sampGetCurrentServerAddress())
	local output = ''
	local notFound = true
	for line in io.lines('moonloader/config/admin-checker.ini') do
		output = output .. line .. '\n'
		if line == '[' .. addr .. ']' then notFound = false; output = output .. nick .. '\n' end
	end
	if notFound then
		local f = io.open('moonloader/config/admin-checker.ini', 'a')
		f:write('\n[' .. addr .. ']')
		f:close()
		return addAdmin(nick)
	end
	local file = io.open('moonloader/config/admin-checker.ini', 'w')
	file:write(output:sub(0, -2))
	file:close()
	loadAdminList()
end

function deleteAdmin(nick)
	local addr = string.format('%s:%s', sampGetCurrentServerAddress())
	local output = ''
	local a = false
	local result = false
	for line in io.lines('moonloader/config/admin-checker.ini') do
		if a and line == nick then result = true else output = output .. line .. '\n' end
		if line == '[' .. addr .. ']' then a = true
		elseif line:find('%[%d+%.%d+%.%d+%.%d+%:%d+%]') then a = false end
	end
	local file = io.open('moonloader/config/admin-checker.ini', 'w')
	file:write(output:sub(0, -2))
	file:close()
	loadAdminList()
	return result
end

function applySettings(render)
	if conf.amenu.admrend then
	render.color(settings.color)
	render.font(settings.font)
	render.size(settings.size)
	render.flags('bold shadow')
	local px, py = settings.pos:match('(%d+) (%d+)')
	render.pos({ x = tonumber(px), y = tonumber(py) })
	render.text('')
	if settings.enabled == '1' then render.show() end
	end
end

local dragging = false

local memory = require 'memory'
local svWork = false
local arr = {}
local admins = render.create()

local tLastKeys = {} -- ��� ����� ��������� ���������� ������ ��� �������������
local ActiveClockMenu = {
	v = decodeJson(conf.hotkey.bind1)
}

function main()
imgui.Process = false

sampRegisterChatCommand('sm', test)
sampRegisterChatCommand('mypos', mypos)
sampRegisterChatCommand('regnewrep', regnewrep)
sampRegisterChatCommand('mh', function()
slave.v = not slave.v
imgui.Process = slave.v
end)
sampRegisterChatCommand('/help', function()
help.v = not help.v
imgui.Process = help.v
end)
sampRegisterChatCommand('upd', function()
main_menu.v = not main_menu.v
imgui.Process = main_menu.v
end)
sampRegisterChatCommand('povs', function()
povs.v = not povs.v
imgui.Process = povs.v
end)
sampRegisterChatCommand('cheats', function()
cheats.v = not cheats.v
imgui.Process = cheats.v
end)
sampRegisterChatCommand('amenu', function()
amenu.v = not amenu.v
imgui.Process = amenu.v
end)
sampRegisterChatCommand("checkip", chip)
sampRegisterChatCommand('az', function()
		sosi.v = not sosi.v
		imgui.Process = sosi.v
end)
sampRegisterChatCommand('/add', function (nick)
		if nick == '' then return sampAddChatMessage('���������: //add [��� ������]', 0xAFAFAF) end
		if deleteAdmin(nick) then
			addAdmin(nick)
			return sampAddChatMessage('��������� ������������� ��� ���� � ������.', 0xAFAFAF)
		end
		addAdmin(nick)
		sampAddChatMessage('������������� {ABCDEF}' .. nick .. ' {FFFFFF}������� �������� � ������.', -1)
	end)
sampRegisterChatCommand('/del', function (nick)
		if nick == '' then return sampAddChatMessage('���������: //add [��� ������]', 0xAFAFAF) end
		if deleteAdmin(nick) then
			sampAddChatMessage('������������� {ABCDEF}' .. nick .. ' {FFFFFF}������� ������ �� ������.', -1)
		else
			return sampAddChatMessage('���������� �������������� ��� � ������.', 0xAFAFAF)
		end
	end)
sampRegisterChatCommand('/set', function (params)
		loadSettings(params)
		applySettings(admins)
	end)
sampRegisterChatCommand('/setpos', function ()
		if not admins.rvisible then return end
		admins.dragstart()
		dragging = true
		lua_thread.create(function () wait(1); sampSetCursorMode(2) end)
	end)


while not isSampAvailable() do wait(50) end
	
	font = renderCreateFont('Verdana', 10, FCR_BORDER)
	font2 = renderCreateFont('Verdana', 6, 4)
	initCheats()
	bindClock = rkeys.registerHotKey(ActiveClockMenu.v, true, funcdd)
	if not isSampfuncsLoaded() or not isSampLoaded() then
    return
    end
	
	loadSettings()
	loadAdminList()
	admins = render.create()
	applySettings(admins)
	sampRegisterChatCommand('/adm', function ()
	admins.fadetoggle(0.3)
	end)
	
local font1 = renderCreateFont("Tahoma", 8, 5)
	 local dil = true
while true do
   wait(0)
    -- ������� ������ ������ � ������������ ������� �������
   local adminsOnline = ''
		local count = 0
		for i = 0, 999 do
			if sampIsPlayerConnected(i) then
				local nick = sampGetPlayerNickname(i)
				if adminList[nick] then
					count = count + 1
					adminsOnline = adminsOnline .. nick .. ' [ID ' .. i .. ']' .. '\n'
					admr = adminsOnline
				end
			end
		end
		admins.text('������������� ������ [' .. count .. ']:\n' .. ((count == 0) and '��� �������.' or adminsOnline:sub(0, -2)))
		if wasKeyReleased(0x1) and dragging then
			admins.dragstop()
			dragging = false
			settings.pos = admins.rpos.x .. ' ' .. admins.rpos.y
			saveSettings()
			sampSetCursorMode(0)
		end
   
   
   while isPauseMenuActive() do
      if cursorEnabled then
        showCursor(false)
      end
      wait(100)
    end

    if isKeyDown(keyToggle) and conf.amenu.clickwarp then
	if not imgui.Process then
      cursorEnabled = not cursorEnabled
      showCursor(cursorEnabled)
      while isKeyDown(keyToggle) do wait(80) end
	  end
    end

    if cursorEnabled and conf.amenu.clickwarp then
if not imgui.Process then
      local mode = sampGetCursorMode()
      if mode == 0 then
        showCursor(true)
      end
      local sx, sy = getCursorPos()
      local sw, sh = getScreenResolution()
      -- is cursor in game window bounds?
      if sx >= 0 and sy >= 0 and sx < sw and sy < sh then
        local posX, posY, posZ = convertScreenCoordsToWorld3D(sx, sy, 700.0)
        local camX, camY, camZ = getActiveCameraCoordinates()
        -- search for the collision point
        local result, colpoint = processLineOfSight(camX, camY, camZ, posX, posY, posZ, true, true, false, true, false, false, false)
        if result and colpoint.entity ~= 0 then
          local normal = colpoint.normal
          local pos = Vector3D(colpoint.pos[1], colpoint.pos[2], colpoint.pos[3]) - (Vector3D(normal[1], normal[2], normal[3]) * 0.1)
          local zOffset = 300
          if normal[3] >= 0.5 then zOffset = 1 end
          -- search for the ground position vertically down
          local result, colpoint2 = processLineOfSight(pos.x, pos.y, pos.z + zOffset, pos.x, pos.y, pos.z - 0.3,
            true, true, false, true, false, false, false)
          if result then
            pos = Vector3D(colpoint2.pos[1], colpoint2.pos[2], colpoint2.pos[3] + 1)

            local curX, curY, curZ  = getCharCoordinates(playerPed)
            local dist              = getDistanceBetweenCoords3d(curX, curY, curZ, pos.x, pos.y, pos.z)
            local hoffs             = renderGetFontDrawHeight(font)

            sy = sy - 2
            sx = sx - 2
            renderFontDrawText(font, string.format("%0.2fm", dist), sx, sy - hoffs, 0xEEEEEEEE)

            local tpIntoCar = nil
            if colpoint.entityType == 2 then
              local car = getVehiclePointerHandle(colpoint.entity)
              if doesVehicleExist(car) and (not isCharInAnyCar(playerPed) or storeCarCharIsInNoSave(playerPed) ~= car) then
                displayVehicleName(sx, sy - hoffs * 2, getNameOfVehicleModel(getCarModel(car)))
                local color = 0xAAFFFFFF
                if isKeyDown(VK_RBUTTON) then
                  tpIntoCar = car
                  color = 0xFFFFFFFF
                end
                renderFontDrawText(font2, "Hold right mouse button to teleport into the car", sx, sy - hoffs * 3, color)
              end
			  --end
            end

            createPointMarker(pos.x, pos.y, pos.z)

            -- teleport!
            if isKeyDown(keyApply) then
              if tpIntoCar then
                if not jumpIntoCar(tpIntoCar) then
                  -- teleport to the car if there is no free seats
                  teleportPlayer(pos.x, pos.y, pos.z)
                end
              else
                if isCharInAnyCar(playerPed) then
                  local norm = Vector3D(colpoint.normal[1], colpoint.normal[2], 0)
                  local norm2 = Vector3D(colpoint2.normal[1], colpoint2.normal[2], colpoint2.normal[3])
                  rotateCarAroundUpAxis(storeCarCharIsInNoSave(playerPed), norm2)
                  pos = pos - norm * 1.8
                  pos.z = pos.z - 0.8
                end
                teleportPlayer(pos.x, pos.y, pos.z)
              end
              removePointMarker()

              while isKeyDown(keyApply) do wait(0) end
              showCursor(false)
            end
          end
        end
      end
    end
	end
    wait(0)
    removePointMarker()
   
	if cfg.settings.sobeit == true then
			panel.v = true
			else
			panel.v = false
			end
	
	resX, resY = getScreenResolution()
	for k,v in pairs(VehiclePool) do
			if not v.gtaid then
				local result, handle = sampGetCarHandleBySampVehicleId(k)
				if result then VehiclePool[k].gtaid = handle end
			end
		end
	doKeyCheck()
	if Activated ~= false then
			doFastCheatWork()
			doCheatWork()
			doRender()
		end
	
	if wasKeyPressed(121) and not sampIsChatInputActive() then
	enableDialog(true)
	end
	
	if isKeyJustPressed(49) and not sampIsChatInputActive() and not sampIsDialogActive()  then
	imgui.ShowCursor = not imgui.ShowCursor
	end
	
	if wasKeyPressed(90) and cfg.settings.fastm then
                while isKeyDown(90) do
                    wait(0)
                    sampToggleCursor(1)
                    for id = 0, sampGetMaxPlayerId(true) do
                        if sampIsPlayerConnected(id) then
                        local exists, handle = sampGetCharHandleBySampPlayerId(id)
                            if exists and isCharOnScreen(handle) then
                                plX, plY, plZ = getBodyPartCoordinates(8, handle)
                                local plsX, plsY = convert3DCoordsToScreen(plX, plY, plZ)
								local nickz = sampGetPlayerNickname(id)
								local ex = string.format(nickz .. '[' .. id .. ']')
								if drawClickableText(font1, ex, plsX + 25, plsY - 15, 0xFF00FF7F, 0xFFFF0000) then
                                    sampSendChat('/stats ' .. id)
                                end
                                if drawClickableText(font1, "/sp", plsX + 25, plsY, 0xFFFFFFFF, 0xFFFF0000) then
                                    slezka(id)
                                end
                                if drawClickableText(font1, "Kick", plsX + 25, plsY + 15, 0xFFFFFFFF, 0xFFFF0000) then
									skick(id)
                                end
								if drawClickableText(font1, "Slap UP", plsX + 25, plsY + 30, 0xFFFFFFFF, 0xFFFF0000) then
                                    slapp(id)
                                end
								if drawClickableText(font1, "�� � ����", plsX + 25, plsY + 45, 0xFFFFFFFF, 0xFFFF0000) then
                                    ghtp(id)
                                end
								if drawClickableText(font1, "�� � ����", plsX + 25, plsY + 60, 0xFFFFFFFF, 0xFFFF0000) then
                                    gtp(id)
                                end
                            end
                        end
                    end
                end
                if wasKeyReleased(90) then sampSetCursorMode(0) end
   end
   
	if isKeyDown(69) and not sampIsChatInputActive() and not sampIsDialogActive() and cfg.settings.emenu then
   while isKeyDown(69) do
                    wait(0)
                    sampToggleCursor(1)
					local ts = getClosestCarId()
					if ts ~= -1 then
					--sampAddChatMessage(ts, -1)
							local f, handlecar = sampGetCarHandleBySampVehicleId(ts)
                            if handlecar then
								local plX, plY, plZ = getCarCoordinates(handlecar)
                                local plsX, plsY = convert3DCoordsToScreen(plX, plY, plZ)
								--local nickz = sampGetPlayerNickname(id)
								local ex = string.format('�������� ����')
								if drawClickableText(font1, ex, plsX + 25, plsY, 0xFFFFFFFF, 0xFF00FF7F) then
                                    sampSendChat('/gethereveh ' .. ts)
                                end
								if drawClickableText(font1, '���������� ����', plsX + 25, plsY + 15, 0xFFFFFFFF, 0xFF00FF7F) then
                                    sampSendChat('/spcarid ' .. ts)
                                end
                            end
                        
						end
						if wasKeyReleased(69) then sampSetCursorMode(0) end
                    end
                end
   
	for i = 151, 168 do
   if sampTextdrawIsExists(i) and cfg.settings.fixrec then
   sampTextdrawDelete(i)
   end
   end
   
	if isKeyJustPressed(48) and not sampIsChatInputActive() and not sampIsDialogActive() and cfg.settings.forms then
   if got == '��� ���� ��� ��������.' then
      printStringNow('Not successfully!', 3000)
   else
   sampSendChat(got, -1)
      printStringNow('Successfully!', 3000)
   end
   end
   
   metka = getTargetBlipCoordinates()
   
   pervcordx, pervcordy, pervcordz = getCharCoordinates(PLAYER_PED)
   
	local result, target = getCharPlayerIsTargeting(playerHandle)
   
   if conf.amenu.gm == true then
			setCharProofs(playerPed, true, true, true, true, true)
			writeMemory(0x96916E, 1, 1, false)
			state = true
			if isGMeh then
				setCarProofs(veh, true, true, true, true, true)
			end
		else
			state = false
			setCharProofs(playerPed, false, false, false, false, false)
			writeMemory(0x96916E, 1, 0, false)
			if isGMeh then
				setCarProofs(veh, false, false, false, false, false)
			end
		end
	
	if state then sampRequestClass(0) end
	
	
	end
  
end


function funcdd()
	sampAddChatMessage('ADDA', -1)
end

function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig() -- to use 'imgui.ImFontConfig.new()' on error
        font_config.MergeMode = true
        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fontawesome-webfont.ttf', 19.0, font_config, fa_glyph_ranges) --���� 14
    end
end

function show_entry(label, x, y, z,interior_id)

	if imgui.MenuItem(label, "", false, true) then
	imgui.PushItemWidth(36)
		setCharInterior(PLAYER_PED,interior_id)
		setInteriorVisible(interior_id)
		clearExtraColours(true)
		requestCollision(x,y)
		loadScene(x,y,z)
		activateInteriorPeds(true)
		teleport(x, y, z)
		imgui.PopItemWidth()
	end

end

-- fucked ImGUI
local ipasd = imgui.ImBuffer(512)




local filter         = ""
local selectedTab = 0
local pokaz = false
local ff = false
local poks = false
local nazv = '           '
local nazv0 = '        '


function imgui.OnDrawFrame()
style()		
			
			if not cheats.v or not main_window_state.v or not lvla.v or not gps1.v or not gps2.v or not gps3.v or not gps4.v or not gps5.v or not gps6.v or not gps7.v or not gps8.v or not sec_window_state.v or not main_menu.v or not slave.v then
			if not test8.v and not sosi.v and not add_zone.v and not povs.v and not help.v and not amenu.v and not ipcheck.v then
			--sampAddChatMessage('papapap', -1)
			imgui.Process = false
			end
			end
  
			if amenu.v then
  
  if conf.style.theme == 0 then
    bluetheme()
  end
    if conf.style.theme == 1 then
        style2()

    end
    if conf.style.theme == 2 then
        style3()

    end
    if conf.style.theme == 3 then
style4()

    end
	if conf.style.theme == 4 then
	style()

	end
  local so, sp = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(so / 4, sp / 5), imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(800, 500)) --imgui.WindowFlags.MenuBar
    imgui.Begin(u8'Admin Menu', amenu, imgui.WindowFlags.NoCollapse)
	imgui.BeginGroup()
		imgui.SetCursorPosX(5) --������ �����
       if imgui.Button(fa.ICON_COG .. u8' ��������', imgui.ImVec2(175, 30)) then
	   selected = 1
	   end
		imgui.SetCursorPosX(5)
		if imgui.Button(fa.ICON_PAINT_BRUSH .. u8' ��������� ����', imgui.ImVec2(175, 30)) then
		selected = 2
		end
		imgui.SetCursorPosX(5)
		if imgui.Button(fa.ICON_KEYBOARD_O .. u8' ���������� ������', imgui.ImVec2(175, 30)) then
		selected = 3
		end
		imgui.SetCursorPosX(5)
		if imgui.Button(fa.ICON_BAN .. u8' ������ ���������', imgui.ImVec2(175, 30)) then
		selected = 4
		end
		imgui.SetCursorPosX(5)
		if imgui.Button(fa.ICON_HANDSHAKE_O .. u8' ����� � ��� ����', imgui.ImVec2(175, 30)) then
		selected = 5
		end
		imgui.SetCursorPosX(5)
		if imgui.Button(fa.ICON_LIGHTBULB_O .. u8' ������ [������]', imgui.ImVec2(175, 30)) then
		selected = 6
		end
		imgui.SetCursorPosX(5)
		if imgui.Button(fa.ICON_INFO_CIRCLE .. u8' ����� �������', imgui.ImVec2(175, 30)) then
		selected = 7
		end
		imgui.SetCursorPosX(5)
		imgui.SetCursorPosY(460)
		imgui.BeginChild('off', imgui.ImVec2(25, 35), false)
		imgui.SetCursorPosX(5)
		imgui.SetCursorPosY(20)
		if imgui.Selectable(fa.ICON_POWER_OFF, poks, imgui.SelectableFlags.DontClosePopups) then 
		imgui.OpenPopup(u8'���������� ������ �������')
		end
		if imgui.BeginPopupModal(u8'���������� ������ �������', nil, 2) then
		imgui.BeginChild('da/net', imgui.ImVec2(275, 65), true)
            imgui.Text(u8'�� ������� ��� ������ ��������� ������?\n����� ��� ��������� � ����������\n������� ��������� ������ CTRL + R.')
           -- imgui.Separator()
			imgui.EndChild()
            imgui.SetCursorPosX((imgui.GetWindowWidth() - 240 + imgui.GetStyle().ItemSpacing.x) / 2)
            if imgui.Button(u8'��', imgui.ImVec2(120, 0)) then imgui.CloseCurrentPopup()
			imgui.ShowCursor = not imgui.ShowCursor
			lua_thread.create(function()
			wait(500)
			thisScript():unload()
			end)
			end
            imgui.SameLine()
            if imgui.Button(u8'���', imgui.ImVec2(120, 0)) then imgui.CloseCurrentPopup() end
			
            imgui.EndPopup()
          end	
		
		imgui.EndChild()
      imgui.EndGroup()
	  imgui.SameLine(nil, 3)
if selected == 1 then 
	  sel1()
	  end 
	if selected == 2 then
	sel2()
	end
	if selected == 3 then
	sel3()
	end
	if selected == 4 then
	sel4()
	end
	if selected == 5 then
	sel5()
	end
	if selected == 6 then
	sel6()
	end
	if selected == 7 then
	sel7()
	end
	
	

	
	
	
	
	imgui.End()
  end
  
			if main_window_state.v and cfg.settings.rephelp then 
	local answed = imgui.ImBuffer(256)
	enableDialog(eD)
	--sampAddChatMessage(ccd, -1)
	imgui.Process = main_window_state.v
	local so, sp = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(so / 2.8, sp / 2), imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(500, 250)) --imgui.WindowFlags.MenuBar
    imgui.Begin(u8'MTools || ������: Dexter_Martelli', main_window_state, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
	--local pp = ""
	if ccd == nil then
	imgui.Text(u8"������/������ �� " .. cnick .. '[OFF]:')
	else
	imgui.Text(u8"������/������ �� " .. cnick .. '[' .. ccd .. ']:')
	end
	imgui.Separator()
	u8first = u8(first)
	local proc, idnar, proc1 = u8first:match('(.*)(%d+)(.*)')
	if imgui.CustomButton(u8(first), imgui.ImVec4(0.0,0.0,0.0,2.0), imgui.ImVec4(1.0,0.0,1.0,1.0), imgui.ImVec4(1.0,0.0,1.0,1.0), imgui.ImVec2(450, 25)) then
	eD = not eD
	enableDialog(eD)
	end
	imgui.Separator()
	
	local ff = ''
	imgui.InputText(u8'�����', answer)
	local btn_size = imgui.ImVec2(100, 25)
	if imgui.Button(u8'�����. ������',  imgui.ImVec2(100, 25)) then
	cum1.v = not cum1.v
	imgui.Process = cum1.v
	main_window_state.v = not main_window_state.v
    end
	imgui.SameLine(nil, 3)
	if imgui.Button(u8'������ ������',  imgui.ImVec2(100, 25)) then
		enableDialog(true)
		local ot = string.format('��������� ' .. cnick .. ", ������ �������� ��� ������!")
		sampSendDialogResponse(cfg.DialogID.DID, 1, -1, ot)
		sampCloseCurrentDialogWithButton(0)
		local tp = string.format('/goto ' .. cnick)
		 lua_thread.create(function()
		 wait(2000)
		 sampCloseCurrentDialogWithButton(0)
		-- sampAddChatMessage('FF', -1)
		 sampSendChat(tp)
		 end)
		sampCloseCurrentDialogWithButton(0)
		
      main_window_state.v = not main_window_state.v
	  imgui.Process = false
		end
			imgui.SameLine(nil, 3)
			if imgui.Button(u8'��������� � /a',  imgui.ImVec2(100, 25)) then
		enableDialog(true)
		local ot1 = string.format('��������� ' .. cnick .. ". ������� ��� ������ ��������������!")
		sampSendDialogResponse(cfg.DialogID.DID, 1, -1, ot1)
		 lua_thread.create(function()
		 wait(2000)
		 sampCloseCurrentDialogWithButton(0)
		
		 local per = string.format('/a [������] ' .. cnick .. ' [' .. ccd .. ']: ' .. first)
		 sampSendChat(per)
		 end)
		main_window_state.v = not main_window_state.v
		imgui.Process = false
		end
		
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'����������',  imgui.ImVec2(100, 25)) then
		enableDialog(true)
		 		local ot2 = string.format('��������� ' .. cnick .. ". ���� � ��� �� ������!")
		sampSendDialogResponse(cfg.DialogID.DID, 1, -1, ot2)
		local spa = string.format('/spawn ' .. cnick)
		lua_thread.create(function()
		 while sampIsDialogActive() do
		 wait(2000)
		 sampCloseCurrentDialogWithButton(0)
		 sampSendChat(spa)
		 end
		 end)
      main_window_state.v = not main_window_state.v
	  imgui.Process = false
		end
		if imgui.Button(u8'������� ������',  imgui.ImVec2(100, 25)) then
		enableDialog(true)
		sampCloseCurrentDialogWithButton(0) 
      main_window_state.v = not main_window_state.v
	  imgui.Process = false
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'������ �� GPS',  imgui.ImVec2(100, 25)) then
		gps1.v = not gps1.v
		imgui.Process = gps1.v
      main_window_state.v = not main_window_state.v
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8"LVL'a �����",  imgui.ImVec2(100, 25)) then
		lvla.v = not lvla.v
		imgui.Process = lvla.v
      main_window_state.v = not main_window_state.v
		end
		
		if idnar then
		imgui.SameLine(nil, 3)
		if imgui.Button(u8"����� �� " .. idnar,  imgui.ImVec2(100, 25)) then
		local ot = string.format('��������� ' .. cnick .. ", ���� ������ ����������!")
		sampSendDialogResponse(cfg.DialogID.DID, 1, -1, ot)
		sampCloseCurrentDialogWithButton(0)
		 lua_thread.create(function()
		 wait(2000)
		 sampCloseCurrentDialogWithButton(0)
		-- sampAddChatMessage('FF', -1)
		 sampSendChat('/sp ' .. idnar)
		 end)
		end
		end
		if imgui.CustomButton(u8'������� ������', imgui.ImVec4(0.0,0.3,1.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec2(100, 25)) then
		enableDialog(true)
		sampCloseCurrentDialogWithButton(1) 
      main_window_state.v = not main_window_state.v
	  imgui.Process = false
		end
		

		imgui.SetCursorPos(imgui.ImVec2(335, 215))
		if imgui.CustomButton(u8'��������', imgui.ImVec4(0.0,0.0,0.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec2(100, 25)) then
	--	if imgui.Button(u8'��������',  imgui.ImVec2(100, 25)) then
		enableDialog(true)
		local od = tostring(answer.v)
	--	sampAddChatMessage(u8:decode(od), -1)
		sampSendDialogResponse(cfg.DialogID.DID, 1, -1, u8:decode(od))
		enableDialog(false)
	  -- sampAddChatMessage("{1E90FF}[MHelper] {FA8072}�����, ��������.", -1) 
		main_window_state.v = not main_window_state.v
		imgui.Process = main_window_state.v
		end
		imgui.End()
		end
		 
			if lvla.v then
			imgui.Process = lvla.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(170, 250)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'MTools || ������: Dexter_Martelli', lvla, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8"�������� ��������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '�������� �������� �������� �� 2 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"�������� �����",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '�������� ����� �������� �� 2 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"������� ����",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '������� ���� �������� �� 2 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"�������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '������� �������� � 3 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"������������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '�������� ����� �������� � 4 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"��������� ���������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '��������� ��������� �������� � 4 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"��������� �������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '��������� ������� �������� � 4 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"����������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '���������� �������� �� 5 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"�������������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '������������� �������� �� 6 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"�����������",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '����������� �������� �� 7 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
			if imgui.Button(u8"�����",  imgui.ImVec2(130, 25)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '����� �������� �� 9 ������.')
			lvla.v = not lvla.v
			imgui.Process = lvla.v
			end
		if imgui.CustomButton(u8'�����', imgui.ImVec4(0.0,0.0,0.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec2(130, 25)) then
			lvla.v = not lvla.v
			main_window_state.v = not main_window_state.v
			end
			imgui.End()
		end
		 		 
			if gps1.v then
			imgui.Process = gps1.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps1.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. ������ �����',  imgui.ImVec2(130, 30)) then
			gps2.v = not gps2.v
			imgui.Process = gps2.v
			gps1.v = not gps1.v
			end
			if imgui.Button(u8'2. ������',  imgui.ImVec2(130, 30)) then
			gps3.v = not gps3.v
			imgui.Process = gps3.v
			gps1.v = not gps1.v
			end
			if imgui.Button(u8'3. ����������� ���.',  imgui.ImVec2(130, 30)) then
			gps4.v = not gps4.v
			imgui.Process = gps4.v
			gps1.v = not gps1.v
			end
			if imgui.Button(u8'4. �������',  imgui.ImVec2(130, 30)) then
			gps5.v = not gps5.v
			imgui.Process = gps5.v
			gps1.v = not gps1.v
			end
			if imgui.Button(u8'5. ����������',  imgui.ImVec2(130, 30)) then
			gps6.v = not gps6.v
			imgui.Process = gps6.v
			gps1.v = not gps1.v
			end
			if imgui.Button(u8'6. ������',  imgui.ImVec2(130, 30)) then
			gps7.v = not gps7.v
			imgui.Process = gps7.v
			gps1.v = not gps1.v
			end
			if imgui.Button(u8'7. ����� ����',  imgui.ImVec2(130, 30)) then
			gps8.v = not gps8.v
			imgui.Process = gps8.v
			gps1.v = not gps1.v
			end
 			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			main_window_state.v = not main_window_state.v
			imgui.Process = main_window_state.v
			gps1.v = not gps1.v
			end
			
			imgui.End()
		end		 
		
			if gps2.v then
			imgui.Process = gps2.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps2.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. �����',  imgui.ImVec2(130, 30)) then
			enableDialog(true)
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 1. �����') 
			imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'2. ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 2. ����') 
			imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'3. ����. ���. ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 3. ���������� Los-Santos') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'4. �������� ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 4. �������� �������� [LS]') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'5. ���������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 5. ����������� �������� [LS]') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'6. ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 6. ���� [LS]') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'7. ���� LS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 7. ���� Los-Santos') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'8. ���� SF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 8. ���� San-Fierro') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'9. ���� LV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 9. ���� Las-Venturas') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'10. �������� LS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 10. �������� Los-Santos') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'11. �������� SF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 11. �������� San-Fierro') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'12. �������� LV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 12. �������� Las') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'13. ���������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 13. ���������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'14. ����� ���/�',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 14. ����� ������� ���������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'15. ���������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 15. ���������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'16. ���������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 16. ���������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'17. �����. �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 17. ����������� �����') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'18. ���. ����� ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 18. �������� ����� [LS]') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'19. ���. ����� ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 19. �������� ����� [LV]') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'20. �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 20. �����') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'21. ���������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 21. ����������� ���������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'22. ���� �/�',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 22. ���� ����������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'23. ������ ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 23. ������ LS') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'24. ������ ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 24. ������ SF') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'25. ������ ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 25. ������ LV') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'26. ������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 26. ������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'27. UFC',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 27. UFC ����') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'28. ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 28. ���� (�������)') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'29. ������� ���.',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 29. ������� �����������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'30. ����������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 30. ����������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'31. ��� ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 31. ���-����') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'32. ���. ������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 1. ������ ����� > 32. �������� ������') imgui.Process = false
			gps2.v = not gps2.v
			end
			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			gps2.v = not gps2.v
			gps1.v = not gps1.v
			imgui.Process = gps1.v
			end
			imgui.End()
		end		 
		
			if gps3.v then
			imgui.Process = gps3.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps3.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. ���. �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 1. ��������� �����') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'2. ���. ����������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 2. ��������� ����������') imgui.Process = false
			gps3.v = not gps3.v 
			end
			if imgui.Button(u8'3. �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 3. �����') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'4. �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 4. �����') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'5. �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 5. �����') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'6. ������� ��������� ��',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 6. ������� ��������� LS') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'7. ������� ��������������',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 7. ������� ��������������') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'8. ������� ��������������',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 8. ������� ��������������') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'9. ������� ������������',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 9. ������� ������������') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'10. ����� ���������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 10. ����� ���������') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'11. ��������� ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 11. ��������� ����') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'12. ������� ��������� �� #2',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 12. ������� ��������� LS') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'13. ������� ��������� SF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 13. ������� ��������� SF') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'14. ��������� LS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 14. ��������� LS') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'15. ��������� SF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 15. ��������� SF') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'16. ������� ��������� #1',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 16. ������� ��������� #1') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'17. ������� ��������� #2',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 17. ������� ��������� #2') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'18. ST Club LS #1',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 18. SanTrope Club LS') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'19. ST Club LS #2',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 19. SanTrope Club LS') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'20. ST Club SF #1',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 20. SanTrope Club SF') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'21. ST Club SF #2',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 21. SanTrope Club SF') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'22. ST Club LV #1',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 22. SanTrope Club LV') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'23. ST Club LV#2',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 23. SanTrope Club LV') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'24. ������� ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 24. ������� ����') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'25. ���� (����)',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 25. ���� (�������)') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'26. ��� �������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 26. ��� �������') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'27. �������� ������������',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 27. �������� ������������') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'28. ������ ��������� #1',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 28. ������ ��������� #1') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'29. ������ ��������� #2',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 29. ������ ��������� #2') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'30. ������ �������� #3',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 30. ������ ��������� #3') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'31. ����������� LS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 31. ������ ����������� LS') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'32. ����������� SF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 32. ������ ����������� SF') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'33. ����������� LV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 33. ������ ����������� LV') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'34. ������ ������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 2. ������ > 34. ������ ������') imgui.Process = false
			gps3.v = not gps3.v
			end
			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			gps3.v = not gps3.v
			gps1.v = not gps1.v
			imgui.Process = gps1.v
			end
			
			imgui.End()
		end		 
		
			if gps4.v then
			imgui.Process = gps4.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps4.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 1. �����')
			imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'2. ���',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 2. ����������� ���� �������������') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'3. Army LV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 3. ���������� ������') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'4. LSPD',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 4. ������� Los-Santos') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'5. SFPD',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 5. ������� San-Fierro') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'6. LVPD',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 6. ������� Las-Venturas') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'7. MCLS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 7. �������� Los-Santos') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'8. MCSF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 8. �������� San-Fierro') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'9. MCLV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 9. �������� Las-Venturas') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'10. CNN',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 10. National Public Radio') imgui.Process = false
			gps4.v = not gps4.v
			end
			if imgui.Button(u8'11. ������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 3.����������� ���. > 11. ������ ���-���') imgui.Process = false
			gps4.v = not gps4.v
			end
			
 			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			gps1.v = not gps1.v
			imgui.Process = gps1.v
			gps4.v = not gps4.v
			end
			
			imgui.End()
		end		 
		
			if gps5.v then
			imgui.Process = gps5.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps5.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. Pirus',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 1. Pirus')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'2. Grove Street',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 2. Grove Street')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'3. Ballas',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 3. Ballas')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'4. Vagos',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 4. Vagos')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'5. Aztecas',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 5. Aztecas')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'6. Rifa',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 6. Rifa')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'7. LCN',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 7. La Costra Nostra')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'8. ������� �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 8. ������� �����')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'9. Yakuza',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 9. Yakuza')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'10. LZ',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 10. Los Zetas')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'11. HA',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, "/gps > 4.����������� ���. > 11. Hell's Angels")  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'12. ��� �������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 12. ��� �������')  imgui.Process = false
			gps5.v = not gps5.v
			end
			if imgui.Button(u8'13. �������� ������������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 4.����������� ���. > 13. �������� ������������')  imgui.Process = false
			gps5.v = not gps5.v
			end
			
 			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			gps1.v = not gps1.v
			imgui.Process = gps1.v
			gps5.v = not gps5.v
			end
			
			imgui.End()
		end		 
			
			if gps7.v then
			imgui.Process = gps7.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps7.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. ������ ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 1. ������ 4 �������')  imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'2. ������ ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 2. ������ Royal') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'3. ����� �� ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 3. ����� �� �������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'4. ������� �/�',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 4. ������� ����������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'5. ������������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 5. ������������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'6. �������� LS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 6. �������� Los-Santos') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'7. �������� SF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 7. �������� San-Fierro') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'8. �������� LV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 8. �������� Las-Venturas') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'9. ������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 9. ������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'10. ������� ������ #1',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 10. ������� ������ Los-Santos') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'11. ������� ������ #2',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 11. ������� ������ Los-Santos') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'12. ����. ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 12. ������������ ����') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'13. ������� ���. ����',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 13. ������� ��������� ����') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'14. ������� ���. ������',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 14. ������� ������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'15. ���-����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 15. ���-����') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'16. ������� ����.',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 16. ������� �������������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'17. ����� �� �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 17. ����� �� �����') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'18. ���� ��������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 18. ���� ��������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'19. ���� ������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 19. ���� ������') imgui.Process = false
			gps7.v = not gps7.v
			end
			if imgui.Button(u8'19. �������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 6. ������ > 20. �������') imgui.Process = false
			gps7.v = not gps7.v
			end
			
			
 			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			gps1.v = not gps1.v
			imgui.Process = gps1.v
			gps7.v = not gps7.v
			end
			
			imgui.End()
		end	

			if gps6.v then
			imgui.Process = gps6.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps6.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. ��������� LS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 1. ��������� Los-Santos') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'2. ��������� SF',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 2. ��������� San-Fierro') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'3. ��������� LV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 3. ��������� Las-Venturas') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'4. ��������� Real',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 4. ��������� Platinum Cars') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'5. ���-������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 5. ���-������') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'6. ��������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 6. ��������') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'7. �����������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 7. �����������') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'8. ��������� �����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 8. ��������� �����') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'9. �������� ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 9. �������� ����') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'10. ���������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 10. ���������') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'11. ��������� ��',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 11. ��������� Los-Santos') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'12. ���������� Dillimore',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 12. ���������� Dillimore') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'13. ���������� SF',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 13. ���������� San-Fierro') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'14. ���������� LV',  imgui.ImVec2(170, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 14. ���������� Las-Venturas') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'15. Perfomance LS',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 15. Perfomance Los-Santos') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'16. Perfomance LV',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 16. Perfomance Las-Venturas') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'17. ���. ������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 17. ������ ������') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'18. ����������� �/�',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 18. �������� ���������� �/�') imgui.Process = false
			gps6.v = not gps6.v
			end
			if imgui.Button(u8'19. ���. ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 5. ���������� � ����������� > 19. ���-����') imgui.Process = false
			gps6.v = not gps6.v
			end
			
			
 			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			gps1.v = not gps1.v
			imgui.Process = gps1.v
			gps6.v = not gps6.v
			end
			
			imgui.End()
		end			
		
			if gps8.v then
			imgui.Process = gps8.v
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 2.3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(200, 350)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'GPS', gps8.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
			if imgui.Button(u8'1. ����. ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 7. ����� ���� > 1. ����� ��������� ��������') imgui.Process = false
			gps8.v = not gps8.v
			end
			if imgui.Button(u8'2. ���� 24/7',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 7. ����� ���� > 2. ����� ��������� 24/7') imgui.Process = false
			gps8.v = not gps8.v
			end
			if imgui.Button(u8'3. ���� ���',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 7. ����� ���� > 3. ����� ��������� ���') imgui.Process = false
			gps8.v = not gps8.v
			end
			if imgui.Button(u8'4. ������ ($2500)',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 7. ����� ���� > 4. ����� ������') imgui.Process = false
			gps8.v = not gps8.v
			end
			if imgui.Button(u8'5. ���� ����',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 7. ����� ���� > 5. ����� ��������� �������') imgui.Process = false
			gps8.v = not gps8.v
			end
			if imgui.Button(u8'6. �������',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 7. ����� ���� > 6. ����� �������') imgui.Process = false
			gps8.v = not gps8.v
			end
			if imgui.Button(u8'7. ��� ($1500)',  imgui.ImVec2(130, 30)) then
			sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '/gps > 7. ����� ���� > 7. ����� ���') imgui.Process = false
			gps8.v = not gps8.v
			end
			if imgui.Button(u8'�����',  imgui.ImVec2(130, 30)) then
			gps1.v = not gps1.v
			imgui.Process = gps1.v
			gps8.v = not gps8.v
			end
			
			imgui.End()
		end	
		
			if cum1.v then
		imgui.Process = cum1.v
		local so, sp = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(so / 2.8, sp / 2), imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(500, 250)) --imgui.WindowFlags.MenuBar
		imgui.Begin(u8'MTools || ������: Dexter_Martelli', cum1.v, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoCollapse)
		if cid == nil then
	    imgui.Text(u8"������/������ �� " .. cnick .. '[OFF]:')
	else
	imgui.Text(u8"������/������ �� " .. cnick .. '[' .. ccd .. ']:')
	end
	imgui.Separator()
	pp = string.format(u8" " .. first)
	--imgui.TextColored(imgui.ImVec4(1.0,0.0,1.0,1.0), u8(first))
	if imgui.CustomButton(u8(first), imgui.ImVec4(0.0,0.0,0.0,2.0), imgui.ImVec4(1.0,0.0,1.0,1.0), imgui.ImVec4(1.0,0.0,1.0,1.0), imgui.ImVec2(450, 25)) then
	eD = not eD
	enableDialog(eD)
	end
		imgui.Separator()
		local btn_size = imgui.ImVec2(100, 25)
	if imgui.Button(u8'��������',  imgui.ImVec2(100, 25)) then
        sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '������� ������� �����. �������� ���������� | �������� ����')
		end
				imgui.SameLine(nil, 3)
		if imgui.Button(u8'������� ����', imgui.ImVec2(100, 25)) then
sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '���� ���-�� ������� �������� ����� ���� - ���������� �� �����') 
		cum1.v = not cum1.v
 end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8"������� ������",  imgui.ImVec2(100, 25)) then
		enableDialog(true)
		local spa1 = string.format('��������� ' .. cnick .. ', ������� ������ �� ����� ������!')
		sampSendDialogResponse(cfg.DialogID.DID, 1, -1, spa1) 
		cum1.v = not cum1.v
       sec_window_state.v = not sec_window_state.v
		imgui.Process = sec_window_state.v
		end
	if imgui.Button(u8'��� ����������', imgui.ImVec2(100, 25)) then
	enableDialog(true)
        sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '������� ������� �����. ��� ���������� | �������� ����') 
		cum1.v = not cum1.v
		imgui.Process = cum1.v
		end
				imgui.SameLine(nil, 3)
		if imgui.Button(u8'������',  imgui.ImVec2(100, 25)) then
		enableDialog(true)
        sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '������������, ���������� Offtop. | �������� ����')
				cum1.v = not cum1.v
		imgui.Process = cum1.v
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8"�������� ����",  imgui.ImVec2(100, 25)) then
		enableDialog(true)
		local spa2 = string.format('��������� ' .. cnick .. '. �������� ���� �� SanTrope Role Play!')
		sampSendDialogResponse(cfg.DialogID.DID, 1, -1, spa2) 
		cum1.v = not cum1.v
		imgui.Process = cum1.v
		end
	if imgui.Button(u8'�� �������� � ����������', imgui.ImVec2(100, 25)) then
	enableDialog(true)
        sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '���� �� �� �������� � ���������� - ���������� �� �����') 
		cum1.v = not cum1.v
		imgui.Process = cum1.v
		end
				imgui.SameLine(nil, 3)
				 if imgui.Button(u8'��� ���������?',  imgui.ImVec2(100, 25)) then
				 enableDialog(true)
        sampSendDialogResponse(cfg.DialogID.DID, 1, -1, '������������, ��� � ��� ���������? | �������� ����')
		cum1.v = not cum.v
		imgui.Process = cum1.v
		end
if imgui.CustomButton(u8'�����', imgui.ImVec4(0.0,0.0,0.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec4(1.0,0.0,0.0,1.0), imgui.ImVec2(130, 25)) then
			cum1.v = not cum1.v
			main_window_state.v = not main_window_state.v
			end
		


		imgui.SameLine(nil, 230)
		--imgui.SetCursorPos(imgui.ImVec2(335, 215))
		if imgui.Button(u8'�������',  imgui.ImVec2(100, 25)) then
				enableDialog(true)
		sampCloseCurrentDialogWithButton(0) 
		sampAddChatMessage("{1E90FF}[MHelper] {FA8072}�����, ��������.", -1) 

		cum1.v = not cum1.v
		imgui.Process = cum1.v
		end
				imgui.End()
		end
		
			if sec_window_state.v then
		imgui.Process = sec_window_state.v
		local st, sz = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(st / 2, sz / 1.5), imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(450, 220))
		imgui.Begin(u8'MTools || �����������: Dexter_Martelli', sec_window_state, imgui.WindowFlags.NoMove)
		f = string.format(u8"����� � ������ �� " .. cnick .."[" .. ccd .. "]")
		spec = string.format('/sp ' .. ccd)
		go = string.format('/go ' .. ccd)
		if imgui.Button(f, imgui.ImVec2(140, 50)) then
		sampCloseCurrentDialogWithButton(0)
		sampSendChat(spec)
		sec_window_state.v = not sec_window_state.v
		end
		imgui.SameLine(nil, 3)
		f1 = string.format(u8"����������������� � " .. cnick .."[" .. ccd .. "]")
		if imgui.Button(f1, imgui.ImVec2(140, 50)) then
		sampCloseCurrentDialogWithButton(0)
		sampSendChat(go)
		sec_window_state.v = not sec_window_state.v
		end
		imgui.SameLine(nil, 3)
		f2 = string.format(u8"������ �� ������")
		if imgui.Button(f2, imgui.ImVec2(140, 50)) then
		sec_window_state.v = not sec_window_state.v
		end
		f4 = string.format(u8"���������� " .. cnick .."[" .. ccd .. "]")
		spawn = string.format('/spawn ' .. ccd)
		if imgui.Button(f4, imgui.ImVec2(140, 50)) then
		sampCloseCurrentDialogWithButton(0)
		sampSendChat(spawn)
		sec_window_state.v = not sec_window_state.v
		end
		imgui.End()
	end
	
			if main_menu.v then
			style2()
	--imgui.Process = main_menu.v	
	local sg, se = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sg / 1.66, se / 1.1), imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(550, 70))
		imgui.Begin(u8'MTools || �����������: Dexter_Martelli', main_menu, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)
		if imgui.Button(u8'/pm �� ���?', imgui.ImVec2(100, 25)) then
		gh  = string.format(u8"/pm " .. oc .. " �� ���?")
		sampSendChat(gh)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'���� �������', imgui.ImVec2(100, 25)) then
		skick  = string.format(u8"/skick " .. oc)
		sampSendChat(skick)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'��������', imgui.ImVec2(100, 25)) then
		slap  = string.format(u8"/slap " .. oc)
		sampSendChat(slap)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'/goto', imgui.ImVec2(100, 25)) then
		local abra  = string.format(u8"/goto " .. oc)
		sampSendChat(abra)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'NEXT', imgui.ImVec2(100, 25)) then
		local oc1 = tonumber(oc)
		local nexty  = string.format(u8"/sp " .. oc1)
		sampSendChat(nexty)
		end
		if imgui.Button(u8'�����', imgui.ImVec2(100, 25)) then
		stats  = string.format(u8"/stats " .. oc)
		sampSendChat(stats)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'������ HP', imgui.ImVec2(100, 25)) then
		hp  = string.format(u8"/hp " .. oc )
		sampSendChat(hp)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'����������', imgui.ImVec2(100, 25)) then
		soo  = string.format(u8"/spawn " .. oc)
		sampSendChat(soo)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'/get', imgui.ImVec2(100, 25)) then
		local ghs  = string.format(u8"/get " .. oc)
		sampSendChat(ghs)
		end
		imgui.SameLine(nil, 3)
		if imgui.Button(u8'/spoff', imgui.ImVec2(100, 25)) then
		sampSendChat('/spoff')
		end
		imgui.End()
	end

			if slave.v then
 imgui.Process = true	
	local sg, se = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sg / 3.3, se / 2), imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(600, 300))
		imgui.Begin(u8'MTools || �����������: Dexter_Martelli', slave, imgui.WindowFlags.NoResize)
		if cfg.settings.forms == true then
		tforms = imgui.ImBool(true)
		else
		tforms = imgui.ImBool(false)
		end
		if cfg.settings.rephelp == true then
		srep = imgui.ImBool(true)
		else
		srep = imgui.ImBool(false)
		end
		if cfg.settings.emenu == true then
		emenu = imgui.ImBool(true)
		else
		emenu = imgui.ImBool(false)
		end
		if cfg.settings.fastm == true then
		fm = imgui.ImBool(true)
		else
		fm = imgui.ImBool(false)
		end
		if cfg.settings.fixrec == true then
		fixrec = imgui.ImBool(true)
		else
		fixrec = imgui.ImBool(false)
		end
		if imgui.Checkbox(u8'�������� ����', tforms) then
		cfg.settings.forms = not cfg.settings.forms
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.SameLine(nil, 3)
		hint("��� ������� �� 0 ����������� ��������� ����� �� /a ����") -- ���� ���������
		if imgui.Checkbox(u8'Z-����', zm) then
		cfg.settings.fastm = not cfg.settings.fastm
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.SameLine(nil, 3)
		hint("���� ��������, �� ��� ������� Z �������� ������ �������� �������� �� ������ ������") -- ���� ���������
		if imgui.Checkbox(u8'E-����', emenu) then
		cfg.settings.emenu = not cfg.settings.emenu
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.SameLine(nil, 3)
		hint("���� ��������, �� ��� ������� E �������� ������ �������� �������� �� ������ �/�") -- ���� ���������
		if imgui.Checkbox(u8'�������� ������ �� ������', srep) then
		cfg.settings.rephelp = not cfg.settings.rephelp
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.SameLine(nil, 3)
		hint("���� ��������, �� ���������� �����-������ ��� ������ �� ������") -- ���� ���������
		if imgui.Checkbox(u8'���������� /sp', fixrec) then
		cfg.settings.fixrec = not cfg.settings.fixrec
		inicfg.save(cfg, 'MHelper.ini')
		end
		
		imgui.SameLine(nil, 3)
		hint("���� ��������, �� ������ ����� � /sp ���������.") -- ���� ���������
		if imgui.Button(u8'��������� � �������� ������', imgui.ImVec2(185, 40)) then
			lua_thread.create(function()
			autoupdate("https://gist.githubusercontent.com/M0rtelli/de2309930d8201e561d018359dac76f3/raw", '{00FFFF}[MHelper]: ', "https://raw.githubusercontent.com/M0rtelli/MHelper/main/MHelper.lua")
			end)
			end
		
 imgui.End()
 end

			if help.v then
				local sg, se = getScreenResolution()
				imgui.SetNextWindowPos(imgui.ImVec2(sg / 3.3, se / 2), imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(600, 300))
				imgui.Begin(u8'MTools || �����������: Dexter_Martelli', help, imgui.WindowFlags.NoResize)
				local text = '{FFA500}����� �� ������� ������ �������/������ ������� � ��� ��� ������?'
				imgui.TextColoredRGB(text)
				imgui.Text(u8'�������:')
				local sm = '{1E90FF}/sm{EE82EE} - ������ ����� �� ����� ����� �� ����������� {1E90FF}[{7FFF00}/sm X Y Z{1E90FF}]'
				local regrep = '{1E90FF}/regnewrep{EE82EE} - ������������ ����� ���� ������� {1E90FF}[{7FFF00}/regnewrep{1E90FF}]'
				local mh = '{1E90FF}/mh{EE82EE} - ��������� ������� (����� �����������) {1E90FF}[{7FFF00}/mh{1E90FF}]'
				local mypos = '{1E90FF}/mypos{EE82EE} - ������� � ��� ���� ���������� {1E90FF}[{7FFF00}/mypos{1E90FF}]'
				imgui.TextColoredRGB(sm)
				imgui.SameLine(nil, 3)
				hint("��������: /sm 228 1377 6666 !��� ��� ����� ����� ����������!") -- ���� ���������
				imgui.TextColoredRGB(mypos)
				imgui.TextColoredRGB(regrep)
				imgui.TextColoredRGB(mh)
				imgui.Text(u8'�������:')
				imgui.SameLine(nil, 3)
				hint("������� ����� �������� � ��� ������, ���� �� ������ ������/���") -- ���� ���������
				local pervay = '{1E90FF}1{EE82EE} - ��������/���������� ������ ���� ���������{1E90FF}'
				local Z = '{1E90FF}Z (������){EE82EE} - ������� ���� �� ������ � �������� ����������'
				local E = '{1E90FF}E (������){EE82EE} - ������� ���� �� �/� � �������� ����������'
				local zero = '{1E90FF}0{EE82EE} - ��������� ��������� ����� �� ������ ��������� �� /a ����'
				local F10 = '{1E90FF}F10{EE82EE} - ���������� ��������� �������� ���� (������������ ������, ���� �������� ���)'
				imgui.TextColoredRGB(pervay)
				imgui.TextColoredRGB(Z)
				imgui.TextColoredRGB(E)
				imgui.TextColoredRGB(zero)
				imgui.TextColoredRGB(F10)
				imgui.End()
		end
		
			if povs.v then
				style2()
				
				local d1 = 0
				local d2 = 0
				local d3 = 0
				imgui.Process = povs.v
				local sg, se = getScreenResolution()
				
				imgui.SetNextWindowPos(imgui.ImVec2(sg / 1.45, se / 2.5), imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(415, 100))
				imgui.Begin(u8'MTools || �����������: Dexter_Martelli', povs, imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)
				if imgui.Button(u8'������ HP', imgui.ImVec2(130, 40)) then
				sampAddChatMessage('������ HP')
				sampSendChat('/mp')
				proof(1)
				end
				imgui.SameLine(nil, 3)
				if imgui.Button(u8'���������� (50 m)', imgui.ImVec2(130, 40)) then
				lua_thread.create(function()
				repeat
				local f66 = getClosestPlayerId(50)
				if f66 == -1 then
				break
				end
				sampSendChat('/spawn ' .. f66)
				wait(2000)
				local f55 = getClosestPlayerId(50)
				until f55 == f66
				
				end)
				
				end
				imgui.SameLine(nil, 3)
				if imgui.Button(u8'������ ����', imgui.ImVec2(130, 40)) then
				sampSendChat('/mp')
				proof(4)
				end
				if imgui.Button(u8'������� ������', imgui.ImVec2(130, 40)) then
				sampSendChat('/mp')
				proof(2)
				end
				imgui.SameLine(nil, 3)
				if imgui.Button(u8'������� �����', imgui.ImVec2(130, 40)) then
				sampSendChat('/mp')
				proof(3)
				end
				imgui.SameLine(nil, 3)
				if imgui.Button(u8'������� ������', imgui.ImVec2(130, 40)) then
				sampSendChat('/mp')
				proof(5)
				end
				imgui.End()
			 end
			 
			if test8.v then
			 style2()
				local h1, h2 = getScreenResolution()
				imgui.SetNextWindowPos(imgui.ImVec2(h1 / 55, h2 / 1.7), imgui.ImVec2(0.5, 0.5))
				imgui.SetNextWindowSize(imgui.ImVec2(160, 300))
				imgui.Begin(u8'OK', test8, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)
				if imgui.Button(u8' Back', imgui.ImVec2(130, 25)) then
				sampSendChat('/sp ' .. oc - 1)
				end
				if imgui.Button(u8'Ban', imgui.ImVec2(130, 25)) then
				sampSetChatInputEnabled(true)
				sampSetChatInputText('/ban ' .. oc .. ' ')
				sampAddChatMessage('ok', -1)
				end
				if imgui.Button(u8'Warn', imgui.ImVec2(130, 25)) then
				sampSetChatInputEnabled(true)
				sampSetChatInputText('/warn ' .. oc .. ' ')
				end
				if imgui.Button(u8'Kick', imgui.ImVec2(130, 25)) then
				sampSetChatInputEnabled(true)
				sampSetChatInputText('/kick ' .. oc .. ' ')
				end
				if imgui.Button(u8'Jail', imgui.ImVec2(130, 25)) then
				sampSetChatInputEnabled(true)
				sampSetChatInputText('/jail ' .. oc .. ' ')
				end
				if imgui.Button(u8'/gmcheck', imgui.ImVec2(130, 25)) then
				sampSendChat('/gmcheck ' .. oc)
				end
				if imgui.Button(u8'Freeze', imgui.ImVec2(130, 25)) then
				sampSendChat('/freeze ' .. oc)
				end
				if imgui.Button(u8'Unfreeze', imgui.ImVec2(130, 25)) then
				sampSendChat('/unfreeze ' .. oc)
				end
				if imgui.Button(u8'Next ', imgui.ImVec2(130, 25)) then
				sampSendChat('/sp ' .. oc + 1)
				end
				imgui.End()
			 end
			
			if cheats.v then
			--style2()
			imgui.Process = cheats.v	
			local sg, se = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sg / 2.7, se / 2.5), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(400, 300))
			imgui.Begin(u8'MTools || �����������: Dexter_Martelli', cheats, imgui.WindowFlags.NoResize)
			imgui.Checkbox(u8'�� (Wall Hack)', wh)
			imgui.Checkbox(u8'GodMod', gm)
			imgui.Checkbox(u8'Air Brake', air)
			if imgui.Checkbox(u8'�������� �����', panel) then
			cfg.settings.sobeit = not cfg.settings.sobeit
			inicfg.save(cfg, 'MHelper.ini')
			end
			imgui.SameLine(nil, -1)
			hint("�������� ����������� ���� ����� ����������. *����������� ��������� ����!") -- ���� ���������
			imgui.Checkbox(u8'No Fall', nofall)
			imgui.End()
			end

			if sosi.v then
			style4()
			--imgui.Process = sosi.v
				local so, sp = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(so / 2.5, sp / 2), imgui.ImVec2(0.5, 0.5))
    imgui.SetNextWindowSize(imgui.ImVec2(300, 250)) --imgui.WindowFlags.MenuBar
    imgui.Begin(u8"Admin's Zone's || ������: Dexter_Martelli", sosi)

	for name, coord in pairs(conf.az) do
	--sampAddChatMessage(name, -1)
	--sampAddChatMessage('COORD: ' .. coord, -1)
				local x, y, z, interior_id = coord:match("(.*),(.*),(.*), INT: (%d+)")
					if filter == "" then
					imgui.PushItemWidth(36)
					show_entry(name, tonumber(x), tonumber(y), tonumber(z), interior_id)
				else
					if string.upper(name):find(string.upper(filter)) ~= nil  then
					imgui.PushItemWidth(36)
						show_entry(name, tonumber(x), tonumber(y), tonumber(z),interior_id)
					end
				end
			end
			if imgui.Button(u8'Add Admin Zone (local)', imgui.ImVec2(275, 25)) then
			--sampAddChatMessage('DA', -1)
			add_zone.v = not add_zone.v
			end
			
			
			
			if add_zone.v then
			style3()
			local so, sp = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(so / 3, sp / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(500, 175)) --imgui.WindowFlags.MenuBar
			imgui.Begin(u8'Add Zone|| ������: Dexter_Martelli', add_zone, imgui.WindowFlags.NoMove + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.NoResize)
			
			imgui.SameLine(nil, 30)
			imgui.Columns(4, _, true)
			imgui.Separator()
		  --  imgui.SetColumnWidth(-1, 75)
			imgui.PushItemWidth(75)
			imgui.InputText(' X', Xinput)
			imgui.PopItemWidth()
			
			imgui.NextColumn()
			
			--imgui.SetColumnWidth(-1, 80) 
			imgui.PushItemWidth(75)
			imgui.InputText(' Y', Yinput)
			imgui.PopItemWidth()	
				
			imgui.NextColumn()
			
		   -- imgui.SetColumnWidth(-1, 80)
			imgui.PushItemWidth(75)
			imgui.InputText(' Z', Zinput)
			imgui.PopItemWidth()
				
			imgui.NextColumn() 
			--imgui.SetColumnWidth(-1, 80) 
			imgui.PushItemWidth(75)
			imgui.InputText(' INT', intInput)
			imgui.PopItemWidth()  
			
			imgui.Columns(1, _, true)
			imgui.Separator()
			imgui.InputText(' Name', nameint)
			imgui.SameLine(nil, 15)
			hint('������ �� ����������!')
			if imgui.Button(u8'��������', imgui.ImVec2(475, 30)) then
			local xitog = tonumber(Xinput.v)
			local yitog = tonumber(Yinput.v)
			local zitog = tonumber(Zinput.v)
			local intitog = tonumber(intInput.v)
			local nameintitog = ''
			if nameint.v == '' then
			nameintitog = 'New AZ'
			else
			nameintitog = nameint.v
			end
			local asdasd = '1231,1245,1324, INT: 2'
			
			if xitog == nil or yitog == nil or zitog == nil or intitog == nil then
			sampAddChatMessage('[MHelper]: ������ ������� �����������!', 0x1E90FF)
			else
			local itog = string.format(xitog .. ',' .. yitog .. ',' .. zitog .. ', INT: ' .. intitog)
			conf.az[nameintitog] = itog
			inicfg.save(cfg, 'MHelper.ini')
			sampAddChatMessage('[MHelper]: ����� �����-���� ������� ���� ���������!', 0x1E90FF)
			add_zone.v = not add_zone.v
			end
			end
			if imgui.Button(u8'�������', imgui.ImVec2(475, 30)) then
			add_zone.v = not add_zone.v
			end
				imgui.End()
				end
		imgui.End()
			end
			
			if ipcheck.v then
			local so, sp = getScreenResolution()
	imgui.SetNextWindowPos(imgui.ImVec2(so / 2.5, sp / 3), imgui.ImVec2(0.5, 0.5))
			imgui.Begin(u8'��������� � IP', ipcheck)
			ipasd.v = itogip
			ipasd.v = u8(ipasd.v)
			imgui.InputTextMultiline("##����� ���� �����, ��� �������� �����", ipasd, imgui.ImVec2(300, 400))
			--imgui.Text(u8(itogip))
			if imgui.Button(u8'��������� � /a') then
			lua_thread.create(function()
			sampSendChat('|======== IP �1 ========|')
			wait(600)
			sampSendChat('������ - ' .. rdata[1]["country"])
			wait(600)
			sampSendChat('����� - ' .. rdata[1]["city"])
			wait(600)
			sampSendChat('��������� - ' .. rdata[1]["isp"])
			wait(600)
			if rdata[2] then
			sampSendChat('|======== IP �2 ========|')
			wait(600)
			sampSendChat('������ - ' .. rdata[2]["country"])
			wait(600)
			sampSendChat('����� - ' .. rdata[2]["city"])
			wait(600)
			sampSendChat('��������� - ' .. rdata[2]["isp"])
			wait(600)
			mils = tonumber(string.format("%.3f", distances))
			sampSendChat('��������� ����� IP - ' .. mils .. ' ��')
			end
			end)
			end
			imgui.End()
			end
			
			
end


local pokaz1 = false
local nakazaniya = imgui.ImBuffer(512)
local formi = {}

function sel1()
imgui.BeginChild('Left panel', imgui.ImVec2(606, 0), true)
		--
		local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
		local myname = sampGetPlayerNickname(myid)
		imgui.Text(u8'��� ���: ' .. myname .. '[' .. myid .. ']')
		imgui.SameLine(nil, 125)
		imgui.BeginChild('neleft panel', imgui.ImVec2(700, 0), false)
		imgui.Text(u8'��� �������: ')
		imgui.SameLine()
		prefix.v = conf.amenu.prefix
		imgui.PushItemWidth(90)
		if imgui.InputText('##prefix', prefix) then
		conf.amenu.prefix = prefix.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		imgui.Text(u8'��� � ����: "��� // ' .. prefix.v .. '"' )
		
		imgui.Text(u8'������ �� �������: ')
		imgui.SameLine()
		admpass.v = conf.amenu.admpass
		if pokaz1 == false then
		imgui.PushItemWidth(75)
		if imgui.InputText('##admpass', admpass, imgui.InputTextFlags.Password) then
		conf.amenu.admpass = admpass.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		else
		imgui.PushItemWidth(75)
		if imgui.InputText('##admpassbez**', admpass) then
		conf.amenu.admpass = admpass.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		end
		imgui.SameLine()
		imgui.BeginChild('apass', imgui.ImVec2(20, 30), false)
		imgui.SetCursorPosY(5)
		if imgui.Selectable(fa.ICON_EYE .. u8'', pokaz1, imgui.SelectableFlags.DontClosePopups) then pokaz1 = not pokaz1 end
		imgui.EndChild()
		
		imgui.Text(u8("��������� � �������"))
		imgui.SameLine(175)
		if conf.amenu.admauth then
		admauth.v = true
		else
		admauth.v = false
		end
		if imgui.ToggleButton("admauth", admauth) then
		conf.amenu.admauth = not conf.amenu.admauth
		inicfg.save(cfg, 'MHelper.ini')
		end
		
		imgui.Text(u8("GM"))
		imgui.SameLine(175)
		if conf.amenu.gm then
		admgm.v = true
		else
		admgm.v = false
		end
		if imgui.ToggleButton("admgm", admgm) then
		conf.amenu.gm = not conf.amenu.gm
		inicfg.save(cfg, 'MHelper.ini')
		end
		
		imgui.Text(u8("�����������"))
		imgui.SameLine(175)
		if conf.amenu.aprefix then
		aprefix.v = true
		else
		aprefix.v = false
		end
		if imgui.ToggleButton("aprefix", aprefix) then
		conf.amenu.aprefix = not conf.amenu.aprefix
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.SameLine()
		imgui.BeginChild('jitttt',imgui.ImVec2(20, 20))
		imgui.SetCursorPosY(5)
		fahint('�������� � ��� 1 LVL ������� � �� �� ������ ������ � /jail\n������ � ��� /jail 2 30 DM � ������ ������������� ���������� ����� � /a ��� � ���������,\n������� �� ������� ����.')
		imgui.EndChild()
		
		imgui.Text(u8("ClickWarp"))
		imgui.SameLine(175)
		if conf.amenu.clickwarp then
		clickwarp.v = true
		else
		clickwarp.v = false
		end
		if imgui.ToggleButton("clickwarp", clickwarp) then
		conf.amenu.clickwarp = not conf.amenu.clickwarp
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.SameLine()
		imgui.BeginChild('jitt',imgui.ImVec2(20, 20))
		imgui.SetCursorPosY(5)
		fahint('�������� �� �������� �����.')
		imgui.EndChild()
		
		if imgui.Button(u8'������������ �������', imgui.ImVec2(140, 30)) then
		imgui.ShowCursor = not imgui.ShowCursor
		lua_thread.create(function() wait(100) thisScript():reload() end)
		imgui.OpenPopup(u8'�������� ���������')
		end 
		imgui.EndChild()
		imgui.SetCursorPosY(30)
		imgui.Text(u8'��� LVL �����������������: ')
		imgui.SameLine()
		lvladm.v = conf.amenu.lvladm
		imgui.PushItemWidth(30)
		if imgui.InputText('   ', lvladm) then
		conf.amenu.lvladm = lvladm.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		
		imgui.Text(u8'������ �� ��������: ')
		imgui.SameLine()
		passakk.v = conf.amenu.password
		if pokaz == false then
		imgui.PushItemWidth(75)
		if imgui.InputText('##passwordakk', passakk, imgui.InputTextFlags.Password) then
		conf.amenu.password = passakk.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		else
		imgui.PushItemWidth(75)
		
		if imgui.InputText('##passakkno**', passakk) then
		conf.amenu.password = passakk.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		end
		imgui.SameLine()
		
		imgui.BeginChild('pass', imgui.ImVec2(20, 30), false)
		imgui.SetCursorPosY(5)
		if imgui.Selectable(fa.ICON_EYE .. u8'', pokaz, imgui.SelectableFlags.DontClosePopups) then pokaz = not pokaz end
		imgui.EndChild()
		imgui.Text(u8("�������� ������"))
		imgui.SameLine(150)
		if conf.amenu.auth then
		pr1.v = true
		else
		pr1.v = false
		end
		if imgui.ToggleButton("ras", pr1) then
		conf.amenu.auth = not conf.amenu.auth
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.Text(u8("����� �������������"))
		imgui.SameLine(150)
		if conf.amenu.admrend then
		pr2.v = true
		else
		pr2.v = false
		end
		if imgui.ToggleButton("rend", pr2) then
		conf.amenu.admrend = not conf.amenu.admrend
		admins.fadetoggle(0.3)
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.SameLine()
		imgui.BeginChild('##checker', imgui.ImVec2(25,35), false)
		imgui.SetCursorPosY(5)
		fahint('//setpos - ���������� ������� ������ (����� ��� ����������)\n����� ������ �������� ��� ����������, ���� �� �������� �� ����� =)')
		imgui.EndChild()
		
		imgui.SetCursorPosY(155)
		skin.v = conf.amenu.skin
		imgui.Text(u8'���� ��� �����������: ')
		imgui.SameLine()
		imgui.PushItemWidth(30)
		if imgui.InputText('##skinpriauth', skin) then
		conf.amenu.skin = skin.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		imgui.SameLine()
		imgui.BeginChild('skin', imgui.ImVec2(20, 30), false)
		imgui.SetCursorPosY(5)
		fahint('������� 0, ���� ������ ���������� � ����� �����.')
		imgui.EndChild()
		imgui.SetCursorPosY(185)
		inter.v = conf.amenu.inter
		imgui.Text(u8'/inter ��� �����������:')
		imgui.SameLine()
		imgui.PushItemWidth(30)
		if imgui.InputText('##interior', inter) then
		conf.amenu.inter = inter.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		imgui.SameLine()
		imgui.BeginChild('inter', imgui.ImVec2(20, 30), false)
		imgui.SetCursorPosY(5)
		--imgui.SetCursorPosX(-10)
		fahint('������� 0, ���� �� ������ ���������� � ���������.')
		imgui.EndChild()
		if lvladm.v ~= '' then 
		local lvladmin = tonumber(conf.amenu.lvladm)
		if lvladmin > 3 then
		templeader.v = conf.amenu.templeader
		imgui.Text(u8'������� ��� �����������:')
		imgui.SameLine()
		imgui.PushItemWidth(30)
		if imgui.InputText('##leader', templeader) then
		conf.amenu.templeader = templeader.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		imgui.SameLine()
		imgui.BeginChild('templeader', imgui.ImVec2(20, 30), false)
		imgui.SetCursorPosY(5)
		--imgui.SetCursorPosX(-10)
		fahint('������� 0, ���� �� ������ ���� �� ������� ��� �����������.')
		imgui.EndChild()
		else
		if lvladmin > 1 then
		achat.v = conf.amenu.achat
		imgui.Text(u8'/achat ��� �����������:')
		imgui.SameLine()
		imgui.PushItemWidth(30)
		if imgui.InputText('##achat', achat) then
		conf.amenu.achat = achat.v
		inicfg.save(cfg, 'MHelper.ini')
		end
		imgui.PopItemWidth()
		imgui.SameLine()
		imgui.BeginChild('templeader', imgui.ImVec2(20, 30), false)
		imgui.SetCursorPosY(5)
		--imgui.SetCursorPosX(-10)
		fahint('������� 0, ���� �� ������ ���� �� ������� ��� �����������.')
		imgui.EndChild()
		end
		end
		end
		
		--��� ������� ���� ��� ����������� � ���� ��� �����������
		if conf.amenu.fixtp then
		fixtp.v = true
		else
		fixtp.v = false
		end
		
		imgui.Text(u8("���� �� �� �����"))
		imgui.SameLine(150)
		if imgui.ToggleButton("fixtp", fixtp) then
		conf.amenu.fixtp = not conf.amenu.fixtp
		inicfg.save(cfg, 'MHelper.ini')
		end
		
	  imgui.EndChild()
end
function sel2()
imgui.BeginChild(u8'�����', imgui.ImVec2(606, 0), true)

if imgui.ColorEdit4(u8'���� ������', color) then
conf.style.rbutton = color.v[1]
conf.style.gbutton = color.v[2]
conf.style.bbutton = color.v[3]
conf.style.abutton = color.v[4]
inicfg.save(cfg, 'MHelper.ini')
end
imgui.SameLine(nil, 10)
if imgui.Button(u8'��������', imgui.ImVec2(75, 20)) then
color.v = imgui.ImFloat4(0.26, 0.59, 0.98, 0.40)
conf.style.rbutton = color.v[1]
conf.style.gbutton = color.v[2]
conf.style.bbutton = color.v[3]
conf.style.abutton = color.v[4]
inicfg.save(cfg, 'MHelper.ini')
end

if imgui.ColorEdit4(u8'���� ���� ����', colorfon) then
conf.style.rfon = colorfon.v[1]
conf.style.gfon = colorfon.v[2]
conf.style.bfon = colorfon.v[3]
conf.style.afon = colorfon.v[4]
inicfg.save(cfg, 'MHelper.ini')
end

imgui.SameLine(nil, 10)
if imgui.Button(u8'�������� ##2', imgui.ImVec2(75, 20)) then
colorfon.v = imgui.ImFloat4(0.06, 0.06, 0.06, 0.94)
conf.style.rfon = colorfon.v[1]
conf.style.gfon = colorfon.v[2]
conf.style.bfon = colorfon.v[3]
conf.style.afon = colorfon.v[4]
inicfg.save(cfg, 'MHelper.ini')
end

if imgui.ColorEdit4(u8'���� ���������', colorname) then
conf.style.rname = colorname.v[1]
conf.style.gname = colorname.v[2]
conf.style.bname = colorname.v[3]
conf.style.aname = colorname.v[4]
inicfg.save(cfg, 'MHelper.ini')
end

imgui.SameLine(nil, 10)
if imgui.Button(u8'�������� ##3', imgui.ImVec2(75, 20)) then
colorname.v = imgui.ImFloat4(0.06, 0.06, 0.06, 0.94)
conf.style.rname = colorname.v[1]
conf.style.gname = colorname.v[2]
conf.style.bname = colorname.v[3]
conf.style.aname = colorname.v[4]
inicfg.save(cfg, 'MHelper.ini')
end
--OnDrawFrame()
if imgui.Combo(u8'����� ����', selected_item, {u8'���� �1', u8'���� �2', u8'���� �3', u8'���� �4', u8'���� �5'}, 5) then
  if selected_item.v == 0 then
    bluetheme()
	conf.style.theme = 0
	inicfg.save(cfg, 'MHelper.ini')
  end
    if selected_item.v == 1 then
        style2()
		conf.style.theme = 1
		inicfg.save(cfg, 'MHelper.ini')
    end
    if selected_item.v == 2 then
        style3()
		conf.style.theme = 2
		inicfg.save(cfg, 'MHelper.ini')
    end
    if selected_item.v == 3 then
style4()
conf.style.theme = 3
inicfg.save(cfg, 'MHelper.ini')
    end
	if selected_item.v == 4 then
	style()
	conf.style.theme = 4
	inicfg.save(cfg, 'MHelper.ini')
	end
end

imgui.EndChild()
end
function sel3()
imgui.BeginChild(u8'����', imgui.ImVec2(606, 0), true)
local tLastKeys = {}
if imgui.HotKey("##bindnumer1", ActiveClockMenu, tLastKeys, 100) then
			rkeys.changeHotKey(bindClock, ActiveClockMenu.v)
			sampAddChatMessage("�������! ������ ��������: {F4A460}" .. table.concat(rkeys.getKeysName(tLastKeys.v), " + ") .. "{ffffff} | �����: {F4A460}" .. table.concat(rkeys.getKeysName(ActiveClockMenu.v), " + "), -1)
			sampAddChatMessage("�������� ��������: {F4A460}" .. encodeJson(ActiveClockMenu.v), -1)

			conf.hotkey.bind1 = encodeJson(ActiveClockMenu.v)
			inicfg.save(conf, 'MHelper.ini')
		end
		
		
imgui.EndChild()
end
function sel4()

imgui.BeginChild(u8'���', imgui.ImVec2(606, 0), true)
imgui.Text(u8'������� ����� ����, ����� ������ ��������� � �� 0.6 �������. (������� ���� ���� � ������)')
imgui.InputTextMultiline("##����� ��� �����", nakazaniya, imgui.ImVec2(300, 400))
if imgui.Button(u8'������ ���������', imgui.ImVec2(275, 30)) then
lua_thread.create(function()
for line in nakazaniya.v:gmatch("[^\r\n]+") do

wait(600)
sampSendChat(line)
end
end)

end
imgui.EndChild()
end
function sel5()
imgui.BeginChild(u8'���', imgui.ImVec2(606, 0), true)
--imgui.ColorEdit4(u8'���� ������', color)

--OnDrawFrame()

imgui.EndChild()
end
function sel6()
imgui.BeginChild(u8'�����', imgui.ImVec2(606, 0), true)
--imgui.ColorEdit4(u8'���� ������', color)

--OnDrawFrame()

imgui.EndChild()
end
function sel7()
imgui.BeginChild(u8'�����', imgui.ImVec2(606, 0), true)
imgui.Text(u8'����� ������� �������� - Dexter_Martelli\nVK: https://vk.com/dexter_martelli\n������ �������: https://vk.com/martellihelper\n\n���� ����� ������, ������� �� ������� ����� ����� ������� �������� � ��������.')
if imgui.Button(u8'VK ������������', imgui.ImVec2(130, 35) ) then -- ������ ������ ��������� ��� ���������
       os.execute("start https://vk.com/dexter_martelli")
	   end
	   if imgui.Button(u8'������ �������', imgui.ImVec2(130, 35) ) then -- ������ ������ ��������� ��� ���������
       os.execute("start https://vk.com/martellihelper")
	   end
	   
imgui.EndChild()
end


		
function proof(numb)
lua_thread.create(function()
        while true do
		wait(0)
		if sampIsDialogActive() then
		print('ok')
		local did = sampGetCurrentDialogId()
		if did and numb == 1 then
		sampSendDialogResponse(did, 1, 1, nil)
		end
		if did and numb == 2 then
		sampSendDialogResponse(did, 1, 2, nil)
		end
		if did and numb == 3 then
		sampSendDialogResponse(did, 1, 3, nil)
		end
		if did and numb == 4 then
		sampSendDialogResponse(did, 1, 4, nil)
		end
		if did and numb == 5 then
		sampSendDialogResponse(did, 1, 0, nil)
		end
		break
		end
		end
    end)

end

got = '��� ���� ��� ��������.'
	
function bluetheme()
    local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	local buttons = imgui.ImFloat4(conf.style.rbutton, conf.style.gbutton, conf.style.bbutton, conf.style.abutton)
	local fon = imgui.ImFloat4(conf.style.rfon, conf.style.gfon, conf.style.bfon, conf.style.afon)
	local name = imgui.ImFloat4(conf.style.rname, conf.style.gname, conf.style.bname, conf.style.aname)
	style.WindowRounding = 1.5
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	style.ChildWindowRounding = 2
	style.FrameRounding = 2
	style.ItemSpacing = imgui.ImVec2(4.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	-- style.Alpha =
	style.WindowPadding = imgui.ImVec2(10.0, 10.0)
	-- style.WindowMinSize =
	style.FramePadding = imgui.ImVec2(2, 4)
	-- style.ItemInnerSpacing =
	-- style.TouchExtraPadding =
	-- style.IndentSpacing =
	-- style.ColumnsMinSpacing = ?
	style.ButtonTextAlign = imgui.ImVec2(0.50, 0.5)
	-- style.DisplayWindowPadding =
	-- style.DisplaySafeAreaPadding =
	-- style.AntiAliasedLines =
	-- style.AntiAliasedShapes =
	-- style.CurveTessellationTol =

    colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
    colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
    colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.TitleBg]                = name
    colors[clr.TitleBgActive]          = name
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
    colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
    colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Button]                 = buttons
    colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
    colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
    colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
    colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.Separator]              = colors[clr.Border]
    colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
    colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
    colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
    colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
    colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
    colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
    colors[clr.WindowBg]               = fon
    colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.ComboBg]                = colors[clr.PopupBg]
    colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
    colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
    colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.ModalWindowDarkening]   = ImVec4(0.261, 0.261, 0.261, 0.725)
end

local nameTag = false

-- fucked SOBEIT


function initializeRender()
  font = renderCreateFont("Tahoma", 10, FCR_BOLD + FCR_BORDER)
  font2 = renderCreateFont("Arial", 8, FCR_ITALICS + FCR_BORDER)
end


--- Functions
function rotateCarAroundUpAxis(car, vec)
  local mat = Matrix3X3(getVehicleRotationMatrix(car))
  local rotAxis = Vector3D(mat.up:get())
  vec:normalize()
  rotAxis:normalize()
  local theta = math.acos(rotAxis:dotProduct(vec))
  if theta ~= 0 then
    rotAxis:crossProduct(vec)
    rotAxis:normalize()
    rotAxis:zeroNearZero()
    mat = mat:rotate(rotAxis, -theta)
  end
  setVehicleRotationMatrix(car, mat:get())
end

function readFloatArray(ptr, idx)
  return representIntAsFloat(readMemory(ptr + idx * 4, 4, false))
end

function writeFloatArray(ptr, idx, value)
  writeMemory(ptr + idx * 4, 4, representFloatAsInt(value), false)
end

function getVehicleRotationMatrix(car)
  local entityPtr = getCarPointer(car)
  if entityPtr ~= 0 then
    local mat = readMemory(entityPtr + 0x14, 4, false)
    if mat ~= 0 then
      local rx, ry, rz, fx, fy, fz, ux, uy, uz
      rx = readFloatArray(mat, 0)
      ry = readFloatArray(mat, 1)
      rz = readFloatArray(mat, 2)

      fx = readFloatArray(mat, 4)
      fy = readFloatArray(mat, 5)
      fz = readFloatArray(mat, 6)

      ux = readFloatArray(mat, 8)
      uy = readFloatArray(mat, 9)
      uz = readFloatArray(mat, 10)
      return rx, ry, rz, fx, fy, fz, ux, uy, uz
    end
  end
end

function setVehicleRotationMatrix(car, rx, ry, rz, fx, fy, fz, ux, uy, uz)
  local entityPtr = getCarPointer(car)
  if entityPtr ~= 0 then
    local mat = readMemory(entityPtr + 0x14, 4, false)
    if mat ~= 0 then
      writeFloatArray(mat, 0, rx)
      writeFloatArray(mat, 1, ry)
      writeFloatArray(mat, 2, rz)

      writeFloatArray(mat, 4, fx)
      writeFloatArray(mat, 5, fy)
      writeFloatArray(mat, 6, fz)

      writeFloatArray(mat, 8, ux)
      writeFloatArray(mat, 9, uy)
      writeFloatArray(mat, 10, uz)
    end
  end
end

function displayVehicleName(x, y, gxt)
  x, y = convertWindowScreenCoordsToGameScreenCoords(x, y)
  useRenderCommands(true)
  setTextWrapx(640.0)
  setTextProportional(true)
  setTextJustify(false)
  setTextScale(0.33, 0.8)
  setTextDropshadow(0, 0, 0, 0, 0)
  setTextColour(255, 255, 255, 230)
  setTextEdge(1, 0, 0, 0, 100)
  setTextFont(1)
  displayText(x, y, gxt)
end

function createPointMarker(x, y, z)
  pointMarker = createUser3dMarker(x, y, z + 0.3, 4)
end

function removePointMarker()
  if pointMarker then
    removeUser3dMarker(pointMarker)
    pointMarker = nil
  end
end

function getCarFreeSeat(car)
  if doesCharExist(getDriverOfCar(car)) then
    local maxPassengers = getMaximumNumberOfPassengers(car)
    for i = 0, maxPassengers do
      if isCarPassengerSeatFree(car, i) then
        return i + 1
      end
    end
    return nil -- no free seats
  else
    return 0 -- driver seat
  end
end

function jumpIntoCar(car)
  local seat = getCarFreeSeat(car)
  if not seat then return false end                         -- no free seats
  if seat == 0 then warpCharIntoCar(playerPed, car)         -- driver seat
  else warpCharIntoCarAsPassenger(playerPed, car, seat - 1) -- passenger seat
  end
  restoreCameraJumpcut()
  return true
end

function teleportPlayer(x, y, z)
  if isCharInAnyCar(playerPed) then
    setCharCoordinates(playerPed, x, y, z)
  end
  setCharCoordinatesDontResetAnim(playerPed, x, y, z)
end

function setCharCoordinatesDontResetAnim(char, x, y, z)
  if doesCharExist(char) then
    local ptr = getCharPointer(char)
    setEntityCoordinates(ptr, x, y, z)
  end
end

function setEntityCoordinates(entityPtr, x, y, z)
  if entityPtr ~= 0 then
    local matrixPtr = readMemory(entityPtr + 0x14, 4, false)
    if matrixPtr ~= 0 then
      local posPtr = matrixPtr + 0x30
      writeMemory(posPtr + 0, 4, representFloatAsInt(x), false) -- X
      writeMemory(posPtr + 4, 4, representFloatAsInt(y), false) -- Y
      writeMemory(posPtr + 8, 4, representFloatAsInt(z), false) -- Z
    end
  end
end

function showCursor(toggle)
  if toggle then
    sampSetCursorMode(CMODE_LOCKCAM)
  else
    sampToggleCursor(false)
  end
  cursorEnabled = toggle
end



function doKeyCheck()
if panel.v then
	if not isKeyCheckAvailable() then return end
	local isGMeh = isCharInAnyCar(playerPed)
	local veh = nil
	if isGMeh then veh = storeCarCharIsInNoSave(playerPed) end
	
	if isKeyJustPressed(VK_F12) and not sampIsChatInputActive() and not sampIsDialogActive() then
		if Activated == true then
			for k,v in pairs(Functions) do
				if isFuncEnabled(v.name) then
					switchFunc(v.name)
					table.insert(FuncsToReenable, v.name)
				end
			end
			Activated = false
		else
			for k,v in pairs(FuncsToReenable) do
				switchFunc(v)
			end
			FuncsToReenable = {}
			Activated = true
		end
	end
	
	if Activated == false then return end
	
	if isKeyJustPressed(VK_F5) or wh.v and not sampIsChatInputActive() and not sampIsDialogActive() then
	if switchFunc('WH') then
			nameTagOn()
		else
			nameTagOff()
			end
	end
	
	if isKeyJustPressed(VK_INSERT) or gm.v and not sampIsChatInputActive() and not sampIsDialogActive() then -- GM
		if switchFunc('GM') then
			setCharProofs(playerPed, true, true, true, true, true)
			writeMemory(0x96916E, 1, 1, false)
			state = true
			if isGMeh then
				setCarProofs(veh, true, true, true, true, true)
			end
		else
			state = false
			setCharProofs(playerPed, false, false, false, false, false)
			writeMemory(0x96916E, 1, 0, false)
			if isGMeh then
				setCarProofs(veh, false, false, false, false, false)
			end
		end
	end
	
	if isKeyJustPressed(VK_RSHIFT) or air.v and not sampIsChatInputActive() and not sampIsDialogActive() then -- airbrk
		if switchFunc('AirBrk') then
			local x, y, z = getCharCoordinates(playerPed)
			local rz = getCharHeading(playerPed)
			AirbrkCoords = {x, y, z, 0.0, 0.0, rz}
			if not AirBrk_multiplier then AirBrk_multiplier = 2.0 end
		end
	end
	
	if not isGMeh then
		if isKeyJustPressed(VK_B) and not sampIsChatInputActive() and not sampIsDialogActive() then -- fastwalk
			if switchFunc('FastWalk') then
				if not FastWalk_multiplier then FastWalk_multiplier = 1.1 end
				setPlayerNeverGetsTired(playerHandle, 1)
			else
				for k,v in pairs(Anims_1) do setCharAnimSpeed(playerPed, v, 1.0) end
				setPlayerNeverGetsTired(playerHandle, 0)
			end
		end
		if isKeyJustPressed(VK_O) or nofall.v and not sampIsChatInputActive() and not sampIsDialogActive() then -- nofall
			switchFunc('NoFall')
		end
	else
		
	end
	end
end

function nameTagOn()
	local pStSet = sampGetServerSettingsPtr();
	NTdist = mem.getfloat(pStSet + 39)
	NTwalls = mem.getint8(pStSet + 47)
	NTshow = mem.getint8(pStSet + 56)
	mem.setfloat(pStSet + 39, 1488.0)
	mem.setint8(pStSet + 47, 0)
	mem.setint8(pStSet + 56, 1)
	nameTag = true
end

function nameTagOff()
	local pStSet = sampGetServerSettingsPtr();
	mem.setfloat(pStSet + 39, NTdist)
	mem.setint8(pStSet + 47, NTwalls)
	mem.setint8(pStSet + 56, NTshow)
	nameTag = false
end

function doFastCheatWork()
if panel.v then
	local isGMeh = isCharInAnyCar(playerPed)
	local veh = nil
	if isGMeh then veh = storeCarCharIsInNoSave(playerPed) end
	
	if isKeyJustPressed(VK_F3) and not sampIsChatInputActive() and not sampIsDialogActive() then -- suicide
		if not isGMeh then
			setCharHealth(playerPed, 0)
		else
			setCarHealth(veh, 0)
		end
	end
	
	if isKeyJustPressed(222) and not sampIsChatInputActive() and not sampIsDialogActive() then -- unfreeze
		setPlayerControl(playerHandle, 1)
		freezeCharPosition(playerPed, 0)
		restoreCameraJumpcut()
		if not isGMeh then
			local x, y, z = getCharCoordinates(playerPed)
			setCharCoordinates(playerPed, x, y, z - 1)
		end
	end
	
	if isKeyJustPressed(VK_HOME) and not sampIsChatInputActive() and not sampIsDialogActive() then
		local px, py, pz = getCharCoordinates(playerPed)
		local car, dist = nil, 999
		for k,v in pairs(VehiclePool) do
			if v.gtaid and v.gtaid ~= veh then
				local x, y, z = getCarCoordinates(v.gtaid)
				local d = getDistanceBetweenCoords3d(px, py, pz, x, y, z)
				if d < dist then
					car, dist = v.gtaid, d
				end
			end
		end
		if car then
			if isFuncEnabled('AirBrk') then switchFunc('AirBrk') end
			warpCharIntoCar(playerPed, car)
			restoreCameraJumpcut()
		end
	end
	
	if isGMeh then
		if isKeyJustPressed(VK_1) and not sampIsChatInputActive() and not sampIsDialogActive() then -- fix
			fixCar(veh)
		end
		
		if isKeyDown(VK_LMENU) and not sampIsChatInputActive() and not sampIsDialogActive() then -- speedhack
			local vecx, vecy, vecz = getCarSpeedVector(veh)
			local heading = getCarHeading(veh)
			local turbo = fpsCorrection() / 42
			local xforce, yforce, zforce = turbo, turbo, turbo
			local Sin, Cos = math.sin(-math.rad(heading)), math.cos(-math.rad(heading))
			if vecx > -0.01 and vecx < 0.01 then xforce = 0.0 end
			if vecy > -0.01 and vecy < 0.01 then yforce = 0.0 end
			if vecz < 0 then zforce = -zforce end
			if vecz > -2 and vecz < 15 then zforce = 0.0 end
			if Sin > 0 and vecx < 0 then xforce = -xforce end
			if Sin < 0 and vecx > 0 then xforce = -xforce end
			if Cos > 0 and vecy < 0 then yforce = -yforce end
			if Cos < 0 and vecy > 0 then yforce = -yforce end
			applyForceToCar(veh, xforce * Sin, yforce * Cos, zforce / 2, 0.0, 0.0, 0.0)
		end
		
		if isKeyDown(0xBF) and not sampIsChatInputActive() and not sampIsDialogActive() then -- brake
			local vecx, vecy, vecz = getCarSpeedVector(veh)
			local slowfactor = 750 / fpsCorrection()
			applyForceToCar(veh, -vecx / slowfactor, -vecy / slowfactor, -vecz / slowfactor, 0.0, 0.0, 0.0)
		end
		
		if isKeyDown(VK_B) and not sampIsChatInputActive() and not sampIsDialogActive() then -- hop
			local vecx, vecy, vecz = getCarSpeedVector(veh)
			if vecz < 7.0 then applyForceToCar(veh, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0) end
		end
		
		if isKeyDown(VK_DELETE) and not sampIsChatInputActive() and not sampIsDialogActive() then -- flip
			local heading = getCarHeading(veh)
			heading = heading + 2 * fpsCorrection()
			if heading > 360 then heading = heading - 360 end
			setCarHeading(veh, heading)
		end
		
		if isKeyJustPressed(VK_BACK) and not sampIsChatInputActive() and not sampIsDialogActive() then -- turn FUCK THIS
			local vecx, vecy, vecz = getCarSpeedVector(veh)
			applyForceToCar(veh, -vecx / 25, -vecy / 25, -vecz / 25, 0.0, 0.0, 0.0)
			local x, y, z, w = getVehicleQuaternion(veh)
			local matrix = {convertQuaternionToMatrix(w, x, y, z)}
			matrix[1] = -matrix[1]
			matrix[2] = -matrix[2]
			matrix[4] = -matrix[4]
			matrix[5] = -matrix[5]
			matrix[7] = -matrix[7]
			matrix[8] = -matrix[8]
			w, x, y, z = convertMatrixToQuaternion(matrix[1], matrix[2], matrix[3], matrix[4], matrix[5], matrix[6], matrix[7], matrix[8], matrix[9])
			setVehicleQuaternion(veh, x, y, z, w)
		end
		
		if isKeyJustPressed(VK_N) and not sampIsChatInputActive() and not sampIsDialogActive() then -- fast exit
			local x, y, z = getCarCoordinates(veh)
			warpCharFromCarToCoord(playerPed, x, y, z + 1)
		end
	end
	end
end

function doCheatWork()
if panel.v then
	local isGMeh = isCharInAnyCar(playerPed)
	local veh = nil
	if isGMeh then veh = storeCarCharIsInNoSave(playerPed) end
		
	if isFuncEnabled('GM') then
		if isGMeh then
			setCarProofs(veh, true, true, true, true, true)
		end
		if isCharDead(playerPed) then
			switchFunc('GM')
			postNotification('GM disabled')
		end
	end
	
	if isFuncEnabled('AirBrk') then
		local heading = getCharHeading(playerPed)
		if isGMeh then
			heading = getCarHeading(veh)
		end
		if isKeyCheckAvailable() then
			local multiplier = AirBrk_multiplier * fpsCorrection()
			local camx, camy, camz = getActiveCameraCoordinates()
			local targetx, targety, targetz = getActiveCameraPointAt()
			local heading2 = getHeadingFromVector2d(targetx - camx, targety - camy)
			if isKeyDown(VK_W) then
				AirbrkCoords[1] = AirbrkCoords[1] + multiplier * math.sin(-math.rad(heading2))
				AirbrkCoords[2] = AirbrkCoords[2] + multiplier * math.cos(-math.rad(heading2))
				if not isGMeh then setCharHeading(playerPed, heading2)
				else setCarHeading(veh, heading2) end
			elseif isKeyDown(VK_S) then
				AirbrkCoords[1] = AirbrkCoords[1] - multiplier * math.sin(-math.rad(heading))
				AirbrkCoords[2] = AirbrkCoords[2] - multiplier * math.cos(-math.rad(heading))
			end
			if isKeyDown(VK_A) then
				AirbrkCoords[1] = AirbrkCoords[1] - multiplier * math.sin(-math.rad(heading - 90))
				AirbrkCoords[2] = AirbrkCoords[2] - multiplier * math.cos(-math.rad(heading - 90))
			elseif isKeyDown(VK_D) then
				AirbrkCoords[1] = AirbrkCoords[1] - multiplier * math.sin(-math.rad(heading + 90))
				AirbrkCoords[2] = AirbrkCoords[2] - multiplier * math.cos(-math.rad(heading + 90))
			end
			if isKeyDown(0xBB) then
				if AirBrk_multiplier < 15 then AirBrk_multiplier = AirBrk_multiplier + math.floor(10 * fpsCorrection()) / 100 end
				postNotification(string.format('AirBrk speed: %.2f', AirBrk_multiplier))
			elseif isKeyDown(0xBD) then
				if AirBrk_multiplier > 0.1 then AirBrk_multiplier = AirBrk_multiplier - math.floor(10 * fpsCorrection()) / 100 end
				postNotification(string.format('AirBrk speed: %.2f', AirBrk_multiplier))
			end
			if isKeyDown(VK_SPACE) then AirbrkCoords[3] = AirbrkCoords[3] + multiplier / 1.5 end
			if isKeyDown(VK_LSHIFT) and AirbrkCoords[3] > -95.0 then AirbrkCoords[3] = AirbrkCoords[3] - multiplier / 1.5 end
		end
		
		setCharCoordinates(playerPed, AirbrkCoords[1], AirbrkCoords[2], AirbrkCoords[3] - 1)
	end
	
	if not isGMeh then
		if isFuncEnabled('FastWalk') then
			local power = getFuncExtra('FastWalk')
			if isKeyDown(0xBB) then
				if FastWalk_multiplier < 15 then FastWalk_multiplier = FastWalk_multiplier + math.floor(5 * fpsCorrection()) / 100 end
				postNotification(string.format('FastWalk speed: %.2f', FastWalk_multiplier))
			elseif isKeyDown(0xBD) then
				if FastWalk_multiplier > 1 then FastWalk_multiplier = FastWalk_multiplier - math.floor(5 * fpsCorrection()) / 100 end
				postNotification(string.format('FastWalk speed: %.2f', FastWalk_multiplier))
			end
			for k,v in pairs(Anims_1) do setCharAnimSpeed(playerPed, v, FastWalk_multiplier) end
		end
		
		if isFuncEnabled('NoFall') then
			if isCharPlayingAnim(playerPed, 'KO_SKID_BACK') or isCharPlayingAnim(playerPed, 'FALL_COLLAPSE') then
				local x, y, z = getCharCoordinates(playerPed)
				setCharCoordinates(playerPed, x, y, z - 1)
			end
		end
	end
	end
end

function doRender()
if panel.v then
	renderDrawBoxWithBorder(0, resY - 20, resX, 20, 0x80000000, 1, 0xFF000000)
	renderDrawLine(52, resY - 1, 52, resY - 19, 1, 0xFF000000)
	
	-- render hp
	local hp = getCharHealth(playerPed)
	local hp2 = hp
	if hp > 100 then hp = 100 end
	if hp > 0 then renderDrawBox(1, resY - 10, math.floor(hp / 2) + 1, 9, 0xAACC0000) end
	renderFontDrawText(font2, 'HP: ' .. tostring(hp2), 1, resY - 11, 0xFFFFFFFF)
	
	-- render ar/veh hp
	if not isCharInAnyCar(playerPed) then
		hp = getCharArmour(playerPed)
		hp2 = hp
		if hp > 100 then hp = 100 end
		if hp > 0 then renderDrawBox(1, resY - 19, math.floor(hp / 2) + 1, 9, 0xAAAAAAAA) end
		renderFontDrawText(font2, 'AR: ' .. tostring(hp2), 1, resY - 20, 0xFFFFFFFF)
	else
		local veh = storeCarCharIsInNoSave(playerPed)
		hp = math.ceil((getCarHealth(veh) - 250) / 7.5)
		hp2 = hp
		if hp > 100 then hp = 100 end
		if hp > 0 then renderDrawBox(1, resY - 19, math.floor(hp / 2) + 1, 9, 0xAAAAAAAA) end
		renderFontDrawText(font2, 'VEH: ' .. tostring(hp2), 1, resY - 20, 0xFFFFFFFF)
	end
	
	-- now funcs
	local renderposX, renderposY = 55, resY - 19
	local text = nil
	for k,v in pairs(Functions) do
		text = '['
		renderFontDrawText(font, text, renderposX, renderposY, 0xFFAAAAAA)
		renderposX = renderposX + renderGetFontDrawTextLength(font, text)
		text = v.name
		if not v.data.activated then
			renderFontDrawText(font, text, renderposX, renderposY, 0xDDCCCCCC)
		else
			if v.data.extra then text = text .. ': ' .. v.data.extra end
			renderFontDrawText(font, text, renderposX, renderposY, 0xFF4585C5)
		end
		renderposX = renderposX + renderGetFontDrawTextLength(font, text)
		text = '] '
		renderFontDrawText(font, text, renderposX, renderposY, 0xFFAAAAAA)
		renderposX = renderposX + renderGetFontDrawTextLength(font, text)
	end
	
	-- misc info
	renderDrawLine(renderposX, resY - 1, renderposX, renderposY, 1, 0xFF000000)
	renderposX = renderposX + 3
	local x, y, z = getCharCoordinates(playerPed)
	text = string.format('x: %.1f | y: %.1f | z: %.1f | a: %.1f | Interior: %d ', x, y, z, getCharHeading(playerPed), getActiveInterior())
	renderFontDrawText(font, text, renderposX, renderposY, 0xFFAAAAAA)
	renderposX = renderposX + renderGetFontDrawTextLength(font, text)
	if isCharInAnyCar(playerPed) then
		local veh = storeCarCharIsInNoSave(playerPed)
		text = string.format('s%.1f', getCarSpeed(veh) * 3.91)
		renderFontDrawText(font, text, renderposX, renderposY, 0xFFAAAAAA)
		renderposX = renderposX + renderGetFontDrawTextLength(font, text)
	end
	
	local ms = getMs()
	-- notif
	if Notification.posttime and ms - Notification.posttime < 2500 then
		renderposX = renderGetFontDrawTextLength(font, Notification.name)
		local rendcolor = -1
		local heh = ms - Notification.posttime - 2000
		if heh > 0 then
			rendcolor = bit.bor(bit.lshift((500 - heh) / 2, 24), bit.lshift(255, 16), bit.lshift(255, 8), 255)
		end
		renderFontDrawText(font, Notification.name, (resX - renderposX) / 2, renderposY - 19, rendcolor)
	end
	end
end

function initCheats()
	FuncsOptimize = {}
	for k,v in pairs(Functions) do
		Functions[k].data = {activated = false, extra = nil}
		FuncsOptimize[v.name] = k
	end
	if isPlayerPlaying(playerHandle) then
		local p = sampGetVehiclePoolPtr() + 12404
		for i = 0, 1999 do
			if readMemory(p, 4, false) == 1 then
				local result, handle = sampGetCarHandleBySampVehicleId(i)
				if result then VehiclePool[i] = {gtaid = handle} end
			end
			p = p + 4
		end
	end
end

function onReceiveRpc(id, bs)
	if id == RPC_SCRWORLDVEHICLEADD then
		local id = raknetBitStreamReadInt16(bs)
		VehiclePool[id] = {gtaid = nil}
	elseif id == RPC_SCRWORLDVEHICLEREMOVE then
		local id = raknetBitStreamReadInt16(bs)
		VehiclePool[id] = nil
	end
end

function getFunc(name)
	return FuncsOptimize[name]
end

function isFuncEnabled(name)
	return Functions[getFunc(name)].data.activated
end

function switchFunc(name)
	local k = getFunc(name)
	Functions[k].data.activated = not Functions[k].data.activated
	return Functions[k].data.activated
end

function getFuncExtra(name)
	return Functions[getFunc(name)].data.extra
end

function setFuncExtra(name, value)
	Functions[getFunc(name)].data.extra = value
end

function isKeyCheckAvailable()
	if not isSampfuncsLoaded() then
		return true
	end
	return not isSampfuncsConsoleActive() and not sampIsChatInputActive() and not sampIsDialogActive()
end

function postNotification(name)
	Notification.name = name
	Notification.posttime = getMs()
end

function getMs()
	return os.clock() * 1000
end

function fpsCorrection()
	return representIntAsFloat(readMemory(0xB7CB5C, 4, false))
end

Anims_1 = {'WALK_PLAYER', 'GUNCROUCHFWD', 'GUNCROUCHBWD', 'GUNMOVE_BWD', 'GUNMOVE_FWD', 'GUNMOVE_L', 'GUNMOVE_R', 'RUN_GANG1', 'JOG_FEMALEA', 'JOG_MALEA', 'RUN_CIVI', 'RUN_CSAW', 'RUN_FAT', 'RUN_FATOLD', 'RUN_OLD', 'RUN_ROCKET', 'RUN_WUZI', 'SPRINT_WUZI', 'WALK_ARMED', 'WALK_CIVI', 'WALK_CSAW', 'WALK_DRUNK', 'WALK_FAT', 'WALK_FATOLD', 'WALK_GANG1', 'WALK_GANG2', 'WALK_OLD', 'WALK_SHUFFLE', 'WALK_START', 'WALK_START_ARMED', 'WALK_START_CSAW', 'WALK_START_ROCKET', 'WALK_WUZI', 'WOMAN_WALKBUSY', 'WOMAN_WALKFATOLD', 'WOMAN_WALKNORM', 'WOMAN_WALKOLD', 'WOMAN_RUNFATOLD', 'WOMAN_WALKPRO', 'WOMAN_WALKSEXY', 'WOMAN_WALKSHOP', 'RUN_1ARMED', 'RUN_ARMED', 'RUN_PLAYER', 'WALK_ROCKET', 'CLIMB_IDLE', 'MUSCLESPRINT', 'CLIMB_PULL', 'CLIMB_STAND', 'CLIMB_STAND_FINISH', 'SWIM_BREAST', 'SWIM_CRAWL', 'SWIM_DIVE_UNDER', 'SWIM_GLIDE', 'MUSCLERUN', 'WOMAN_RUN', 'WOMAN_RUNBUSY', 'WOMAN_RUNPANIC', 'WOMAN_RUNSEXY', 'SPRINT_CIVI', 'SPRINT_PANIC', 'SWAT_RUN', 'FATSPRINT'}


-- funcs for texdraw and other

function test(arg)
local x, y, z = arg:match('(%d+) (%d+) (%d+)')
setMarker(1, x, y, z, 20, 0xFFFFFFFF)
end

function slezka(id)
sampSendChat('/sp ' .. id, -1)
end

function skick(id)
sampSendChat('/skick ' .. id)
end

function slapp(id)
sampSendChat('/slap ' .. id, -1)
end

function ghtp(id)
sampSendChat('/gethere ' .. id, -1)
end

function gtp(id)
sampSendChat('/goto ' .. id, -1)
end

function getBodyPartCoordinates(id, handle)
  local pedptr = getCharPointer(handle)
  local vec = ffi.new("float[3]")
  getBonePosition(ffi.cast("void*", pedptr), vec, id, true)
  return vec[0], vec[1], vec[2]
end

function drawClickableText(font, text, posX, posY, color, colorA)
    renderFontDrawText(font, text, posX, posY, color)
    local textLenght = renderGetFontDrawTextLength(font, text)
    local textHeight = renderGetFontDrawHeight(font)
    local curX, curY = getCursorPos()
      if curX >= posX and curX <= posX + textLenght and curY >= posY and curY <= posY + textHeight then
        renderFontDrawText(font, text, posX, posY, colorA)
        if wasKeyPressed(1) then
            return true
        end
    end
end
 
function setMarker(type, x, y, z, radius, color)
    deleteCheckpoint(marker)
    removeBlip(checkpoint)
    checkpoint = addBlipForCoord(x, y, z)
    marker = createCheckpoint(type, x, y, z, 1, 1, 1, radius)
    changeBlipColour(checkpoint, color)
    lua_thread.create(function()
    repeat
        wait(0)
        local x1, y1, z1 = getCharCoordinates(PLAYER_PED)
        until getDistanceBetweenCoords3d(x, y, z, x1, y1, z1) < radius or not doesBlipExist(checkpoint)
        deleteCheckpoint(marker)
        removeBlip(checkpoint)
        addOneOffSound(0, 0, 0, 1149)
    end)
end
 
function getClosestPlayerId(di)
    local minDist = di
    local closestId = -1
    local x, y, z = getCharCoordinates(PLAYER_PED)
    for i = 0, 999 do
        local streamed, pedID = sampGetCharHandleBySampPlayerId(i)
        if streamed then
            local xi, yi, zi = getCharCoordinates(pedID)
            local dist = math.sqrt( (xi - x) ^ 2 + (yi - y) ^ 2 + (zi - z) ^ 2 )
            if dist < minDist then
			--	sampAddChatMessage(dist, -1)
				--print(minDist)
                minDist = dist
                closestId = i
            end
        end
    end
    return closestId
end
 
function regnewrep()
cfg.DialogID.DID = iddial
newid  = string.format('[MHelper] ����� ID ������� ��� {EE82EE}�������{1E90FF} ���������������!')
sampAddChatMessage(newid, 0x1E90FF)
inicfg.save(cfg, 'MHelper.ini')
end
 
function mypos()
local x, y, z = getCharCoordinates(playerPed)
local interior = getCharActiveInterior(playerPed)
poss  = string.format('[MHelper] X: {EE82EE}' .. x .. '{1E90FF} Y: {EE82EE}' .. y .. '{1E90FF} Z: {EE82EE}' .. z)
inter = string.format('[MHelper] Interior: {EE82EE}' .. interior)
sampAddChatMessage(poss, 0x1E90FF)
sampAddChatMessage(inter, 0x1E90FF)
end
 
function getClosestCarId()
  local minDist = 9999
  local closestId = -1
  local x, y, z = getCharCoordinates(PLAYER_PED)
  for i, k in ipairs(getAllVehicles()) do
    local streamed, carId = sampGetVehicleIdByCarHandle(k)
    if streamed then
      local xi, yi, zi = getCarCoordinates(k)
      local dist = math.sqrt( (xi - x) ^ 2 + (yi - y) ^ 2 + (zi - z) ^ 2 )
      if dist < minDist then
        minDist = dist
        closestId = carId
      end
    end
  end
  return closestId
end
   
faq = 0

got3 = 0

-- fucked styles for ImGUI

function style2()
imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4
local ImVec2 = imgui.ImVec2

style.WindowPadding = ImVec2(15, 4)
style.WindowRounding = 6.0
style.FramePadding = ImVec2(5, 1)
style.FrameRounding = 1.0
style.ItemSpacing = ImVec2(12, 8)
style.ItemInnerSpacing = ImVec2(8, 6)
style.IndentSpacing = 25.0
style.ScrollbarSize = 15.0
style.ScrollbarRounding = 9.0
style.GrabMinSize = 5.0
style.GrabRounding = 3.0

 colors[clr.Text]                 = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.TextDisabled]         = ImVec4(0.73, 0.75, 0.74, 1.00)
    colors[clr.WindowBg]             = ImVec4(0.00, 0.00, 0.00, 0.94)
    colors[clr.ChildWindowBg]        = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.PopupBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
    colors[clr.Border]               = ImVec4(0.20, 0.20, 0.20, 0.50)
    colors[clr.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
    colors[clr.FrameBg]              = ImVec4(0.26, 0.37, 0.98, 0.54)
    colors[clr.FrameBgHovered]       = ImVec4(0.33, 0.33, 0.93, 0.40)
    colors[clr.FrameBgActive]        = ImVec4(0.44, 0.44, 0.99, 0.67)
    colors[clr.TitleBg]              = ImVec4(0.30, 0.33, 0.95, 0.67)
    colors[clr.TitleBgActive]        = ImVec4(0.00, 0.16, 1.00, 1.00)
    colors[clr.TitleBgCollapsed]     = ImVec4(0.22, 0.19, 1.00, 0.67)
    colors[clr.MenuBarBg]            = ImVec4(0.39, 0.56, 1.00, 1.00)
    colors[clr.ScrollbarBg]          = ImVec4(0.02, 0.02, 0.02, 0.53)
    colors[clr.ScrollbarGrab]        = ImVec4(0.31, 0.31, 0.31, 1.00)
    colors[clr.ScrollbarGrabHovered] = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.ScrollbarGrabActive]  = ImVec4(0.51, 0.51, 0.51, 1.00)
    colors[clr.ComboBg]              = ImVec4(0.20, 0.20, 0.20, 0.99)
    colors[clr.CheckMark]            = ImVec4(1.00, 1.00, 1.00, 1.00)
    colors[clr.SliderGrab]           = ImVec4(0.30, 0.41, 0.99, 1.00)
    colors[clr.SliderGrabActive]     = ImVec4(0.52, 0.52, 0.97, 1.00)
    colors[clr.Button]               = ImVec4(0.11, 0.13, 0.93, 0.65)
    colors[clr.ButtonHovered]        = ImVec4(0.41, 0.57, 1.00, 0.65)
    colors[clr.ButtonActive]         = ImVec4(0.20, 0.20, 0.20, 0.50)
    colors[clr.Header]               = ImVec4(0.15, 0.19, 1.00, 0.54)
    colors[clr.HeaderHovered]        = ImVec4(0.03, 0.24, 0.57, 0.65)
    colors[clr.HeaderActive]         = ImVec4(0.36, 0.40, 0.95, 0.00)
    colors[clr.Separator]            = ImVec4(0.43, 0.43, 0.50, 0.50)
    colors[clr.SeparatorHovered]     = ImVec4(0.20, 0.42, 0.98, 0.54)
    colors[clr.SeparatorActive]      = ImVec4(0.20, 0.40, 0.93, 0.54)
    colors[clr.ResizeGrip]           = ImVec4(0.01, 0.17, 1.00, 0.54)
    colors[clr.ResizeGripHovered]    = ImVec4(0.21, 0.51, 0.98, 0.45)
    colors[clr.ResizeGripActive]     = ImVec4(0.04, 0.55, 0.95, 0.66)
    colors[clr.CloseButton]          = ImVec4(0.41, 0.41, 0.41, 1.00)
    colors[clr.CloseButtonHovered]   = ImVec4(0.10, 0.21, 0.98, 1.00)
    colors[clr.CloseButtonActive]    = ImVec4(0.02, 0.26, 1.00, 1.00)
    colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
    colors[clr.PlotLinesHovered]     = ImVec4(0.18, 0.15, 1.00, 1.00)
    colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
    colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
    colors[clr.TextSelectedBg]       = ImVec4(0.26, 0.59, 0.98, 0.35)
    colors[clr.ModalWindowDarkening] = ImVec4(0.80, 0.80, 0.80, 0.35)
end

function style4()
imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2

    style.WindowPadding = imgui.ImVec2(8, 8)
    style.WindowRounding = 6
    style.ChildWindowRounding = 5
    style.FramePadding = imgui.ImVec2(5, 3)
    style.FrameRounding = 3.0
    style.ItemSpacing = imgui.ImVec2(5, 4)
    style.ItemInnerSpacing = imgui.ImVec2(4, 4)
    style.IndentSpacing = 21
    style.ScrollbarSize = 10.0
    style.ScrollbarRounding = 13
    style.GrabMinSize = 8
    style.GrabRounding = 1
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ButtonTextAlign = imgui.ImVec2(0.5, 0.5)

    colors[clr.Text]                   = ImVec4(0.95, 0.96, 0.98, 1.00);
    colors[clr.TextDisabled]           = ImVec4(0.29, 0.29, 0.29, 1.00);
    colors[clr.WindowBg]               = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.ChildWindowBg]          = ImVec4(0.12, 0.12, 0.12, 1.00);
    colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94);
    colors[clr.Border]                 = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.BorderShadow]           = ImVec4(1.00, 1.00, 1.00, 0.10);
    colors[clr.FrameBg]                = ImVec4(0.22, 0.22, 0.22, 1.00);
    colors[clr.FrameBgHovered]         = ImVec4(0.18, 0.18, 0.18, 1.00);
    colors[clr.FrameBgActive]          = ImVec4(0.09, 0.12, 0.14, 1.00);
    colors[clr.TitleBg]                = ImVec4(0.14, 0.14, 0.14, 0.81);
    colors[clr.TitleBgActive]          = ImVec4(0.14, 0.14, 0.14, 1.00);
    colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51);
    colors[clr.MenuBarBg]              = ImVec4(0.20, 0.20, 0.20, 1.00);
    colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.39);
    colors[clr.ScrollbarGrab]          = ImVec4(0.36, 0.36, 0.36, 1.00);
    colors[clr.ScrollbarGrabHovered]   = ImVec4(0.18, 0.22, 0.25, 1.00);
    colors[clr.ScrollbarGrabActive]    = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.ComboBg]                = ImVec4(0.24, 0.24, 0.24, 1.00);
    colors[clr.CheckMark]              = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrab]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.SliderGrabActive]       = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.Button]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ButtonHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ButtonActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.Header]                 = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.HeaderHovered]          = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.HeaderActive]           = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.ResizeGrip]             = ImVec4(1.00, 0.28, 0.28, 1.00);
    colors[clr.ResizeGripHovered]      = ImVec4(1.00, 0.39, 0.39, 1.00);
    colors[clr.ResizeGripActive]       = ImVec4(1.00, 0.19, 0.19, 1.00);
    colors[clr.CloseButton]            = ImVec4(0.40, 0.39, 0.38, 0.16);
    colors[clr.CloseButtonHovered]     = ImVec4(0.40, 0.39, 0.38, 0.39);
    colors[clr.CloseButtonActive]      = ImVec4(0.40, 0.39, 0.38, 1.00);
    colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00);
    colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00);
    colors[clr.PlotHistogram]          = ImVec4(1.00, 0.21, 0.21, 1.00);
    colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.18, 0.18, 1.00);
    colors[clr.TextSelectedBg]         = ImVec4(1.00, 0.32, 0.32, 1.00);
    colors[clr.ModalWindowDarkening]   = ImVec4(0.26, 0.26, 0.26, 0.60);
end

function style()
imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4
local ImVec2 = imgui.ImVec2

style.WindowPadding = ImVec2(15, 15)
style.WindowRounding = 6.0
style.FramePadding = ImVec2(5, 5)
style.FrameRounding = 4.0
style.ItemSpacing = ImVec2(12, 8)
style.ItemInnerSpacing = ImVec2(8, 6)
style.IndentSpacing = 25.0
style.ScrollbarSize = 15.0
style.ScrollbarRounding = 9.0
style.GrabMinSize = 5.0
style.GrabRounding = 3.0

colors[clr.Text] = ImVec4(0.80, 0.80, 0.83, 1.00)
colors[clr.TextDisabled] = ImVec4(0.24, 0.23, 0.29, 1.00)
colors[clr.WindowBg] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.ChildWindowBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
colors[clr.PopupBg] = ImVec4(0.07, 0.07, 0.09, 1.00)
colors[clr.Border] = ImVec4(0.80, 0.80, 0.83, 0.88)
colors[clr.BorderShadow] = ImVec4(0.92, 0.91, 0.88, 0.00)
colors[clr.FrameBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.FrameBgHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
colors[clr.FrameBgActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.TitleBg] = ImVec4(0.76, 0.31, 0.00, 1.00)
colors[clr.TitleBgCollapsed] = ImVec4(1.00, 0.98, 0.95, 0.75)
colors[clr.TitleBgActive] = ImVec4(0.80, 0.33, 0.00, 1.00)
colors[clr.MenuBarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.ScrollbarBg] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.ScrollbarGrab] = ImVec4(0.80, 0.80, 0.83, 0.31)
colors[clr.ScrollbarGrabHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.ScrollbarGrabActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.ComboBg] = ImVec4(0.19, 0.18, 0.21, 1.00)
colors[clr.CheckMark] = ImVec4(1.00, 0.42, 0.00, 0.53)
colors[clr.SliderGrab] = ImVec4(1.00, 0.42, 0.00, 0.53)
colors[clr.SliderGrabActive] = ImVec4(1.00, 0.42, 0.00, 1.00)
colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.ButtonHovered] = ImVec4(0.24, 0.23, 0.29, 1.00)
colors[clr.ButtonActive] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.Header] = ImVec4(0.10, 0.09, 0.12, 1.00)
colors[clr.HeaderHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.HeaderActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.ResizeGrip] = ImVec4(0.00, 0.00, 0.00, 0.00)
colors[clr.ResizeGripHovered] = ImVec4(0.56, 0.56, 0.58, 1.00)
colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
colors[clr.PlotLines] = ImVec4(0.40, 0.39, 0.38, 0.63)
colors[clr.PlotLinesHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
colors[clr.PlotHistogram] = ImVec4(0.40, 0.39, 0.38, 0.63)
colors[clr.PlotHistogramHovered] = ImVec4(0.25, 1.00, 0.00, 1.00)
colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end

style2()

function style3()
imgui.SwitchContext()
local style = imgui.GetStyle()
local colors = style.Colors
local clr = imgui.Col
local ImVec4 = imgui.ImVec4
local ImVec2 = imgui.ImVec2

style.WindowPadding = ImVec2(15, 15)
style.WindowRounding = 6.0
style.FramePadding = ImVec2(5, 5)
style.FrameRounding = 4.0
style.ItemSpacing = ImVec2(12, 8)
style.ItemInnerSpacing = ImVec2(8, 6)
style.IndentSpacing = 25.0
style.ScrollbarSize = 15.0
style.ScrollbarRounding = 9.0
style.GrabMinSize = 5.0
style.GrabRounding = 3.0

  colors[clr.Text]                 = ImVec4(1.00, 1.00, 1.00, 0.78)
            colors[clr.TextDisabled]         = ImVec4(1.00, 1.00, 1.00, 1.00)
            colors[clr.WindowBg]             = ImVec4(0.11, 0.15, 0.17, 1.00)
            colors[clr.ChildWindowBg]        = ImVec4(0.15, 0.18, 0.22, 1.00)
            colors[clr.PopupBg]              = ImVec4(0.08, 0.08, 0.08, 0.94)
            colors[clr.Border]               = ImVec4(0.43, 0.43, 0.50, 0.50)
            colors[clr.BorderShadow]         = ImVec4(0.00, 0.00, 0.00, 0.00)
            colors[clr.FrameBg]              = ImVec4(0.20, 0.25, 0.29, 1.00)
            colors[clr.FrameBgHovered]       = ImVec4(0.12, 0.20, 0.28, 1.00)
            colors[clr.FrameBgActive]        = ImVec4(0.09, 0.12, 0.14, 1.00)
            colors[clr.TitleBg]              = ImVec4(0.53, 0.20, 0.16, 0.65)
            colors[clr.TitleBgActive]        = ImVec4(0.56, 0.14, 0.14, 1.00)
            colors[clr.TitleBgCollapsed]     = ImVec4(0.00, 0.00, 0.00, 0.51)
            colors[clr.MenuBarBg]            = ImVec4(0.15, 0.18, 0.22, 1.00)
            colors[clr.ScrollbarBg]          = ImVec4(0.02, 0.02, 0.02, 0.39)
            colors[clr.ScrollbarGrab]        = ImVec4(0.20, 0.25, 0.29, 1.00)
            colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
            colors[clr.ScrollbarGrabActive]  = ImVec4(0.09, 0.21, 0.31, 1.00)
            colors[clr.ComboBg]              = ImVec4(0.20, 0.25, 0.29, 1.00)
            colors[clr.CheckMark]            = ImVec4(1.00, 0.28, 0.28, 1.00)
            colors[clr.SliderGrab]           = ImVec4(0.64, 0.14, 0.14, 1.00)
            colors[clr.SliderGrabActive]     = ImVec4(1.00, 0.37, 0.37, 1.00)
            colors[clr.Button]               = ImVec4(0.59, 0.13, 0.13, 1.00)
            colors[clr.ButtonHovered]        = ImVec4(0.69, 0.15, 0.15, 1.00)
            colors[clr.ButtonActive]         = ImVec4(0.67, 0.13, 0.07, 1.00)
            colors[clr.Header]               = ImVec4(0.20, 0.25, 0.29, 0.55)
            colors[clr.HeaderHovered]        = ImVec4(0.98, 0.38, 0.26, 0.80)
            colors[clr.HeaderActive]         = ImVec4(0.98, 0.26, 0.26, 1.00)
            colors[clr.Separator]            = ImVec4(0.50, 0.50, 0.50, 1.00)
            colors[clr.SeparatorHovered]     = ImVec4(0.60, 0.60, 0.70, 1.00)
            colors[clr.SeparatorActive]      = ImVec4(0.70, 0.70, 0.90, 1.00)
            colors[clr.ResizeGrip]           = ImVec4(0.26, 0.59, 0.98, 0.25)
            colors[clr.ResizeGripHovered]    = ImVec4(0.26, 0.59, 0.98, 0.67)
            colors[clr.ResizeGripActive]     = ImVec4(0.06, 0.05, 0.07, 1.00)
            colors[clr.CloseButton]          = ImVec4(0.40, 0.39, 0.38, 0.16)
            colors[clr.CloseButtonHovered]   = ImVec4(0.40, 0.39, 0.38, 0.39)
            colors[clr.CloseButtonActive]    = ImVec4(0.40, 0.39, 0.38, 1.00)
            colors[clr.PlotLines]            = ImVec4(0.61, 0.61, 0.61, 1.00)
            colors[clr.PlotLinesHovered]     = ImVec4(1.00, 0.43, 0.35, 1.00)
            colors[clr.PlotHistogram]        = ImVec4(0.90, 0.70, 0.00, 1.00)
            colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
            colors[clr.TextSelectedBg]       = ImVec4(0.25, 1.00, 0.00, 0.43)
            colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end



-- fucked SAMP.lua hooks

function sampev.onServerMessage(color, text) 

if text:match('�� ������� ��������������� � �����') then
local x, y, z = getCharCoordinates(PLAYER_PED)
if conf.amenu.fixtp == true then
lua_thread.create(function()
wait(500)
local ugu1, ugux, uguy, uguz = getTargetBlipCoordinates()
setCharCoordinates(PLAYER_PED, ugux, uguy, uguz + pervcordz - 14)
--sampAddChatMessage('OK', -1)
end)
end
end
	
if text:match('(%w+_%w+) .*(%d+) | %d+ �������.*') then
	local cumnick, cumidnick, numakk = text:match('(%w+_%w+) %p(%d+) | (%d+) �������.*')
	local cligr = sampGetPlayerColor(cumidnick)
	local cligr = ARGBtoRGB(cligr)
	cligr = string.format("%06X",cligr)
	--sampAddChatMessage(cligr, -1)
	 
	local ret = string.format('{' .. cligr .. '}' ..cumnick .. '{FFFFFF}' .. ' (' .. cumidnick .. ' ID | ' .. numakk .. ' - ����� ��������)')
	sampAddChatMessage(ret, -1)
	return false
	end
	
	local nickad, nickk = text:match('(%w+_%w+).+ ������������� ������ �� (%w+_%w+)')
	
if nickad and nickk then
	local _, ass = sampGetPlayerIdByCharHandle(PLAYER_PED)
	local name = sampGetPlayerNickname(ass)
	on = sampIsDialogActive()
	if nickad == name and on then
	sampAddChatMessage(nickk, -1)
	end
	end
	
	local nickadm, id_adm, nick1, id1, otvet = text:match("(%w+_%w+)(.*) ������� (%w+_%w+)%s%[(%d*)%]:(.+)")
	
if nickadm and nick1 and id1 then 
		faq = id
	  end
	  
	
	local adm, idadm, pro = text:match("%[A%] (%w+_%w+)%[(.*)%]: (.*)")
	
if pro then
	for i=1, 24 do
	local konec = pro:match(forms[i])
	local com, args = pro:match('/(%a*)%s(.*)')
	if konec then 
	printStyledString('NEW FORM', 3000, 4)
	if konec == 'unwarn' then
	got = string.format('/unwarn' .. args)
	end
	if konec == 'unjail' then
	got = string.format('/unjail' .. args)
	end
	if konec == 'offjail' then
	got = string.format('/offjail' .. args)
	end
	if konec == 'offmute' then
	got = string.format('/offmute' .. args)
	end
	if konec == 'offban' then
	got = string.format('/offban' .. args)
	end
	if konec == 'skick' then
	got = string.format('/skick' .. args)
	end
	if konec == 'sban' then
	got = string.format('/sban' .. args)
	end
	if konec == 'banip' then
	got = string.format('/banip' .. args)
	end
	if konec == 'offget' then
	got = string.format('/offget' .. args)
	else end
	end	
	got = pro
	end
	end

end

function sampGetPlayerIdByNickname(nick)
  nick = tostring(nick)
  local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
  if nick == sampGetPlayerNickname(myid) then return myid end
  for i = 0, 1003 do
    if sampIsPlayerConnected(i) and sampGetPlayerNickname(i) == nick then
      return i
    end
  end
end

function imgui.CustomButton(name, color, colorHovered, colorActive, size)
    local clr = imgui.Col
    imgui.PushStyleColor(clr.Button, color)
    imgui.PushStyleColor(clr.ButtonHovered, colorHovered)
    imgui.PushStyleColor(clr.ButtonActive, colorActive)
    if not size then size = imgui.ImVec2(0, 0) end
    local result = imgui.Button(name, size)
    imgui.PopStyleColor(3)
    return result
end

function enableDialog(bool)
    local memory = require 'memory'
    memory.setint32(sampGetDialogInfoPtr()+40, bool and 1 or 0, true)
end

function ARGBtoRGB(color)
    local a = bit.band(bit.rshift(color, 24), 0xFF)
    local r = bit.band(bit.rshift(color, 16), 0xFF)
    local g = bit.band(bit.rshift(color, 8), 0xFF)
    local b = bit.band(color, 0xFF)
    local rgb = b
    rgb = bit.bor(rgb, bit.lshift(g, 8))
    rgb = bit.bor(rgb, bit.lshift(r, 16))
    return rgb
end

function hint(text) -- ���
  lua_thread.create(
    function()
      imgui.TextDisabled("(?)")
      if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.TextUnformatted(u8(text))
        imgui.EndTooltip()
      end
  end)
end

function fahint(text) -- ���
  lua_thread.create(
    function()
      imgui.TextDisabled(fa.ICON_QUESTION_CIRCLE_O .. "")
      if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.TextUnformatted(u8(text))
        imgui.EndTooltip()
      end
  end)
end

function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end

    render_text(text)
end
--������� �������, ��� ������ ����� ����

function checkupd(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'���������� ���������� �������! ������� /mh '), color)
                end)
            end
          end
        end
      end
    end)
end

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'���������� ����������. ������� ���������� c {EE82EE}'..thisScript().version..'{00FFFF} �� {EE82EE}'..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('��������� %d �� %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('�������� ���������� ���������.')
                      sampAddChatMessage((prefix..'���������� ���������!'), color)
					  imgui.ShowCursor = not imgui.ShowCursor
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'���������� ������ ��������. �������� ���������� ������..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
			  local netreb = string.format("{EE82EE}v"..thisScript().version.." MHelper'a{1E90FF} ���������� �� ���������.")
              sampAddChatMessage(netreb, 0x1E90FF)
            end
          end
        else
          print('v'..thisScript().version..': �� ���� ��������� ����������. ��������� ��� ��������� �������������� �� '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end


function asyncHttpRequest(method, url, args, resolve, reject)
	local request_thread = effil.thread(function(method, url, args)
		local requests = require"requests"
		local result, response = pcall(requests.request, method, url, args)
		if result then
			response.json, response.xml = nil, nil
			return true, response
		else
			return false, response
		end
	end)(method, url, args)

	if not resolve then
		resolve = function() end
	end
	if not reject then
		reject = function() end
	end
	lua_thread.create(function()
		local runner = request_thread
		while true do
			local status, err = runner:status()
			if not err then
				if status == "completed" then
					local result, response = runner:get()
					if result then
						resolve(response)
					else
						reject(response)
					end
					return
				elseif status == "canceled" then
					return reject(status)
				end
			else
				return reject(err)
			end
			wait(0)
		end
	end)
end

function distance_cord(lat1, lon1, lat2, lon2)
	if lat1 == nil or lon1 == nil or lat2 == nil or lon2 == nil or lat1 == "" or lon1 == "" or lat2 == "" or lon2 == "" then
		return 0
	end
	local dlat = math.rad(lat2 - lat1)
	local dlon = math.rad(lon2 - lon1)
	local sin_dlat = math.sin(dlat / 2)
	local sin_dlon = math.sin(dlon / 2)
	local a =
		sin_dlat * sin_dlat + math.cos(math.rad(lat1)) * math.cos(
			math.rad(lat2)
		) * sin_dlon * sin_dlon
	local c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a))
	local d = 6378 * c
	return d
end

function chip(cl)
if cl ~= '' then
	ips = {}
	for word in string.gmatch(cl, "(%d+%p%d+%p%d+%p%d+)") do
		table.insert(ips, { query = word })
	end
	if #ips > 0 then
		data_json = cjson.encode(ips)
		asyncHttpRequest(
			"POST",
			"http://ip-api.com/batch?fields=25305&lang=ru",
			{ data = data_json },
			function(response)
				rdata = cjson.decode(u8:decode(response.text))
				local text = ""
				for i = 1, #rdata do
					if rdata[i]["status"] == "success" then
						distances =
							distance_cord(
								rdata[1]["lat"],
								rdata[1]["lon"],
								rdata[i]["lat"],
								rdata[i]["lon"]
							)
						text =
							text .. string.format(
								"\nIP �" .. i .. " - %s\n C����� - %s\n ����� - %s\n ��������� - %s\n ��������� - %d  \n\n",
								rdata[i]["query"],
								rdata[i]["country"],
								rdata[i]["city"],
								rdata[i]["isp"],
								distances
							)
               end
				end
				if text == "" then
					text = " \n\t{FFF500}������ �� �������"
				end
				showdialog("���������� � IP", text)
			end,
			function(err)
				showdialog("���������� � IP", "��������� ������ \n" .. err)
			end
		)
	end
	else
	sampAddChatMessage('{00FA9A}[MHelper]: ������� {1E90FF}/checkip {FF69B4}8.8.8.8 {FF6347}1.1.1.1')
	end
end

function showdialog(name, rdata)
	--sampShowDialog(
	--	math.random(1000),
	--	"{FF4444}" .. name,
	--	rdata,
	--	"�������",
	--	false,
	--	0
	--)
	itogip = rdata
--	sampAddChatMessage('sek', -1)
	ipcheck.v = not ipcheck.v
	imgui.Process = ipcheck.v
end