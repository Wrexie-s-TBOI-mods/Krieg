-- BL2 Krieg - TBOI: Repentance character mod (c) by Sir Wrexes
--
-- BL2 Krieg - TBOI: Repentance character mod is licensed under a
-- Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
--
-- You should have received a copy of the license along with this
-- work. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

local mod = require "lib.MeleeWeaponApi.mod" ---@class MeleeWeaponApiModReference

local Api = mod.__Api or {}
local CustomCallbacks = mod.__CustomCallbacks or include "lib.MeleeWeaponApi.Callbacks.CallbackId"

Api.Callbacks = CustomCallbacks

include "lib.MeleeWeaponApi.Callbacks.init"
