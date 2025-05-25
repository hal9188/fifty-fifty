import type { Meta, StoryObj } from '@storybook/react'

import { Signup } from './signup'

const meta = {
  title: 'Features/Signup',
  component: Signup,
} satisfies Meta<typeof Signup>

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {}
