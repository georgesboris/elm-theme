/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.elm"],
  plugins: [require("../tailwind/src/index.js")({ strict: true })],
}

