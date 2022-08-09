<div align="center">
	<h1>NetPass</h1>
	<p>Roblox networking library for passing tables with instance keys across the network boundary properly</p>
	<a href="https://revvy02.github.io/NetPass/"><strong>View docs</strong></a>
</div>
<!--moonwave-hide-before-this-line-->

## Install using Package Manager
[NetPass can be installed as a package from Wally](https://wally.run/package/revvy02/netpass)

## Sending Data to Clients
**On the server**
```lua
local winnerScores = {
    [game.Players.Player1] = 5,
    [game.Players.Player2] = 6,
}

local loserScores = {
    [game.Players.Player3] = 1,
    [game.Players.Player4] = 2,
}

remoteEvent:FireAllClients(NetPass.encode(winnerScores, loserScores))
```
**On the client**
```lua
remoteEvent.OnClientEvent:Connect(function(...)
    local winnerScores, loserScores = NetPass.decode(...)

    print("winner scores:")
    for player, score in winnerScores do
        print(player.Name .. ":", score)
    end

    print("loser scores: ")
    for player, score in loser Scores do
        print(player.Name .. ":", score)
    end
end)
```
**Expected Output:**
```lua
winner scores: 
Player1: 5
Player2: 6
loser scores:
Player3: 1
Player4: 2
```
## Sending Data to the Server
**On the client**
```lua
remoteEvent:FireServer(Netpass.encode({
    [game.Players.Player1] = 1,
    [game.Players.Player2] = 2,
}, "string", true, 100))
--[[
    You can pass tuples. You don't have to pass only tables with instance keys, encode will
    check every arg and adjust the metadata appended to the beginning of the returned args
--]]
```
**On the server**
```lua
remoteEvent.OnServerEvent:Connect(function(client, ...)
    local payload, str, bool, num = NetPass.decode(...) 

    for k, v in payload do
        print(k.Name .. ":", v)
    end

    print(str, bool, num)
end)
```
**Expected Output**
```
Player1: 1
Player2: 2
string, true, 100
```


