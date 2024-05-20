return {
    {
        'mfussenegger/nvim-lint',
        confing = function()
            require('lint').linters_by_ft = {
                python = { 'flake8', },
                yaml = { 'cfn_lint', }
            }

            vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
                callback = function()
                    require('lint').try_lint()
                end
            })
        end
    }
}
