require("luci.sys")
require("luci.config")

local m = Map("acl-dhcp", translate("ACL DHCP Policy"),
    translate("Per-device DHCP policy and ACL tag management"))

local s = m:section(TypedSection, "acl-dhcp", translate("Global"))
s.addremove = false
s.anonymous = true

local enabled = s:option(Flag, "enabled", translate("Enable"))
enabled.default = "1"

local default_policy = s:option(ListValue, "default_policy",
    translate("Default LAN policy"),
    translate("Policy applied to devices without specific rule"))
default_policy:value("lan", translate("LAN (default)"))
default_policy:value("wan", translate("WAN (redirect to WAN)"))

local devices = m:section(TypedSection, "device", translate("Device Rules"))
devices.addremove = true
devices.anonymous = true
devices.template = "cbi/tblsection"

local name = devices:option(Value, "name", translate("Name"))
name.rmempty = false

local mac = devices:option(Value, "mac", translate("MAC Address"))
mac.rmempty = false

local policy = devices:option(ListValue, "policy", translate("Policy"))
policy:value("lan", translate("LAN"))
policy:value("wan", translate("WAN"))
policy.rmempty = false

local dhcp_opts = devices:option(Value, "dhcp_options",
    translate("DHCP Options"),
    translate("e.g. 6,114.114.114.114 or 3,192.168.50.1"))
dhcp_opts.rmempty = true

return m