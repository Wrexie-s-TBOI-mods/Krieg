-- BL2 Krieg - TBOI: Repentance character mod (c) by Sir Wrexes
--
-- BL2 Krieg - TBOI: Repentance character mod is licensed under a
-- Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
--
-- You should have received a copy of the license along with this
-- work. If not, see <https://creativecommons.org/licenses/by-nc-sa/4.0/>.

local mod = require "src.mod" ---@class KriegModReference

local BuzzaxeCallbacks = mod.__BuzzaxeCallbacks or {}

---@param filename  string
---@param force?    boolean
function BuzzaxeCallbacks:Register(filename, force)
    local registerfn = include "src.Buzzaxe.Callbacks." .. filename
    if self[registerfn] and not force then return end
    registerfn()
    self[registerfn] = true
end

--[[This seems pointless and, technically speaking, it is.  
    However, I've set an alias in my VSCode Lua config so that functions named
    `RegisterCallback` are treated as an alias of `include`/`require`.  
    That way, I get code completion and validity check on filenames.
    ]]
local function RegisterCallback(filename)
    BuzzaxeCallbacks:Register(filename)
end

RegisterCallback "ActiveChargeTimer"
RegisterCallback "OnCacheEvalSpeed"
RegisterCallback "OnPlayerInitState"
RegisterCallback "OnPlayerUpdateDestroyWeapon"
RegisterCallback "OnRampageEnd"
RegisterCallback "OnUseItem"

mod.__BuzzaxeCallbacks = BuzzaxeCallbacks
