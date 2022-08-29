local function int2bin(n)
    local result = {}
    while n ~= 0 do
      if n % 2 == 0 then
        result[#result+1] = '0'
      else
        result[#result+1] = '1'
      end
      n = math.floor(n / 2)
    end
    return table.concat(result)
  end

print(int2bin(31))

charMap = {
    ['0'] = '000',
    ['1'] = '001',
    ['2'] = '010',
    ['3'] = '011',
    ['4'] = '100',
    ['5'] = '101',
    ['6'] = '110',
    ['7'] = '111'
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
  
  -- tests the functions above

decoded = charsFrom("input.txt")
for k,v in pairs(decoded) do
    print(k, v, int2bin(k))
end
