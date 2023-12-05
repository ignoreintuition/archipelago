pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--Archipelago
--by IgnoreIntuition
--game
#include src/classEntity.lua
#include src/game.lua
#include src/helpers.lua
#include src/dialog.lua
#include src/ui.lua
#include src/toolbar.lua
#include src/tile.lua
#include src/map.lua
#include src/unit.lua
#include src/building.lua
#include src/sprites.lua
#include src/enemy.lua
-->8
__gfx__
00000000cccccc6767cccccccc673333333376c733333333cccccc67cccccc67cccccc67cc663333333376c73333333333333333333366cccc76333333333333
0000000067cccccccc67cccc6c773333333377cc33333333cccccccc67cccccccccccccc6c673333333376cc3333333333333333333376cccc67333333333733
00600600cc67cccccccc67cccc673333333376cc3333333367666676cc6cc666667ccccccc677333333766cc3333333333333333333377676676333333337a73
00066000cccc67cccccccc67cc667333333766cc3337373377676777cccc77677676ccccccc6673373376ccc3333333333333333333336766773333333333733
00066000cccccc6767cccccccc673333333376c77776767733737333ccc6633333366c67cccc67776776cc676763333333333776333333333333333333733333
0060060067cccccccc67cccc6c667333333766cc67666676333333336c673333333376cc67ccc676676ccccc7677333333336766333333333333333337a73333
00000000cc67cccccccc67cccc773333333377cccccccccc33333333cc773333333366cccc67ccccccc7cccccc673333333376cc333333333333333333733333
00000000cccc67cccccccc67cc673333333376cccccc67cc33333333cc673333333377cccccc67cccccc67cccc663333333367cc333333333333333333333333
3333333333333333333333330050000000500000000000000000000000000000000aaa0000056000000000000000050000000500000000000000000000000000
333333333bbb3333333333330776050007670500000aa00000000000000ff000aaa000aa00056000000000000050d22000502d20000000000000000000000000
333563333bbb3bbb33333333077677600677767000aa9a00000ff000000ff000999aaa0006656660000000000d22d22002d222d0000000000000000000000000
335556333b4b3bbb33333333077677600767677009a9a9a0000ff00000000000000999aa00056000000566000d22d220022d2d20000000000000000000000000
3355563333433b4b333333334450776044507670054444400055550000055000aaa0009906056060005666600d22054402d20544000000000000000000000000
355556b333433343333333334540044445400444054444400005500000055000999aaa0060056006056466664440045444400454000000000000000000000000
3bbbbbb333333343333333330454454004544540054564400005500000055000000999aa56056060054146660454454004544540000000000000000000000000
3333333333333333333333330044440000444400054564400000000000000000aaa0009905656600054146660044440000444400000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00560000004000000000000000000000008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05666600400400000000aaa000001a00080000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00666660040040000099aaaa00010000808008080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000466600040040008888aaa00555000800880080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
004496660004060008778aaa05556500800880080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
044900660000666008778aa505555500808008080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
44900000000006660888855005555500080000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09000000000000660000000000555000008888000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
00050903030303030303030303030302020202151902060a1200002529000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010706060606080101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010312121212040101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010312121212040101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010312121212040101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
01010109050505050a0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101070606060801010101070606080101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
01010312121204010101070e120f040101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101031012120401010103120c050a0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101031212120401010103120401010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010103120f120401010103120401010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101090505050a01010103110d08010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010103111104010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010706080101010905050a010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010103120401010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010109050a01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
__sfx__
000100001406000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
