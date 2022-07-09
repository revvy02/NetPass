local package = game.ServerScriptService.NetPass

package.Parent = game.ReplicatedStorage.Packages

require(package.Parent.TestEZ).TestBootstrap:run({
    package["encode.spec"],
    package["decode.spec"],
})
