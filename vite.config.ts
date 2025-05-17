import { reactRouter } from '@react-router/dev/vite'
import tailwindcss from '@tailwindcss/vite'
import react from '@vitejs/plugin-react'
import { type Plugin, defineConfig } from 'vite'
import tsconfigPaths from 'vite-tsconfig-paths'

const isStorybook = process.argv[1]?.includes('storybook')

export default defineConfig({
  plugins: [
    tailwindcss(),
    tsconfigPaths(),
    !isStorybook && !process.env.VITEST
      ? reactRouter()
      : (react() as unknown as Plugin),
  ],
})
