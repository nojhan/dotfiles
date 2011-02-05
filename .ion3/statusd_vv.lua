require "lfs"

local settings  = {
   -- refresh intervall in milliseconds
   interval = 1000,

   -- only monitors below will be updated
   -- numbers are multipliers of refresh intervall
   monitors = {
      --cpufreq = 1,
      cpucharge = 1,
      --temperature = 5,
      memory = 1,
      network = 1,
      battery = 3,
      mail = 5,
      disk = 60,
      sound = 1,
      uptime = 60},

   -- default settings
   cpu0_important = 50,
   cpu0_critical = 90,
   cpu1_important = 50,
   cpu1_critical = 90,
   cpu2_important = 50,
   cpu2_critical = 90,
   cpufreq_important = 801,
   cpufreq_critical = 2800,
   temperature_important = 50,
   temperature_critical = 70,
   memfree_important = 2^20,
   memfree_critical = 500*2^10,
   battery_important = 10,
   battery_critical = 5,
   rxbytes_important = 5*10^5,
   rxbytes_critical = 10^6,
   rxtotal_important = 10^6,
   rxtotal_critical = 10^9,
   txbytes_important = 5*10^5,
   txbytes_critical = 10^6,
   txtotal_important = 10^6,
   txtotal_critical = 10^9,
   directories = {"/", "/home"},
   disk__important = 2*2^20,
   disk__critical = 1*2^20,
   disk_home_important = 2*2^20,
   disk_home_critical = 1*2^20,
   disk_tmp_important = 2^20,
   disk_tmp_critical = 500*2^10,
   mailbox = "mail/inbox",
   sound_file = "/tmp/sound-modified"
}

settings = table.join(statusd.get_config("vv"), settings)

------------------------------------------------------------------------------------------------------------------------
--
--  Helpers
--
------------------------------------------------------------------------------------------------------------------------

local function read_file(file, mode)
   local file, value = io.open(file), nil
   if file then value = file:read(mode) file:close() end
   return value
end

local function read_string(file) return read_file(file, "*l") end
local function read_number(file) return read_file(file, "*n") end

local function read_popen(cmd, mode)
   local file, value = io.popen(cmd), nil
   if file then value = file:read("*a") file:close() end
   return value
end

local function read_string(file) return read_file(file, "*l") end
local function read_number(file) return read_file(file, "*n") end

local modified_table = {}

local function modified(file)
   local modif = lfs.attributes(file, "change")
   if not modif or modif == modified_table[file] then return false end
   modified_table[file] = modif
   return true
end

local function mkunit(n)
   if n > 2^20 then return string.format("%.1fG", n / 2^20)
   elseif n > 2^10 then return string.format("%.1fM", n / 2^10)
   else return n.."k" end
end

------------------------------------------------------------------------------------------------------------------------
--
--  statusd.inform wrappers
--
------------------------------------------------------------------------------------------------------------------------

local function inform1(name, value, hint)
   statusd.inform("vv_"..name, value)
end

function inform_hint(monitor, val)
   local critical = settings[monitor.."_critical"]
   local important = settings[monitor.."_important"]
   if not critical or not important then return end
   local dir = important <= critical
   if (dir and val >= critical) or (not dir and val <= critical) then inform1(monitor.."_hint", "critical")
   elseif (dir and val >= important) or (not dir and val <= important) then inform1(monitor.."_hint", "important")
   else inform1(monitor.."_hint", "normal") end
end

local function inform(name, value, hint)
   inform1(name, value)
   if hint then inform_hint(name, hint) end
end

------------------------------------------------------------------------------------------------------------------------
--
--  CPU frequency
--
------------------------------------------------------------------------------------------------------------------------

local nb_cpus = 2
--tonumber(string.match(read_string("/sys/devices/system/cpu/online"), "(%d+)$")) + 1

function get_cpufreq()
   local cpu = ""
   for i = 0, nb_cpus - 1 do
      if i > 0 then cpu = cpu.." " end
      cpu = cpu..(read_number("/sys/devices/system/cpu/cpu"..i.."/cpufreq/scaling_cur_freq") / 1000).."MHz"
   end
   inform("cpufreq", "("..cpu..")", cpufreq)
end

------------------------------------------------------------------------------------------------------------------------
--
--  CPU charge
--
------------------------------------------------------------------------------------------------------------------------

