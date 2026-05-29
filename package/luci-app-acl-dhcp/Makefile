include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-acl-dhcp
PKG_VERSION:=1.0
PKG_RELEASE:=1
PKG_ARCH:=all
PKG_LICENSE:=GPL-3.0

LUCI_TITLE:=ACL DHCP Policy Manager
LUCI_DESCRIPTION:=Per-device DHCP policy and ACL tag management
LUCI_DEPENDS:=+luci-mod-network +dhcp
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-acl-dhcp/conffiles
/etc/config/acl-dhcp
endef

$(eval $(call BuildPackage,luci-app-acl-dhcp))