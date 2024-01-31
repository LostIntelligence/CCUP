local p = peripheral.wrap("top")
local a = 1
local ink = 0
local paper = 0
local d = [[+-----------------------+-------+---------+-----------+
| Material List for placement 'A340-600 Thai'         |
+-----------------------+-------+---------+-----------+
| Item                  | Total | Missing | Available |
+-----------------------+-------+---------+-----------+
| Block of Quartz       |  3549 |    3549 |         0 |
| Smooth Stone Slab     |  3390 |    3390 |         0 |
| Purple Concrete       |  1336 |    1336 |         0 |
| Gray Wool             |  1032 |    1032 |         0 |
| Stone Brick Slab      |   986 |     986 |         0 |
| Quartz Slab           |   403 |     403 |         0 |
| Block of Iron         |   298 |     298 |         0 |
| Sea Lantern           |   236 |     236 |         0 |
| Block of Coal         |   194 |     194 |         0 |
| Yellow Terracotta     |   170 |     170 |         0 |
| Oak Trapdoor          |   123 |     123 |         0 |
| Purpur Stairs         |   116 |     116 |         0 |
| White Shulker Box     |    76 |      76 |         0 |
| Glass                 |    74 |      74 |         0 |
| Magenta Wool          |    72 |      72 |         0 |
| Polished Andesite     |    70 |      70 |         0 |
| Oak Sign              |    65 |      65 |         0 |
| Cobblestone Wall      |    64 |      64 |         0 |
| Diorite               |    64 |      64 |         0 |
| Brick Stairs          |    55 |      55 |         0 |
| Sandstone Stairs      |    47 |      47 |         0 |
| Birch Fence Gate      |    34 |      34 |         0 |
| Andesite              |    24 |      24 |         0 |
| Furnace               |    22 |      22 |         0 |
| Bedrock               |    18 |      18 |         0 |
| Purple Stained Glass  |    18 |      18 |         0 |
| Birch Door            |    16 |      16 |         0 |
| Quartz Stairs         |    14 |      14 |         0 |
| Chiseled Stone Bricks |    12 |      12 |         0 |
| Red Wool              |    12 |      12 |         0 |
| Stone Button          |    12 |      12 |         0 |
| Iron Door             |     9 |       9 |         0 |
| Block of Lapis Lazuli |     6 |       6 |         0 |
| Blue Bed              |     6 |       6 |         0 |
| Pink Terracotta       |     6 |       6 |         0 |
| Yellow Stained Glass  |     6 |       6 |         0 |
| Stone Brick Stairs    |     4 |       4 |         0 |
| End Rod               |     3 |       3 |         0 |
| Ladder                |     3 |       3 |         0 |
| Lever                 |     2 |       2 |         0 |
| Magenta Stained Glass |     2 |       2 |         0 |
| Redstone Lamp         |     2 |       2 |         0 |
| Redstone Repeater     |     2 |       2 |         0 |
| Cobblestone Stairs    |     1 |       1 |         0 |
+-----------------------+-------+---------+-----------+
| Item                  | Total | Missing | Available |
+-----------------------+-------+---------+-----------+
]]
local jf = ""
local prs = "" 
local h = 1
local b = 0
local l = 0 
local pagenr = 0

-- new check needed for minecraf 1.20 and later --
while paper == 0 or ink == 0 do
        print("Please refill ink/paper")
        print("Waiting 30 seconds")
        sleep(1)
        ink = p.getInkLevel()
        paper = p.getPaperLevel()
        if paper ~= 0 and ink ~= 0 then
            term.clear()
            print("Continuing")
        end
    end
-- new check needed for minecraf 1.20 and later --

l =  string.len(d)
p.newPage()
f,g = p.getPageSize()
f = f - 1
 

while l ~= 0 do
    term.clear()
    pagenr = pagenr + 1 
    ink = p.getInkLevel()
    paper = p.getPaperLevel()
    while paper == 0 or ink == 0 do
        print("Please refill ink/paper")
        print("Waiting 30 seconds")
        sleep(1)
        ink = p.getInkLevel()
        paper = p.getPaperLevel()
        if paper ~= 0 and ink ~= 0 then
            term.clear()
            print("Continuing")
        end
    end
    while b<g do
        while a<f do
            jf = d:sub(1, f)
            p.write(jf)
            d = d:sub(f)
            a = p.getCursorPos()
            l =  string.len(d)
            if l == 0 then
                print("break")
                break
            end
        end 
        a = 1
        a, b = p.getCursorPos()
        b = b + 1
        p.setCursorPos(0, b)
        l =  string.len(d)
        if l == 0 then
            print("break")
            break
        end
    end
    d = d:sub(2)
    p.setPageTitle(tostring(pagenr))
    p.endPage()
    l =  string.len(d)
    if  l~=0 then
        p.newPage()
    end
    sleep(1)
    b = 0
end
print("Complete")
print("waiting 30 secs for debug/safety")
sleep(30)
