/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.elm"],
  plugins: [
    require("w-theme/tailwindcss")({
      strict: true,
      useSpacing: true,
      strictSpacing: true,
      colorComponents: true
    })
  ],
}

