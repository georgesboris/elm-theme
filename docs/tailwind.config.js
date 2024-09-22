/** @type {import('tailwindcss').Config} */
module.exports = {
  prefix: "w--",
  content: ["./src/**/*.elm", "../src/**/*.elm", "!../src/W/Styles.elm"],
  corePlugins: { preflight: false },
  plugins: [
    require("w-theme/tailwindcss")({
      strict: true,
      useSpacing: true,
      strictSpacing: true,
      colorComponents: true
    })
  ]
}