local user, nice, system, idle  = {}, {}, {}, {}
for i = 0, nb_cpus do user[i], nice[i], system[i], idle[i] = 0, 0, 0, 0 end

function get_cpucharge()
   local file = io.open("/proc/stat")
   for i = 0, nb_cpus do
      local n_user, n_nice, n_system, n_idle = string.match( file:read("*l"), "^cpu%d*%s+(%d+)%s+(%d+)%s+(%d+)%s+(%d+)")
      local charge = n_user - user[i] + n_nice - nice[i] + n_system - system[i]
      local allcharge = charge + n_idle - idle[i]
      local cpu = (allcharge == 0 and 100) or math.ceil(100 * charge / allcharge)
      user[i], nice[i], system[i], idle[i] = n_user, n_nice, n_system, n_idle
      inform("cpu"..i, string.sub(cpu.."%", 1, 4), cpu)
   end
   file:close()
end

------------------------------------------------------------------------------------------------------------------------
--
--  CPU temperature
--
------------------------------------------------------------------------------------------------------------------------

function get_temperature()
   local temperature = read_number("/sys/class/thermal/thermal_zone0/temp") / 1000
   inform("temperature", math.ceil(temperature).."°C", temperature)
end

------------------------------------------------------------------------------------------------------------------------
--
--  Memory usage
--
------------------------------------------------------------------------------------------------------------------------

function get_memory()
   local mem = {}
   for line in io.lines("/proc/meminfo") do
      local attribute, qty = string.match(line, "^(%S+):%s+(%d+) kB$")
      if attribute then string.gsub(attribute, "[()]", "")
      mem[attribute] = qty
      end
   end
   local memfree = tonumber(mem.MemFree) + tonumber(mem.Buffers) + tonumber(mem.Cached)
   inform("memfree", mkunit(memfree), memfree)
   inform("swapused", mkunit(tonumber(mem.SwapTotal) - tonumber(mem.SwapFree)))
end

------------------------------------------------------------------------------------------------------------------------
--
--  Network load
--
------------------------------------------------------------------------------------------------------------------------

local interfaces, iface_old, last_rx_bytes, last_tx_bytes = {}, nil, 0, 0

for iface in lfs.dir("/sys/class/net/") do
   table.insert(interfaces, iface)
end

function get_network()
   local function mkunit(rx)
      if rx > 10^9 then return string.sub(string.format("%.1fG", rx / 10^9), 1, 6)
      elseif rx > 10^6 then return string.sub(string.format("%.1fM", rx / 10^6), 1, 6)
      else return string.sub(string.format("%.1fk", rx / 1000), 1, 6) end
   end
   local path = "/sys/class/net/"
   local iface
   if old_iface and read_string(path..old_iface.."/operstate") == "up" then iface = old_iface 
   else
      for _, i in ipairs(interfaces) do
	 if read_string(path..i.."/operstate") == "up" then iface, old_iface = i, i break end
      end
   end
   if iface then
      local rx = read_number(path..iface.."/statistics/rx_bytes")
      local tx = read_number(path..iface.."/statistics/tx_bytes")
      local rx2, tx2 = rx - last_rx_bytes, tx - last_tx_bytes
      last_rx_bytes, last_tx_bytes = rx, tx
      inform("iface", iface..":")
      inform("rxbytes", mkunit(rx2), rx2)
      inform("rxtotal", mkunit(rx), rx)
      inform("txbytes", mkunit(tx2), tx2)
      inform("txtotal", mkunit(tx), tx)
   else
      inform("iface", "net: off")
      inform("rxbytes", "")
      inform("rxtotal", "")
      inform("txbytes", "")
      inform("txtotal", "")
   end
end

------------------------------------------------------------------------------------------------------------------------
--
--  Disk usage
--
------------------------------------------------------------------------------------------------------------------------

local dirnames = {}
for i, dir in ipairs(settings.directories) do
   dirnames[i] = "disk"..string.gsub(dir, "/", "_")
end

function get_disk()
   local df = read_popen("/bin/df")
   if df then
      for i, dir in ipairs(settings.directories) do
	 local unused_s, used = string.match(df, "(%d+)%s+(%S+)%s+"..dir.."\n")
	 local unused = tonumber(unused_s)
	 if used then inform(dirnames[i],  dir.." "..used.." "..mkunit(unused), unused) end
      end
   end
