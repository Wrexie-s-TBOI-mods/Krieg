-- BL2 Krieg - TBOI: Repentance character mod (c) by Sir Wrexes
--
-- BL2 Krieg - TBOI: Repentance character mod is licensed under a
-- Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
--
-- You should have received a copy of the license along with this
-- work. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

local mod = require "lib.MeleeWeaponApi.mod" ---@class MeleeWeaponApiModReference

---@class EntityMelee
local EntityMelee = mod.__EntityMelee or {}
mod.__EntityMelee = EntityMelee

function EntityMelee:StartCharging()
    if self:OnChargeStart() then return end

    local state = self:GetState(true)

    if not state.Chargebar then
        state.Chargebar = Sprite()
        state.Chargebar:Load(self.ChargebarSprite, true)
    end

    state.IsCharging = true
end

function EntityMelee:StopCharging()
    if not self:OnChargeEnd() then self:GetState(true).IsCharging = false end
end
