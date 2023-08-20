const path = require('path');
const { createVuePlugin } = require('vite-plugin-vue2');
const autoprefixer = require('autoprefixer');
const tailwindcss = require('tailwindcss');

module.exports = {
  
  plugins: [createVuePlugin()],

  css: {
    postcss: {
      plugins: [tailwindcss, autoprefixer],
    },
  },
};
