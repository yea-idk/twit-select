-- Change this number to change the number of @s you will be given

people = 10

-- Use http://twitual.com/ to get a list of all your followers/mutuals and copy paste that into mutuals.txt, no need to remove the @
-- Then just run this script with your prefered Lua interpreter (luvit and lua are the easiest to use)

math.randomseed(tonumber(os.date("%H%M%S")))
file = io.open("./mutuals.txt", "r")
t = file:read("*a")
mutuals = {}
at = {
	{ "@", ""},
}
for i = 1, #at do
	local word = at[i]
	t = string.gsub(t, word[1], word[2])
end
file:close()
file = io.open("./mutuals.txt", "w")
file:write(t)
file:close()
file = io.open("./mutuals.txt", "r")
for line in file:lines() do
	table.insert(mutuals, line);
end
file:close()
num = 0

::start::
num = num + 1
if (num == (people + 1)) then
	goto eof
end
number = math.random(#mutuals)
print(num .. ": https://www.twitter.com/" .. mutuals[number])
goto start
::eof::
