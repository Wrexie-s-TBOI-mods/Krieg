-- BL2 Krieg - TBOI: Repentance character mod (c) by Wrexes
--
-- BL2 Krieg - TBOI: Repentance character mod is licensed under a
-- Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
--
-- You should have received a copy of the license along with this
-- work. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

local mod = require "src.mod" ---@class KriegModReference

local Melee = include "lib.MeleeWeaponApi.API"
local Util = Melee.Util
local IterableList = Util.IterableList

local Buzzaxe = mod.__Buzzaxe or {}

---@param player EntityPlayer
function Buzzaxe:CreateBuzzaxe(player)
    local state = self.state[player]
    local buzzaxe = Melee.Create { Spawner = player, Variant = self.EFFECT_VARIANT }
    local custom = buzzaxe.CustomData

    buzzaxe.DepthOffset = player.DepthOffset + 1

    buzzaxe.Capsules = { "tip" }
    custom.Animations = {
        Swing = IterableList { "Swing", "Swing2" },
        SwingDown = IterableList { "SwingDown", "SwingDown2" },
    }

    custom.InputCallback = self:CreateInputCallback(player, state)

    state.buzzaxe = buzzaxe

    return buzzaxe, state
end

mod.__Buzzaxe = Buzzaxe
return Buzzaxe
