module("luci.controller.acl-dhcp", package.seeall)

function index()
    entry({"admin", "network", "acl_dhcp"}, cbi("acl-dhcp/config"), _("ACL DHCP"), 60)
end