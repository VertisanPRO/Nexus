# Nexus Template 1.8.0
[![Discord](https://img.shields.io/badge/Discord-Get%20support-blue?logo=discord&style=for-the-badge)](https://pterodactyl-resources.com/discord)

## Installing
1. Upload "custom" and the folder to your NamelessMC Root directory (public_html, html, htdocs)
2. Configure the template:
**Q: How do I change my logo in the navbar?**

A: In StaffCP > Layout > Images > Logo image

**Q: How do I change *!!minecraft domain!!* in the navbar?**

A: In `custom/templates/DefaultRevamp/navbar.tpl`, line 149, replace the `!!minecraft domain!!` to whatever you want to display (will be copied)

**Q: How do I remove Discord Widget from the navbar?**

A: In `custom/templates/DefaultRevamp/navbar.tpl` remove lines 109-110, 115-135 and read comment below (in the file). In `custom/templates/DefaultRevamp/template.php` remove lines 177-181

**Q: How do I setup Discord Widget in the navbar?**

A: In `custom/templates/DefaultRevamp/template.php`, line 171, replace `discordid` with your Discord Server ID

**Q: How do I setup Minecraft Widget in the navbar?**

A: In `custom/templates/DefaultRevamp/footer.tpl`, line 98, replace `ip` with the IP you would ping, replace `port` with the port you would ping (if it is 25565, remove `:port`)

**Q: How do I remove Minecraft Widget from the navbar?**

A: In `custom/templates/DefaultRevamp/navbar.tpl` remove lines 110-111, 144-167.  `custom/templates/DefaultRevamp/footer.tpl` remove lines 97-108

**Q: How do I remove WidgetBot?**

A: In `custom/templates/DefaultRevamp/footer.tpl` remove lines 110-121

**Q: How do I setup WidgetBot?**

A: In `custom/templates/DefaultRevamp/footer.tpl`, set `serverid` and `channelid` (lines 99-100) to your Discord Server ID & Discord Channel ID

**Q: How do I set the embed's description?**

A: In `custom/templates/DefaultRevamp/header.tpl`, line 35 & 45, replace `{$PAGE_DESCRIPTION}` with your description (also remove lines 44 & 46)

**Q: How do I set the embed's color?**

A: In `custom/templates/DefaultRevamp/header.tpl`, lines 36-37, replace `{$embedcolor}` with your color

**Q: How do I set the embed's image?**

A: In `custom/templates/DefaultRevamp/header.tpl`, line 34 & 42, replace `{$OG_IMAGE}` with your image

**Q: Is Ghost Module still supported?**

A: Should be yes

**Q: Does this mean it will be officialy supported?**

A: No, very little updates will be made, but we are still here to help everyone. Also perhaps in the future we will be able to implement Nexus features into the DefaultRevamp itself

**Q: Can you bring back *x*?**

A: Maybe yes, ask (for modern navbar, sticky navbar, dynamic navbar, arc.io, widgets headings, preloader, menu to easily edit, manage colors - No, that wouldn't be possible for us. The project is on GitHub, meaning you may add features to the public)

**Q: How do I remove the template?**

A: First of all, delete the `custom/templates/DefaultRevamp` folder and upload the new folder from <https://github.com/NamelessMC/Nameless/releases/download/v2.1.0/nameless-deps-dist.zip>

## Contribution
If you make any changes or improvements to Nexus which you think would be beneficial to others, please consider making a pull request to merge your changes back into the main project.

## License
Nexus is licensed under the GNU General Public License v3.0. Please see [`LICENSE.md`](https://github.com/VertisanPRO/nexus/blob/main/LICENSE.md) for more info.

## Special Thanks
- All Nexus [contributors](https://github.com/VertisanPRO/nexus/graphs/contributors).
- [JetBrains](https://www.jetbrains.com) & [Visual Studio Code](https://code.visualstudio.com).
