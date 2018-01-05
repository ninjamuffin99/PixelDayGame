pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--global shit
size=128

function _init()
	poke(0x5f2d, 1)

	booting=true
	music(0)
	
end

--taskbar
tasky=size-8

function _draw()
	cls()
	
	rectfill(0, tasky, size, size, 7)
	spr(2, 0, tasky, 2,1)
	print(pressing)
	
	chat_manager();
	
	--always have mouse at bottom
	--to render on top of everything
	spr(1, stat(32) - 1, stat(33)-1)
	
	if booting == true then
		cls(1)
		spr(64,32,32,8,8)
		print("booting pc",size/2-16,size*0.7)
		palt(0,false)	
		if pressing == true then 
			booting = false 
		end
	else
		palt(0,true)
	end
	
end

chat={}
chat.x=20
chat.y=20

function chat_manager()
	print("chat test", chat.x, chat.y)
	print("chat test2", chat.x, chat.y+8)
end

pressing=false

function _update()
	mouse()
end

function mouse()
	if(stat(34) == 1 and not pressing) then
		sfx(0)
		pressing = true
	end
	if (stat(34) != 1) then
		pressing = false
	end
end
__gfx__
00000000050000006666666666666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000575000006777777777777776000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700577500006777777777777776000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000577750006777777777777776000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000577775006777777777777776000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700577550006676767676767676000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000055000006767676767676766000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000006666666666666666000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111001111111110011111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111110111111111111111110111001110011110001111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111110111111111111101110111001111011110110111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111110011111101111001101111001110111100010011111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111011111100111011101110101110111101101011100000011111111110000000000000000000000000000000000000000000000000000000000000000
11111111101111010110111101110101101111101101011001111011110111110000000000000000000000000000000000000000000000000000000000000000
11111111101110110110111011110101011111001110010111111101100001110000000000000000000000000000000000000000000000000000000000000000
11111111100001110001111011101100111111011110010111111101001110010000000000000000000000000000000000000000000000000000000000000000
11111111110011110011110011101100111100011110010111111001011111010000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111110011000011011110011011111010000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111110000110111100000110111111010000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111000000111111111110111110110000000000000000000000000000000000000000000000000000000000000000
10011111111111111111111111111111111111111111000111111111011101110000000000000000000000000000000000000000000000000000000000000000
00011111111111111111111111111110000000000000000001111111101101110000000000000000000000000000000000000000000000000000000000000000
00111100011111111111111111100000000000000000000000111111110011110000000000000000000000000000000000000000000000000000000000000000
11111100011110000011111110000000000bbbbbbbbb000000011111111111110000000000000000000000000000000000000000000000000000000000000000
1111110001111000000001100000000000bbbbbbbbbbbbb000000111111111110000000000000000000000000000000000000000000000000000000000000000
1881111111111000000000000000008000bbbbbbbbbbbbbbb0000011111111110000000000000000000000000000000000000000000000000000000000000000
188118811111188888880000088888800bbbbbbbbbbbbbbbbb000011111111110000000000000000000000000000000000000000000000000000000000000000
111118888111188888888888888888000bbbbbbbbbbbbbbbbb000011111111110000000000000000000000000000000000000000000000000000000000000000
11111118811188888888888888888800bbbbbbbbbbbbbbbbbb000011111111110000000000000000000000000000000000000000000000000000000000000000
11111111111188888888888888888000bbbbbbbbbbbbbbbbbb000111111111110000000000000000000000000000000000000000000000000000000000000000
11881111111888888888888888888000bbbbbbbbbbbbbbbbbb000111111111110000000000000000000000000000000000000000000000000000000000000000
1188111111188888888888888888800bbbbbbbbbbbbbbbbbbb000111111111110000000000000000000000000000000000000000000000000000000000000000
1111188111188888888888888888000bbbbbbbbbbbbbbbbbb0001111111111110000000000000000000000000000000000000000000000000000000000000000
111118818818888888888888888800bbbbbbbbbbbbbbbbbbb0001111111111110000000000000000000000000000000000000000000000000000000000000000
111111118888888888888888888000bbbbbbbbbbbbbbbbbb00011111111111110000000000000000000000000000000000000000000000000000000000000000
118811111188888888888888880000bbbbbbbbbbbbbbbbbb00011111111111110000000000000000000000000000000000000000000000000000000000000000
11881188118888888888888888000bbbbbbbbbbbbbbbbbb000111111111111110000000000000000000000000000000000000000000000000000000000000000
1111118811888888888888888000bbbbbbbbbbbbbbbbbbb001111111111111110000000000000000000000000000000000000000000000000000000000000000
1111111118888888888888880000bbbbbbbbbbbbbbbbbb0001111111111111110000000000000000000000000000000000000000000000000000000000000000
100111111888888888000000000000000bbbbbbbbbbbbb0001111111111111110000000000000000000000000000000000000000000000000000000000000000
00018811188888000000000000000000000000bbbbbbb00011111111111111110000000000000000000000000000000000000000000000000000000000000000
001088111800000000000cc00000000000000000bbbbb00011111111111111110000000000000000000000000000000000000000000000000000000000000000
1110001000000000ccccccc0000aaaaaaa00000000bb000111111111111111110000000000000000000000000000000000000000000000000000000000000000
11100110000ccccccccccc000aaaaaaaaaaa0000000b000111111111111111110000000000000000000000000000000000000000000000000000000000000000
1111111111cccccccccccc00aaaaaaaaaaaaaa000000001111111111111111110000000000000000000000000000000000000000000000000000000000000000
1cc111cc1cccccccccccc000aaaaaaaaaaaaaaaa0000001111111111111111110000000000000000000000000000000000000000000000000000000000000000
1cc111cc1cccccccccccc000aaaaaaaaaaaaaaaaaa00001111111111111111110000000000000000000000000000000000000000000000000000000000000000
111111111ccccccccccc000aaaaaaaaaaaaaaaaaaaa0001111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111cccccccccccc000aaaaaaaaaaaaaaaaaaa00111111111111111111110000000000000000000000000000000000000000000000000000000000000000
111cc111cccccccccccc00aaaaaaaaaaaaaaaaaaa000111111111111111111110000000000000000000000000000000000000000000000000000000000000000
111cc11cccccccccccc000aaaaaaaaaaaaaaaaaaa001111111111111111111110000000000000000000000000000000000000000000000000000000000000000
1111111cccccccccccc000aaaaaaaaaaaaaaaaaa0001111111111111111111110000000000000000000000000000000000000000000000000000000000000000
cc11111cccccccc000000aaa00aaaaaaaaaaaaaa0011111111111111111111110000000000000000000000000000000000000000000000000000000000000000
cc1111cccccc0000000000000000aaaaaaaaaaa00111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
111cc1cccc0000000000000000000aaaaaaaaa000111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
111cc1c000000000010001110000000aaaaaa0001111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111000000001111111111111000000aaaaa0001111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
1111100000011111111111111111000000aa00011111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111100000000011111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111110000000111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111100000111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111110001111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111001111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111011111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0002000024750026100261002600247002470024700116000f6000e6000e6000e6000e6000500007000070000600003000050000400003000020000200002000163000d3000c3000a30008300063000000000000
0002000018040180401a0401b0401c040180401504015040130401204016640196401c6401e64020640142401744017440174401d140181401614016140171401714013340123401134010340103401034010340
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e000024750287502b7502f75024750287502b7502f7503075034750377503b7503075034750377503b7502b7202b7202b7202b720247202472024725247202b0002b0002b0002b0002b0002b0002b0002d000
010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000028720287202872026720267202672026720267202871028710287102871028710287150000000000
010e00000000000000000000000000000000000000000000000000000000000000000000000000000002400524020240202402023020230202372523750000000000000000000000000000000000000000000000
000e0000000000000000000000000000000000000000000000000000000000000000000000000000000000002f0202f0202f0202f0201f0201f0201f0201f7201f7201f7201f7201f72000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 03040506
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344
00 41424344

