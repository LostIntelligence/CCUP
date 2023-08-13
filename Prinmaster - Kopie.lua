local p = peripheral.wrap("top")
local a = 1
local ink = 0
local paper = 0
local d = [["EXAPMLE" EXAMPLE]]
local jf = ""
local prs = "" 
local h = 1
local b = 0
local l = 0 
local pagenr = 0

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