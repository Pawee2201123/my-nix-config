if not nixCats('general') then
  return
end

require('which-key').setup({})
require('which-key').add {
  { "<leader><leader>", group = "buffer commands" },
  { "<leader><leader>_", hidden = true },
  { "<leader>c", group = "[c]ode" },
  { "<leader>c_", hidden = true },
  { "<leader>d", group = "[d]ocument" },
  { "<leader>d_", hidden = true },
  { "<leader>g", group = "[g]it" },
  { "<leader>g_", hidden = true },
  { "<leader>r", group = "[r]ename" },
  { "<leader>r_", hidden = true },
  { "<leader>f", group = "[f]ind" },
  { "<leader>f_", hidden = true },
  { "<leader>s", group = "[s]earch" },
  { "<leader>s_", hidden = true },
  { "<leader>t", group = "[t]oggles" },
  { "<leader>t_", hidden = true },
  { "<leader>w", group = "[w]orkspace" },
  { "<leader>w_", hidden = true },
}
