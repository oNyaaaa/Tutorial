for k,v in pairs(file.Find("coding/sh_*","LUA")) do
    print("Adding files"..v)
    include("coding/"..v)
end

for k,v in pairs(file.Find("coding/cl_*","LUA")) do
    print("Adding files"..v)
    include("coding/"..v)
end