pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--global shit
size=128

gfx={}
gfx.pink=14
gfx.purple=13

function _init()
	poke(0x5f2d, 1)

	booting=true
	music(0)
	
end

--taskbar
tasky=size-8

--start button
startb={}
startb.x=2
startb.y=tasky-5
--just used for collision
startb.w=16
startb.h=11
startb.anim=2

--mouseshit
mousepos={}
mousepos.x=stat(32)
mousepos.y=stat(33)
mousepos.w=1
mousepos.h=1

function _draw()
	cls()
	
	--taskbar i think
	rectfill(0, tasky, size, size, gfx.purple)
	line(0,tasky,size,tasky,gfx.pink)
	--start button
	spr(startb.anim, startb.x,startb.y,2,2)
	print(pressing)
	
	spr(6,30,30,2,2)

	if pressingstart == true then
		draw_window(10,10,size*0.7,size*0.7,"chat")
	end
	
	chat_manager();
	
	--always have mouse at bottom
	--to render on top of everything
	

	spr(1, mousepos.x, mousepos.y)
	
	--draw this ontop of everything
	--too
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

chat={""}
chat.x=20
chat.y=20

windows={}

function chat_manager()
	
	foreach(chat,add_message)
	
end

function add_message(v)
	print("chat: " .. v)
	
end

function draw_window(x,y,w,h,name)
	rectfill(x,y,x+w,y+h,13)
	rectfill(x,y,x+w,y+7,7)
	print(name,x+2,y+2,13)
	rect(x,y,x+w,y+h,14)
end

chatlog={"hey this is cool",
"like pretty sweet yo",
"radical",
"hey, are you there?",
"yeah",
"the internet is cool right?",
"yep!",
"so do you have homework?",
"8",
"9",
"10",
"11",
"12",
"13",
"14",
"15",
"16",
"17"}

function add_chat()
	sfx(02)
	add(chat, chatlog[1])
	del(chatlog, chatlog[1])
	
	if (count(chat) >= 14) then
		del(chat, chat[1])
	end
	
end

pressing=false

function _update()
	mouse()
	
	if btnp(4) then
		add_chat()
	end
	
	if (pressing and overlap(mousepos,startb)) then
		startb.anim=4
		pressingstart=true
	else
		pressingstart=false
		startb.anim=2
	end
	
end

mousep=false

function mouse()
	if(stat(34) == 1 and not pressing) then
		sfx(0)
		pressing = true
	end
	if (stat(34) != 1) then
		pressing = false
	end
	
	mousepos.x=stat(32)
	mousepos.y=stat(33)
	
end

function overlap(a,b)
 local test1 = a.x > (b.x + b.w)
 local test2 = a.y > (b.y + b.h)
 local test3 = (a.x + a.w) < b.x
 local test4 = (a.y + a.h) < b.y
 return not (test1 or test2 or test3 or test4)
