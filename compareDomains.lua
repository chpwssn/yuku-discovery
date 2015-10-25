yukuDomains = yukuDomains or {}

function loadList(filePath)
	local sourceFile = assert(io.open(filePath, "r"))
	local domains, newDomains = 0, 0
	
	for line in sourceFile:lines() do
		domains = domains + 1
		
		if line:find("\n") or line:find("\r") then
			print("New line or carriage return found!")
			print(line)
			print("Press ENTER to proceed")
			io.read()
		end
		
		if not yukuDomains[ line ] then
			print("New subdomain: " .. line)
			newDomains = newDomains + 1
			
			yukuDomains[ line ] = true
		end
	end
	
	print(filePath .. " was successfully loaded!")
	
	sourceFile:close()
end

function saveList(filePath)
	local targetFile = assert(io.open(filePath, "w+"))
	local domains = 0
	
	for domain, _ in pairs(yukuDomains) do
		domains = domains + 1
		targetFile:write(domain .. "\n")
	end
	
	print(domains .. " written to ".. filePath)
	targetFile:close()
end