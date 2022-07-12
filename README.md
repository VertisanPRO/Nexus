# Nexus Template 1.7.0

[![Nexus 1.7.0](https://img.shields.io/badge/Nexus-1.7.0-red?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAAAXNSR0IArs4c6QAAAmRJREFUOE99kktIVGEUx//nznfHe2dGZ3xcp1JrVNQ0NdOggoKkxyJo4UJcFD100yKCrKCiTQVRCG2KEsmFFgWGYKsetEiEXESGUTFR9iBHpxmdMZ33nft9cScLddHZ/eH8vvM///ORA9Bk1bqHQBqQBARioQRGAHjxn6L6AjTWZUu9s3OilAvApsjpsEUaHPYlLgGIAnADYDCf/KP9AJKkaXDsc7IzsRl+PjDHmcwkFBWpC68i+g0y0rzIKnYbBpiFMTi0vI8vJn6eC8Xxg0w3Oz1wrWdyT9CXbl2IC9iyGFzFWWEjFadIgLtSaaCkvASFntze/mdvj38DEhnQrLYKVGtJacA/xWv1NJBjZyBwzEU5bHY7qrdVffIGp1oejPvfm/3/QFO0V1pabL/EndkAzzP3zTQQoayhUjfy6dS1596bi7suBwFkHS6zdOcF+ZH4gsik4VxdiPyNxU+G3o0dGJ1E6K/DZRMBlHcU062qEPYmYwJEEpxN5akRPdIxMD59b+l1loLqdjc6Dxp0QZkRyqJTsAKVv3RKD29PRE8ACKycSJqCHafdrKcxyKu4DpAkQQgOAmF+jS11Vxhdj77HrgCILQ1HO1oqd7Wr1kNqHESKinhhLmfT05IlDUhMgjdHDl2fnO987ddNy0bGapPbWne2YdVgjWIvEVxAz3amH8+G+6oj/i0bFHUzcUDIFjyN6d6rr4PtvjhGM2BrDRzNFfWblByHbOpIPKF3D4+92VWsNLWtze3zuFzrQBKiRLj/Jdx/cdh3bGWqK781XW5276/1lG1lzAqQoM+Bma8nhz70/wYtuOUgwK+JUQAAAABJRU5ErkJggg==&style=for-the-badge)]()
[![Nameless v2-pr13](https://img.shields.io/badge/Nameless-v2--pr13-orange?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAMAAAAolt3jAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAACE1BMVEVHSB2fg0v///9KOw6CYTF1XB6tjUN4XCG4mUhqSR8AAAB0aDl2ZzcKRBKYf0iUf0JLUjGLdkVsXzhoYTSMej2QfjzRq1FKQCmJcDqXhU2Xh0uhkFN0Zz+SglOlmGOuoF6rlVGWfT+DYzKVeDmkiUK0nlKnkVCrkUy4oVrAqluzmkySdixwWB2nh0GmhjdwViaafTtcPhoAABJwWix5WSJFMBgGEyNIW250ipxucmmAio94kqxBT2NWboWPt+B+mLCBkZ98mrlCU2ZEVmd1lLWDmq+QnpyJobd9mrxOYnYUGB0iKzlbVkWJdkSaiVRrbVxQZH8kLTRoYDiBcDyTfkBpXjORekaBcT2kjkaBcz3RpGlyaD2ahUOYg0I7MixVUjCRfT60mUeymEmfiUWDcjuFdTmagT6OeT92ZzqpkUOfgS2wkjuvkTmwkTq7nES2mEG0lkGfgi6GZyCfgDKWdiOigCelgSesii3Eo0bCoUesizOffymCYSKBZCaJayOYeyqbfSykhTOujTisjTufgjScfS9+hHSRmYqXoJaXnYuRjWaMiGGRmYmSmI6Mo66Yt8yat8iQmYeQkXePj3WMkHyKl5KToZuYpZuYoJGbpJmWnI2UnY6Qn5ukj020nFS3oFe4oFq2n1ewmlWWgD66oEvGqVDEpU2+ok23mkqlj0XAo0zBpE2skkW8oEm7n0qvlkb///9P+JBcAAAAaXRSTlMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAXhqZhKhM9eHMsFrD8+uDM6/7/zCZa/GNxZRF4+2ARgsj8+7x9mOz9+cuKirvg/+XBkScnU+z2ZDApBZy8ES/i7UIBf/ydBQ6c/v7LLhmSkCPiylWOAAAAAWJLR0QCZgt8ZAAAAAd0SU1FB+YGGAcLFOpFw9wAAADVSURBVAjXY2BglJCUkpaRlZNXUGRiZmBRUlbJVFVT19DU0tZhZWDT1cvKzsnNyy8oLNJnZ+AwKC4pLSuvqKyqrjHkZDAyrq2rb2hsam5pNTE1YzC3sGxr7+js6u7ptbK2YbC1s+/rnzBx0uQpUx0cnRicXVzdpk2fMXPW7DnuHp4MXt4+vnPnzV+wcJGff0AgAxd3UPDiJUuXLV8REsrDxcDFyxcWvnLV6jURkfwCQC6XYFR0zNp162PjhLhAXC7h+ITEpOQUES4Il0s0NS09Q0wcyAIAp4E88R6bGz0AAAAldEVYdGRhdGU6Y3JlYXRlADIwMjItMDYtMjRUMDc6MTE6MjAtMDQ6MDD3PLmwAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIyLTA2LTI0VDA3OjExOjIwLTA0OjAwhmEBDAAAAABJRU5ErkJggg==&style=for-the-badge)](https://github.com/NamelessMC/Nameless/releases/tag/v2.0.0-pr13)
[![Discord](https://img.shields.io/badge/Discord-Get%20support-blue?logo=discord&style=for-the-badge)](https://resourcemc.net/discord)

For better experience for installing Nexus, read "README.html"

## Features

* ⚙️ Options
  * 📜 About your website will be shown in footer
  * 🛠️ Custom CSS & JS
* 🌈 Colors
  * ☯️ Darkmode by default
  * 🛠️ Make your own colors or use pure white/dark mode
    * Primary color
    * Navbar color
    * Footer color
    * Border outline color
    * Navbar text color
* 🧭 Navbar
  * 📷 Logo in the middle
  * 🟩 Sticky navbar
  * 😶 Navbar style
    * Elegant
    * Dynamic
    * Modern
* 📶 Connections
  * 🪨 Minecraft
  * 📱 Discord
* 🔄 Preloader
  * 📝 Text
  * 🌈 Color
  * 🚶 Speed
  * 😶 Style
* 🧩 Addons
  * 🤖 [WidgetBot](https://widgetbot.io)
  * 🔽 [Arc](https://arc.io)
* 🕋 [Widgets (moved)](https://github.com/VertisanPRO/WidgetPack)
* 🔗 Embed
  * 📝 Title
  * 📃 Description
  * 🌈 Color
  * 📷 Image
  * 📰 Keywords

## Installing

1. Upload "custom" and the "modules" folder to your NamelessMC Root directory (public_html, html, htdocs)
2. Open StaffCP => Layout => Templates => Click on "Install" - Enable after you've installed it.
3. Open StaffCP => Modules => Click on "Install" - Enable after you've installed it. You're done :)

## Contribution

### Pull Requests

If you make any changes or improvements to Nexus which you think would be beneficial to others, please consider making a pull request to merge your changes back into the main project.

### Translations

Nexus translations are kindly provided by the community. Please note, not all translations may be up to date. Progress of it is shown below.

If you would like to assist with the NamelessMC development by translating to your language, please create an account on [translate.namelessmc.com](https://translate.namelessmc.com/projects/third-party-resources/nexus-template). To discuss with fellow translators, visit the [NamelessMC Translators](https://discord.gg/7Dku3fE) discord server.

![Translation progress](https://translate.namelessmc.com/widgets/third-party-resources/-/nexus-template/multi-auto.svg)

## License

Nexus is licensed under the GNU General Public License v3.0. Please see [`LICENSE.md`](https://github.com/VertisanPRO/nexus/blob/main/LICENSE.md) for more info.

## Special Thanks
- All Nexus [contributors](https://github.com/VertisanPRO/nexus/graphs/contributors).
- [JetBrains](https://www.jetbrains.com) & [Visual Studio Code](https://code.visualstudio.com).
