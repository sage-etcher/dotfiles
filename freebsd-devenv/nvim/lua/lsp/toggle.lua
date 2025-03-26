
-- initialize a flag to toggle LSPs on or off
local lsp_enabled = true

-- store buffers attached to each LSP client
local attached_buffers_by_client = {}

-- store configureations for each LSP client
local client_configs = {}

-- store a reference to the original buf_attach_client function
local original_buf_attach_client = vim.lsp.buf_attach_client


-- function to add a buffer to the clients buffer table
local function add_buf(client_id, buf)
  if not attached_buffers_by_client[client_id] then
    attached_buffers_by_client[client_id] = {}
  end

  -- check if the buffer is already in the list
  local exists = false
  for _, value in ipairs(attached_buffers_by_client[client_id]) do
    if value == buf then
      exists = true
      break
    end
  end

  --add the buffer if it doesn't already exist in the client's list
  if not exists then
    table.insert(attached_buffers_by_client[client_id], buf)
  end
end


-- middleware function to control LSP client attachments to buffers
-- prevents LSP client from reataching if LSPs are disable
vim.lsp.buf_attach_client = function(bufnr,client_id)
  if not lsp_enabled then
    -- cache client coniguration if not already stored
    if not client_configs[client_id] then
      local client_config = vim.lsp.get_client_by_id(client_id)
      client_configs[client_id] = (client_config and client_config.config)
    end

    -- add buffer to client's attached buffer list and stop the client
    add_buf(client_id, bufnr)
    vim.lsp.stop_client(client_id)

    return false                                      --indicate the client should not attach
  end
  return original_buf_attach_client(bufnr, client_id) -- use the original attachment method if enabled LSP
end

-- update state with new client IDs after a toggle
local function update_clients_ids(ids_map)
  local new_attached_buffers_by_client = {}
  local new_client_configs = {}
  
  -- Map each client ID to its new ID and cary over configurations
  for client_id, buffers in pairs(attached_buffers_by_client) do 
    local new_id = ids_map[client_id]
    new_attached_buffers_by_client[new_id] = buffers
    new_client_configs[new_id] = client_configs[client_id]
  end

  attached_buffers_by_client = new_attached_buffers_by_client -- update global buffer table
  client_configs = new_client_configs                         -- update global config table
end


-- stop the client, waiting up to 5 seconds; force quits if needed
local function client_stop(client)
  vim.lsp.stop_client(client.id, false)

  local timer = vim.uv.new_timer()  -- create a timer
  local max_attempts = 50           -- set max attempts to check if stopped
  local attempts = 0                -- track number of attempts

  timer:start(100, 100, vim.schedule_wrap(function()
    attempts = attempts + 1

    if client.is_stopped() then
      timer:stop()
      timer:close()
      vim.diagnostic.reset()
    elseif attempts >= max_attempts then
      vim.lsp.stop_client(client.id, true)
      timer:stop()
      timer:close()
      vim.diagnostic.reset()
    end
  end))
end


function toggle_lsp()
  if lsp_enabled then
    client_configs = {}
    attached_buffers_by_client = {}

    for _, client in ipairs(vim.lsp.get_clients()) do
      client_configs[client.id] = client.config

      for buf, _ in pairs(client.attached_buffers) do
        add_buf(client.id, buf)
        vim.lsp.buf_detach_client(buf, client.id)
      end

      client_stop(client)
    end

    print("LSPs Disabled")
  else
    local new_ids = {}

    for client_id, buffers in pairs(attached_buffers_by_client) do
      local client_config = client_configs[client_id]
      local new_client_id, err = vim.lsp.start_client(client_config)

      new_ids[client_id] = new_client_id

      if err then
        vim.notify(err, vim.log.levels.WARN)
        return nil
      end

      for _, buf in ipairs(buffers) do
        original_buf_attach_client(buf, new_client_id)
      end
    end

    update_clients_ids(new_ids)
    print("LSPs Enabled")
  end

  lsp_enabled = not lsp_enabled
end


-- end of file
