local function toggleGit()
  if vim.fn.buflisted(vim.fn.bufname('fugitive:///*/.git//$')) ~= 0 then
    vim.cmd[[ execute ":bdelete" bufname('fugitive:///*/.git//$') ]]
  else
    vim.cmd[[ execute ":Git" ]]
  end
end

vim.keymap.set('n', '<A-2>', toggleGit)
