/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],

  plugins: [require("daisyui")],

  daisyui: {
    //themes: ["winter"],
    themes: [
      {
        mytheme: {
          primary: "#d97706",

          secondary: "#fbbf24",

          accent: "#ef4444",

          neutral: "#374151",

          "base-100": "#FFFFFF",

          info: "#3b82f6",

          success: "#34d399",

          warning: "#fde047",

          error: "#fc0320",
        },
      },
    ],
  },
  modules: {
    boxShadow: true,
  },
};
