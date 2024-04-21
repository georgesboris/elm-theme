const plugin = require("tailwindcss/plugin");
const elmTheme = require("./elm_theme.js");

module.exports = plugin.withOptions(
  elmTheme.optionsHandler,
  elmTheme.themeHandler
);
