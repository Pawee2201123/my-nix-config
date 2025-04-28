if not nixCats('general') then
  return
end

require('arrow').setup({
  show_icons = false,
  leader_key = ';', -- Recommended to be a single key
  buffer_leader_key = 'm', -- Per Buffer Mappings
})

