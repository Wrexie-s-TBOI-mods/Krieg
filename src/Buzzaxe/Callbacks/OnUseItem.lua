-- BL2 Krieg - TBOI: Repentance character mod (c) by Sir Wrexes
--
-- BL2 Krieg - TBOI: Repentance character mod is licensed under a
-- Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
--
-- You should have received a copy of the license along with this
-- work. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

local mod = require "src.mod" ---@class KriegModReference
local Buzzaxe = mod.__Buzzaxe or include "src.Buzzaxe.Buzzaxe"

---@param item      CollectibleType
---@param rng       RNG
---@param player    EntityPlayer
---@param flags     integer
---@param slot      ActiveSlot
---@param custom    integer
function Buzzaxe:OnUseItem(item, rng, player, flags, slot, custom)
    if (flags & UseFlag.USE_CARBATTERY) == UseFlag.USE_CARBATTERY then return end
    print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    print "[Buzzaxe#onUse] start"

    self:DestroyBaseWeapon(player)

    local buzzaxe, state = self:CreateBuzzaxe(player)

    state.hearts = player:GetHearts()
    -- state.beast = state.hearts <= Item.const.RTB_THRESHOLD
    state.beast = true
    state.active = true

    if state.beast and player:CanPickRedHearts() then player:AddHearts(player:GetMaxHearts()) end

    return {
        ShowAnim = true,
        Remove = false,
        Discharge = true,
    }
end

return function()
    mod:AddCallback(ModCallbacks.MC_USE_ITEM, Buzzaxe.OnUseItem, Buzzaxe.ID)
end
