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

--- Apply speed multiplier during rampage
---@param player EntityPlayer
function Buzzaxe:OnEvalCacheSpeed(player)
    if not self:isRampaging(player) then return end

    local speed = player.MoveSpeed * Constants.MULT_SPEED
    player.MoveSpeed = math.min(speed, Constants.MAX_SPEED)
end

return function()
    mod:AddPriorityCallback(
        ModCallbacks.MC_EVALUATE_CACHE,
        CallbackPriority.LATE,
        Buzzaxe.OnEvalCacheSpeed,
        CacheFlag.CACHE_SPEED
    )
end
