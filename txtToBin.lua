local function int2bin(x)
  ret=""
	while x~=1 and x~=0 do
		ret=tostring(x%2)..ret
		x=math.modf(x/2)
	end
	ret=tostring(x)..ret
	return ret
end

charMap = {
space = 0,
a = 1,
b = 2,
c = 3,
d = 4,
e = 5,
f = 6,
g = 7,
h = 8,
i = 9,
j = 10,
k = 11,
l = 12,
m = 13,
n = 14,
o = 15,
p = 16,
q = 17,
r = 18,
s = 19,
t = 20,
u = 21,
v = 22,
w = 23,
x = 24,
y = 25,
z = 26,
db_quote = 27,
question = 28,
exclaim = 29,
comma = 30,
full_stop = 31   
}

function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

function charsFrom(file)
    if not file_exists(file) then return {} end
    local chars = {}
    local txt = io.open(file, "rb")
    local str = txt:read("*all")
    for i in string.gmatch(str,".") do
        i = i:lower()
        table.insert(chars, i)
    end
    return chars
end
  
function getCharMap(char, bits)
  local rtn = ""
if char == ' ' then
  rtn = int2bin(charMap.space)
elseif char == '"' then
  rtn = int2bin(charMap.db_quote)
elseif char == "?" then
  rtn = int2bin(charMap.question)
elseif char == "!" then
  rtn = int2bin(charMap.exclaim)
elseif char == "," then
  rtn = int2bin(charMap.comma)
elseif char == "." then
  rtn = int2bin(charMap.full_stop)
else
  rtn = int2bin(charMap[char])
end
for i = #rtn + 1, bits, 1 do
  rtn = "0" .. rtn
end
return rtn
end

decoded = charsFrom("input.txt")
for k,vk in pairs(decoded) do
    print(k, vk, getCharMap(vk, 5))
end
