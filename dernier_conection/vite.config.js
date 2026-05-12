import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig(({ command, mode }) => {
  const isDev = mode === 'development' || command === 'serve'
  return {
    base: isDev ? '/' : '/dernier_portifolio/',
    plugins: [react()],
  }
})
