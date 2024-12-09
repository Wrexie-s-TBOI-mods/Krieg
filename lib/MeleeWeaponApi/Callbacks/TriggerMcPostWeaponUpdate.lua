-- BL2 Krieg - TBOI: Repentance character mod (c) by Sir Wrexes
--
-- BL2 Krieg - TBOI: Repentance character mod is licensed under a
-- Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
--
-- You should have received a copy of the license along with this
-- work. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

local mod = require "lib.MeleeWeaponApi.mod"

local Callbacks = mod.__Api and mod.__Api.Callbacks or include "lib.MeleeWeaponApi.Callbacks.CallbackId"
local RegistryManager = mod.__RegistryManager or include "lib.MeleeWeaponApi.RegistryManager"

---@param _mod      MeleeWeaponApiModReference
---@param effect    EntityEffect
local function TriggerMcPostWeaponUpdate(_mod, effect)
    if not RegistryManager.Has(effect) then return end

    Isaac.RunCallback(Callbacks.MC_POST_WEAPON_UPDATE, effect)
end

---@type ModCallbackModule
return {
    force = true,
    {
        key = ModCallbacks.MC_POST_EFFECT_UPDATE,
        fn = TriggerMcPostWeaponUpdate,
    },
}
