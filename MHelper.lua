local imgui = require 'imgui'
local key = require 'vkeys'
local sampev = require 'lib.samp.events'
local main_window_state = imgui.ImBool(false)
local sec_window_state = imgui.ImBool(false)
local main_menu = imgui.ImBool(false)
local gps1 = imgui.ImBool(false)
local gps2 = imgui.ImBool(false)
local gps3 = imgui.ImBool(false)
local gps4 = imgui.ImBool(false)
local gps5 = imgui.ImBool(false)
local gps6 = imgui.ImBool(false)
local gps7 = imgui.ImBool(false)
local lvla = imgui.ImBool(false)
local gps8 = imgui.ImBool(false)
local sppo = imgui.ImBool(false)
local mh = imgui.ImBool(false)
local zm = imgui.ImBool(true)
local lvlspec = imgui.ImBuffer(256)
local povs = imgui.ImBool(false)
local emenu = imgui.ImBool(true)
local cum1 = imgui.ImBool(false)
local tforms = imgui.ImBool(true)
local srep = imgui.ImBool(true)
local fixrec = imgui.ImBool(true)
local slave = imgui.ImBool(false)
local help = imgui.ImBool(false)
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
script_name('HELPER BY DEXTER MARTELLI')
script_version('2.6')
local cfg = inicfg.load({
    DialogID = {
    	DID = 579
    },
	settings = {
		forms = true,
		rephelp = true,
		fastm = true,
		emenu = true,
		fixrec = true
	}
}, "MHelper")
local quest = ""
local iddial = 0
local namedial = ''
local eD = false
local textdial = ''

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
end

oc = 0

function sampev.onSendCommand(message)
if message == 'spoff' then
main_menu.v = not main_menu.v
imgui.Process = false
end
end

function sampev.onSpectatePlayer(playerid, cam)
imgui.ShowCursor = false
oc = playerid

imgui.Process = main_menu.v
end

local igr = {}
local igr1 = {}

function sampev.onTogglePlayerSpectating(state) main_menu.v = state end

local answer = imgui.ImBuffer(256)

function imgui.OnDrawFrame()
style()		
			if not help.v or not main_window_state.v or not lvla.v or not gps1.v or not gps2.v or not gps3.v or not gps4.v or not gps5.v or not gps6.v or not gps7.v or not gps8.v or not sec_window_state.v or not main_menu.v or not slave.v then
imgui.Process = false
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
	local pp = ""
	if ccd == nil then
	imgui.Text(u8"������/������ �� " .. cnick .. '[OFF]:')
	else
	imgui.Text(u8"������/������ �� " .. cnick .. '[' .. ccd .. ']:')
	end
	imgui.Separator()
	pp = string.format(u8" " .. first)
--	imgui.TextColored(imgui.ImVec4(1.0,0.0,1.0,1.0), u8(first))
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
	imgui.Process = main_menu.v	
	local sg, se = getScreenResolution()
		imgui.SetNextWindowPos(imgui.ImVec2(sg / 1.50, se / 1.1), imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(500, 70))
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
		if imgui.Button(u8'/goto oc', imgui.ImVec2(100, 25)) then
		local abra  = string.format(u8"/goto " .. oc)
		sampSendChat(abra)
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
		imgui.End()
	end

			if slave.v then
 imgui.Process = slave.v	
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
			imgui.Process = help.v	
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
			imgui.TextColoredRGB(pervay)
			imgui.TextColoredRGB(Z)
			imgui.TextColoredRGB(E)
			imgui.TextColoredRGB(zero)
			imgui.End()
		end
		
			if povs.v then
			local d1 = 0
			local d2 = 0
			local d3 = 0
			imgui.Process = povs.v	
			local sg, se = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(sg / 3.3, se / 2), imgui.ImVec2(0.5, 0.5))
			imgui.SetNextWindowSize(imgui.ImVec2(600, 300))
			imgui.Begin(u8'MTools || �����������: Dexter_Martelli', povs, imgui.WindowFlags.NoResize)
			if imgui.Button(u8'������ HP', imgui.ImVec2(150, 70)) then
			sampAddChatMessage('��������� ���')
			sampSendChat('/fam')
			proof(1)
			end
			if imgui.Button(u8'��������� �����', imgui.ImVec2(150, 70)) then
			sampSendChat('/fam')
			proof(2)
			end
			imgui.Button(u8'Test')
			if imgui.Button(u8'���������� ���� � ������� 50 ������', imgui.ImVec2(150, 70)) then
			lua_thread.create(function()
			for i = 1, 30 do
			local f66 = getClosestPlayerId(50)
			sampSendChat('/spawn ' .. f66)
			wait(2000)
			if f66 == -1 then
			local farch  = string.format('[MHelper] ������ � ������ 50 ������ {EE82EE}�������{1E90FF} ���� ����������!')
			sampAddChatMessage(farch, 0x1E90FF)
			break
			end
			end
			end)
			
			
			end
			imgui.End()
			 end
			
			
 end
		
		
