# MockNetwork
<div align="center">
	<h1>NetPass</h1>
	<p>Roblox networking library for passing tables with instance keys across the network boundary properly</p>
	<a href="https://revvy02.github.io/NetPass/"><strong>View docs</strong></a>
</div>
<!--moonwave-hide-before-this-line-->

## Install using Package Manager
[NetPass can be installed as a package from Wally](https://wally.run/package/revvy02/netpass)

## Examples
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