end

------------------------------------------------------------------------------------------------------------------------
--
--  Sound (alsa)
--
------------------------------------------------------------------------------------------------------------------------

function get_sound()
   if modified(settings.sound_file) then
      local function snd ()
	 local master, status = string.match(read_popen("/usr/bin/amixer get Master"), "%[(.+)%] %[.+%[(.+)%]")
	 local hint = (status == "on" and "critical") or "normal"
	 inform("master", master)
	 inform("master_hint", hint)
	 inform("pcm", string.match(read_popen("/usr/bin/amixer get PCM"), "Front.*%[(.+)%] %[.+%].*Front"))
	 inform("pcm_hint", hint)
      end
      if not pcall(snd) then lfs.touch(settings.sound_file) end
   end
end

------------------------------------------------------------------------------------------------------------------------
--
--  Uptime
--
------------------------------------------------------------------------------------------------------------------------

function get_uptime()
   local sec = read_number("/proc/uptime")
   local min = math.floor(sec / 60)
   local hours = math.floor(min / 60)
   local days = math.floor(hours / 24)
   days = (days > 1 and days.." days, ") or (days > 0 and days.." day, ") or ""
   inform("uptime", string.format(days.."%02d:%02d", hours % 24, min % 60))
end

------------------------------------------------------------------------------------------------------------------------
--
--  Mail (Maildir format)
--
------------------------------------------------------------------------------------------------------------------------

inform("mailnew_hint", "critical")
inform("mailunread_hint", "important")

function get_mail()
   local function read_dir(mailbox)
      if not modified(mailbox) then return nil end
      local old, new = 0, -2 
      for line in lfs.dir(mailbox) do
	 if string.match(line, "S$") then old = old + 1 else new = new + 1 end
      end
      return new, old
   end
   local new = read_dir(settings.mailbox.."/new")
   local unread, old = read_dir(settings.mailbox.."/cur")
   if new then 
      if new > 0 then inform("mailnew", "("..new.." new) ")
      else inform("mailnew", "") end
   end
   if old then
      if unread > 0 then inform("mailunread", "("..unread.." unread) ")
      else inform("mailunread", "") end
      inform("mailold", old.." ")
   end
end

------------------------------------------------------------------------------------------------------------------------
--
--  Battery usage
--
------------------------------------------------------------------------------------------------------------------------

function get_battery(num)
   local charge_now_total, charge_full_total, percent_max, charging, rate, status = 0, 0, 0, false, nil
   local path = "/sys/class/power_supply/"
   for device in lfs.dir(path) do
      local batt = path..device
      if read_string(batt.."/type") == "Battery" then
	 local state = read_string(batt.."/status")
	 local charge_full = read_number(batt.."/charge_full")
	 local charge_now = math.min(read_number(batt.."/charge_now"), charge_full)
	 local percent =  math.floor(charge_now / charge_full * 100)
	 percent_max = math.max(percent, percent_max)
	 status = ((status and status.."|") or "")..percent.."%"
	 if state == "Discharging" then rate = (rate or 0) + read_number(batt.."/current_now")
	 elseif state == "Charging" then charging = true end
	 charge_now_total = charge_now_total + charge_now
	 charge_full_total = charge_full_total + charge_full
      end
   end
   if not status then status = "none"
   elseif charging then status = status.." - charging"
   elseif rate then
      local hours = charge_now_total / rate
      status = status..string.format(" %02d:%02d %dmW", hours, hours * 60 % 60, rate / 1000)
   end
   inform("battery", status, percent_max)
end

------------------------------------------------------------------------------------------------------------------------
--
--  Main
--
------------------------------------------------------------------------------------------------------------------------

local cycle = 0
local vv_timer = statusd.create_timer()
local monitors = {}

inform("debug", "")
inform("debug_hint", "critical")

for name, factor in pairs(settings.monitors) do
   if factor > 0 then monitors[_G["get_"..name]] = factor end
end

local function update_vv ()
   for func, factor in pairs(monitors) do
      if cycle % factor == 0 then 
	 local ret, mess = pcall(func)
	 if not ret then inform("debug", "err: "..mess) end
      end
   end
   cycle = cycle + 1
   vv_timer:set(settings.interval, update_vv)
end

update_vv()
