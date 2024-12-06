-- BL2 Krieg - TBOI: Repentance character mod (c) by Sir Wrexes
--
-- BL2 Krieg - TBOI: Repentance character mod is licensed under a
-- Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
--
-- You should have received a copy of the license along with this
-- work. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

local mod = require "src.mod" ---@class KriegModReference
local Buzzaxe = mod.__Buzzaxe or include "src.Buzzaxe.Buzzaxe"
local Constants = mod.__Constants or include "src.Buzzaxe.Constants"

---@param charge integer
function Buzzaxe:ShouldFlashChargebar(charge)
    return charge >= Constants.MAX_CHARGES - Constants.CHARGEBAR_FLASH_THRESHOLD
end

---@param player EntityPlayer
---@param force? boolean
function Buzzaxe:ChargeActiveItem(player, force)
    if not player:HasCollectible(self.ID) or self:isRampaging(player) and not force then return end

    local slot = self:GetSlot(player) --[[ @as ActiveSlot ]]
    local charge = player:GetActiveCharge(slot)
    local clock = self.state[player].clock

    if charge < Constants.MAX_CHARGES and clock:tick() ~= 0 then
        player:AddActiveCharge(1, slot, self:ShouldFlashChargebar(charge), false, true)
    end
end

function Buzzaxe:ActiveChargeTimer()
    local game = Game()

    for i = 0, game:GetNumPlayers() do
        self:ChargeActiveItem(game:GetPlayer(i))
    end
end

return function()
    mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, Buzzaxe.ChargeActiveItem, PlayerVariant.PLAYER)
end
