#priority 0
#loader crafttweaker reloadable

import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.potions.IPotionEffect;
import crafttweaker.event.PlayerLoggedInEvent;

events.onPlayerLoggedIn(function(event as PlayerLoggedInEvent) {
    var player as IPlayer = event.player;
    var persistedData as IData = player.data.PlayerPersisted;
    if (isNull(persistedData) || isNull(persistedData.firstLoggedIn)) {
        player.update({PlayerPersisted : {firstLoggedIn : true as bool}});
        player.addPotionEffect(<potion:minecraft:saturation>.makePotionEffect(2147483647, 5, true, false));
        runCommand("fly " + player.name);
        runCommand("clear " + player.name);
        runCommand("gamerule doDaylightCycle false");
        runCommand("gamerule doWeatherCycle false");
        runCommand("gamerule doMobSpawning false");
    }
});

function runCommand(command as string) {
    server.commandManager.executeCommandSilent(server, command);
}
