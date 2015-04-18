tick=0.05000000001
print=function(...)
	local a={...}
	for i,v in ipairs(a) do
		io.write(tostring(v))
		if i~=#a then
			io.write(" ")
		end
	end
	io.write("\n")
end
multiTask=function(...)
	parallel.waitForAll(...)
end
function splitter(str,c)
	local a={}
	local l=string.len(c)
	for i=1,string.len(str) do
		if string.sub(str,i,i+l-1)==c then
			table.insert(a,string.sub(str,1,i-1))
			str=string.sub(str,i+l)
		end
	end
	table.insert(a,str)
	return a
end
function matchCount(str,pattern)
	local c=0
	for v in string.gmatch (str, pattern) do
		c=c+1
	end
	return c
end
function max(...)
	local a=...
	local t=type(a)
	if t=="number" then
		return math.max(...)
	elseif t=="table" then
		local m=a[1]
		for i=2,#a do
			m=math.max(m,a[i])
		end
		return m
	end
end
function isContain(v,v1,v2)
	if v1>v2 then
		v1,v2=v2,v1
	end
	if v>=v1 and v<=v2 then
		return true
	end
	return false
end
