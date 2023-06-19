local config = {
    adapters = {
        require("neotest-rust")({
            --  args = { "--no-capture" },
        }),
        require('neotest-jest')({
            jestCommand = "npm test --",
            jestConfigFile = "custom.jest.config.ts",
            env = { CI = true },
            cwd = function(path)
                return vim.fn.getcwd()
            end,
        }),
        require("neotest-dotnet")({
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            dap = { justMyCode = false },
            -- Let the test-discovery know about your custom attributes (otherwise tests with not be picked up)
            -- Note: Only custom attributes for non-parameterized tests should be added here. See the support note about parameterized tests
            custom_attributes = {
              xunit = { "MyCustomFactAttribute" },
              nunit = { "MyCustomTestAttribute" },
              mstest = { "MyCustomTestMethodAttribute" }
            },
            -- Tell neotest-dotnet to use either solution (requires .sln file) or project (requires .csproj or .fsproj file) as project root
            -- Note: If neovim is opened from the solution root, using the 'project' setting may sometimes find all nested projects, however,
            --       to locate all test projects in the solution more reliably (if a .sln file is present) then 'solution' is better.
            discovery_root = "project" -- Default
        })
    },
}

require("neotest").setup(config)