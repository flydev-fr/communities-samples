import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import hmr from './react-hmr'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    react(),
    hmr()
  ]
})

