module.exports = {
    parser: "@typescript-eslint/parser",
    plugins: ["svelte3", "@typescript-eslint"],
    extends: ["eslint:recommended", "plugin:@typescript-eslint/recommended"],
    overrides: [
      {
        files: ["*.svelte"],
        processor: "svelte3/svelte3",
      },
    ],
};
