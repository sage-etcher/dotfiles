
require('utils')

-- log an error
local log_error = print
local keyset    = vim.keymap.set


-- get dictionary value with default
local dget = function(dict, key, default)
  local read_value = dict[key]
  if read_value ~= nil then
    return read_value 
  else
    return default
  end
end


-- evalutate the key at runtime
local evaluate_mapping = function(map, fallback_key)
  local cond_cb   = dget(map, "cond", true)
  local action_cb = dget(map, "action", nil)
  local fallback  = dget(map, "fallback", false)
  local always_fallback = dget(map, "always_fallback", false)

  -- dont deref nil
  if action_cb == nil then
    log_error("keybind: evaluate_mapping: bad action_cb")
    return -1
  elseif cond_cb == nil then
    log_error("keybind: evaluate_mapping: bad cond_cb")
    return -1
  end

  -- if condition is met execute the action
  local cond_is_met = cond_cb == true or cond_cb()
  if cond_is_met then
    action_cb()
  end

  -- if the condition is not met and fallback is set, send the key;
  -- or if always_fallback is set, send the key regardless
  if always_fallback or (not cond_is_met and fallback) then
    feedkeys(fallback_key, "n")
  end

  return cond_is_met
end


local evaluate_mapping_list = function(map_list, fallback_key)
  local match_found = false

  if map_list == nil then
    log_error("keybind: evaluate_mapping_list: cannot parse nil list")
  end

  -- check each mapping in map_list
  -- if a match is found break
  for _,map in pairs(map_list) do
     match_found = evaluate_mapping(map, fallback_key)
     if match_found then
       break
     end
   end
end


local evaluate = function(map, fallback_key)
  local check_list = type(map[1]) == "table"
  local check_single = type(map['action']) ~= "nil"

  if check_list and not check_single then
    evaluate_mapping_list(map, fallback_key)
  elseif check_single and not check_list then
    evaluate_mapping(map, fallback_key)
  else
    log_error("keybind: evaluate: unknown map type")
  end
end


-- generate the callback function
local gen_callback = function(map, fallback_key)
  return function()
    return evaluate(map, fallback_key)
  end
end


-- PUBLIC API
-- proccess keymap list
c_keyset = function(list)
  local DEFAULT_MODE = { "n" }
  local DEFAULT_OPTS = {
    noremap = true,
    silent  = true,
  }

  for k,v in pairs(list) do
    local keybind = k
    local fallback_key = keybind
    local modes = dget(v, "mode", DEFAULT_MODE)
    local opts  = dget(v, "opts", DEFAULT_OPTS)
    local map   = dget(v, "map", nil)

    if map == nil then
      log_error("keybind: c_keyset: bad map")
      return -1
    end
  
    local cb = gen_callback(map, fallback_key)

    keyset(modes, keybind, cb, opts)
  end

  return 0
end


-- vim command callback generator
plug_action = function(plug_cmd)
  return function()
    feedkeys('<Plug>('..plug_cmd..')', '')
  end
end


cmd_action = function(cmd)
  return function()
    vim.cmd(cmd)
  end
end


-- basic mapping shortcuts
map_template = function(action, modes)
  return {
    mode = modes,
    map = {
      action = action,
    }
  }
end

map = function(action)
  return map_template(action, { "n", "v", "s", "o" })
end

map_bang = function(action)
  return map_template(action, { "i", "c" })
end

map_all = function(action)
  return map_template(action, { "n", "i", "v", "s", "o" })
end

nmap = function(action)
  return map_template(action, { "n" })
end

imap = function(action)
  return map_template(action, { "i" })
end

vmap = function(action)
  return map_template(action, { "v", "s" })
end

xmap = function(action)
  return map_template(action, { "v" })
end

smap = function(action)
  return map_template(action, { "s" })
end

omap = function(action)
  return map_template(action, { "o" })
end

tmap = function(action)
  return map_template(action, { "t" })
end

lmap = function(action)
  return map_template(action, { "i", "c", "l" })
end




-- end of file