function proof(numb)
lua_thread.create(function()
        while true do
		wait(0)
		if sampIsDialogActive() then
		print('ok')
		local did = sampGetCurrentDialogId()
		if did and numb == 1 then
		sampSendDialogResponse(did, 1, 0, nil)
		else 
		if did and numb == 2 then
		sampSendDialogResponse(did, 1, 3, nil)
		end
		end
		
		break
		end
		end
    end)

end

got = '��� ���� ��� ��������.'
	
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
sampAddChatMessage('text', -1)
end)
sampRegisterChatCommand('povs', function()
povs.v = not povs.v
imgui.Process = povs.v
end)
while not isSampAvailable() do wait(50) end
if not isSampfuncsLoaded() or not isSampLoaded() then
        return
    end
	 local font = renderCreateFont("Tahoma", 8, 5)
  while true do
   wait(50)
   -- ���� ��������� ������� � �������� ������� � /mh, �� sampTextdrawDelete(id)
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
								if drawClickableText(font, ex, plsX + 25, plsY - 15, 0xFF00FF7F, 0xFFFF0000) then
                                    sampSendChat('/stats ' .. id)
                                end
                                if drawClickableText(font, "/sp", plsX + 25, plsY, 0xFFFFFFFF, 0xFFFF0000) then
                                    slezka(id)
                                end
                                if drawClickableText(font, "Kick", plsX + 25, plsY + 15, 0xFFFFFFFF, 0xFFFF0000) then
									skick(id)
                                end
								if drawClickableText(font, "Slap UP", plsX + 25, plsY + 30, 0xFFFFFFFF, 0xFFFF0000) then
                                    slapp(id)
                                end
								if drawClickableText(font, "�� � ����", plsX + 25, plsY + 45, 0xFFFFFFFF, 0xFFFF0000) then
                                    ghtp(id)
                                end
								if drawClickableText(font, "�� � ����", plsX + 25, plsY + 60, 0xFFFFFFFF, 0xFFFF0000) then
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
								if drawClickableText(font, ex, plsX + 25, plsY, 0xFFFFFFFF, 0xFF00FF7F) then
                                    sampSendChat('/gethereveh ' .. ts)
                                end
								if drawClickableText(font, '���������� ����', plsX + 25, plsY + 15, 0xFFFFFFFF, 0xFF00FF7F) then
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
   
  local result, target = getCharPlayerIsTargeting(playerHandle)
   end
  
end



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

function sampev.onServerMessage(color, text) -- creating message hook 
	
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
	forms = {u8'/warn','/kick','/ban','/mute','/jail','/fv','/get','/offget','/ipaccounts','/skick','/sethp','/skin','/unwarn','/banip','/unjail','/offban','/offwarn','/spcar','/sban','/offjail','/offmute','/spcarid','/oad','/spawn'}
	local adm, idadm, pro = text:match("%[A%] (%w+_%w+)%[(.*)%]: (.*)")
 -- local pro = text:match("- (.*)")
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
                sampAddChatMessage((prefix..'���������� ����������. ������� ���������� c '..thisScript().version..' �� '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('��������� %d �� %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('�������� ���������� ���������.')
                      sampAddChatMessage((prefix..'���������� ���������!'), color)
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
			  local netreb = string.format('{EE82EE}v'..thisScript().version..'{1E90FF} ���������� �� ���������.')
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