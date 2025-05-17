import type { Meta, StoryObj } from '@storybook/react'

import { Login } from './login'

const meta = {
  title: 'Features/Login',
  component: Login,
} satisfies Meta<typeof Login>

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {}