end
__gfx__
00000000050000000eeeeeeeeeeeeee0000000000000000055555555555555550000000000000000000000000000000000000000000000000000000000000000
0000000057500000edddddddddddddde0eeeeeeeeeeeeee051111555555555550000000000000000000000000000000000000000000000000000000000000000
0070070057750000eddddddddddddddeedddddddddddddde51111111111111150000000000000000000000000000000000000000000000000000000000000000
0007700057775000eddddddddddddddeedddddddddddddde51111111111111150000000000000000000000000000000000000000000000000000000000000000
0007700057777500eddddddddddddddeedddddddddddddde55111551111111150000000000000000000000000000000000000000000000000000000000000000
0070070057755000eddddddddddddddeedddddddddddddde55111155555111150000000000000000000000000000000000000000000000000000000000000000
0000000005500000eddddddddddddddeedddddddddddddde55111111115111150000000000000000000000000000000000000000000000000000000000000000
0000000000000000eddddddddddddddeedddddddddddddde55111511115111150000000000000000000000000000000000000000000000000000000000000000
0000000000000000eddddddddddddddeedddddddddddddde51111511115111150000000000000000000000000000000000000000000000000000000000000000
0000000000000000eddddddddddddddeedddddddddddddde51111511115111150000000000000000000000000000000000000000000000000000000000000000
0000000000000000eddddddddddddddeedddddddddddddde51111551151111150000000000000000000000000000000000000000000000000000000000000000
00000000000000000eeeeeeeeeeeeee0edddddddddddddde51111155551111150000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000eeeeeeeeeeeeee051111111111111150000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000051111111111111150000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000051555555555555550000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000055555555555555550000000000000000000000000000000000000000000000000000000000000000
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
11111111111111111111111111011001111011000111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111110111111111111101110011001110011000001111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111110011111100111001100011001110011001000111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111110001111000110001100110001110111001110111110000111111111110000000000000000000000000000000000000000000000000000000000000000
11111111001111000110011100110101100110011110111100000011111111110000000000000000000000000000000000000000000000000000000000000000
11111111100110010100111001110101101110011110111000110011110001110000000000000000000000000000000000000000000000000000000000000000
11111111100100110100111001100101001110011100110001111001100000010000000000000000000000000000000000000000000000000000000000000000
11111111100001110001110001101100011100111100110011111001000100000000000000000000000000000000000000000000000000000000000000000000
11111111110011110011110011101100111100000100110011110001000110000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111101111111111110001111000000011001111000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111100000110001110000000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111110001110010000000000000000000000000000000000000000000000000000000000000000
10011111111111111111111111111111110000000000000111111111000100010000000000000000000000000000000000000000000000000000000000000000
10111111111111111111111111111110000000000000000001111111000000010000000000000000000000000000000000000000000000000000000000000000
01011101011111111111111111100000000000000000000000111111100000110000000000000000000000000000000000000000000000000000000000000000
11111110011110100011111110000000000888888888000000011111111111110000000000000000000000000000000000000000000000000000000000000000
11111101011111000000011000000000008888888888888000000111111111110000000000000000000000000000000000000000000000000000000000000000
11211111111112222000000000000020008888888888888880000011111111110000000000000000000000000000000000000000000000000000000000000000
12111121111111222222000002222220088888888888888888000011111111110000000000000000000000000000000000000000000000000000000000000000
11111212111112122222222222222200088888888888888888800011111111110000000000000000000000000000000000000000000000000000000000000000
11111111211122222222222222222200888888888888888888000011111111110000000000000000000000000000000000000000000000000000000000000000
11111111111112222222222222222000888888888888888888000111111111110000000000000000000000000000000000000000000000000000000000000000
11121111111121222222222222222000888888888888888880000111111111110000000000000000000000000000000000000000000000000000000000000000
11211111111222222222222222222008888888888888888880000111111111110000000000000000000000000000000000000000000000000000000000000000
21111121111122222222222222220008888888888888888800001111111111110000000000000000000000000000000000000000000000000000000000000000
11111211121212222222222222220088888888888888888800001111111111110000000000000000000000000000000000000000000000000000000000000000
11111111212222222222222222200088888888888888888000011111111111110000000000000000000000000000000000000000000000000000000000000000
11211111111222222222222222000088888888888888888000011111111111110000000000000000000000000000000000000000000000000000000000000000
11121112112222222222222222000888888888888888880000111111111111110000000000000000000000000000000000000000000000000000000000000000
11111121111222222222222220008888888888888888880001111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111112122222222222200008888888888888888880001111111111111110000000000000000000000000000000000000000000000000000000000000000
10111111122222222222200000000000088888888888800001111111111111110000000000000000000000000000000000000000000000000000000000000000
01012111112122222000000000000000000000888888000011111111111111110000000000000000000000000000000000000000000000000000000000000000
10101211122220000000000000000000000000008888000011111111111111110000000000000000000000000000000000000000000000000000000000000000
11110111110000000000000000099999990000000080000111111111111111110000000000000000000000000000000000000000000000000000000000000000
111011111000000ddddddd0009999999999900000000000111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111110000dddddddd0099999999999999000000001111111111111111110000000000000000000000000000000000000000000000000000000000000000
11d111d11dddddddddddd00099999999999999990000001111111111111111110000000000000000000000000000000000000000000000000000000000000000
1d11111d11ddddddddddd00099999999999999999000011111111111111111110000000000000000000000000000000000000000000000000000000000000000
111111111d1ddddddddd000999999999999999999000011111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111dddddddddddd000999999999999999990000111111111111111111110000000000000000000000000000000000000000000000000000000000000000
111d11111ddddddddddd009999999999999999990000111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111d1ddddddddd0009999999999999999990001111111111111111111110000000000000000000000000000000000000000000000000000000000000000
1111111dddddddddddd0009999999999999999900001111111111111111111110000000000000000000000000000000000000000000000000000000000000000
1d111111d1ddddd00000000009999999999999900011111111111111111111110000000000000000000000000000000000000000000000000000000000000000
d111111ddddd00000000000000009999999999000111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
1111d1d1dd0000000000000000000999999999000111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
111d1110100000000100011100000009999990001111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111101000001111111111111000000999990001111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111010000111111111111111110000009900011111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111100000000011111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111110000000111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111100000111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111110001111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
11111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000
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
0000000000000000000000060000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0102000018040180401a0401b0401c040180401504015040130401204016640196401c6401e64020640142401744017440174401d140181401614016140171401714013340123401134010340103401034010340
011000001855028550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010e000024750287502b7502f75024750287502b7502f7503075034750377503b7503075034750377503b7502b7202b7202b7202b720247202472024725247202b0002b0002b0002b0002b0002b0002b0002d000
010f00000000000000000000000000000000000000000000000000000000000000000000000000000000000028720287202872026720267202672026720267202871028710287102871028710287150000000000
010e00000000000000000000000000000000000000000000000000000000000000000000000000000002400524020240202402023020230202372523750000000000000000000000000000000000000000000000
010e0000000000000000000000000000000000000000000000000000000000032000000000000000000000002f0202f0202f0201f0201f0201f0201f0201f7201f7201f7201f7201f72000000000000000000000
011800201b0551b0451b0351b0251b0151d0001d0001d0001b0001b0001b0001b0001b0001b0001b0001b00022055220452203522025220151e0001e0001e0001b0001b000200052000520005200052000520005
011800201e0551e0451e0351e0251e015000000000000000000000000000000000000000000000000000000019055190451903519025190150000000000000000000000000000000000000000000000000000000
011800001d0551d0451d0351d0251d015130041b0051b00500000000000000000000000000000000000000000f055160451603516025160150000000000000000000000000000000000000000000000000000000
011000002a0552e0552e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
01 07474344
00 08424344
02 09494344
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

