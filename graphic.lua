local getSize=function(str)
	local stry=std.matchCount(str,"\n")
	local strs=std.splitter(str,"\n")
	local stra={}
	for i,v in ipairs(strs) do
		stra[i]=string.len(v)
	end
	return std.max(stra),stry
end

createButton=function(str,x,y)
	local obj={}
	obj.str=str
	obj.size={getSize(str)}
	obj.pos={x,y}
	term.setCursorPos(x,y)
	term.write(str)
	obj.updateStr=function(self,str)
		self.str=str
		self.size={getSize(str)}
		term.setCursorPos(self.pos[1],self.pos[2])
		term.write(str)
	end
	obj.redraw=function(self)
		term.setCursorPos(self.pos[1],self.pos[2])
		term.write(self.str)
	end
	obj.updatePos=function(self,x,y)
		for i=0,self.size[2] do
			term.setCursorPos(self.pos[1],self.pos[2]+i)
			for ii=1,self.size[1] do
				term.write(" ")
			end
		end
		self.pos={x,y}
		term.setCursorPos(x,y)
		self:redraw()
	end
	obj.isTouch=function(self,x,y)
		--std.print(x,self.pos[1],self.size[1],"y",y,self.pos[2],self.size[2])
		if std.isContain(x,self.pos[1],self.pos[1]+self.size[1]) and std.isContain(y,self.pos[2],self.pos[2]+self.size[2]) then
			return true
		end
		return false
	end
	
	
	return obj
end