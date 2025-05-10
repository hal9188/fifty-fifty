import React from 'react'
import { Login } from '../../src/features/login/login'

export function meta() {
  return [
    { title: 'ログイン' },
    { name: 'description', content: 'ログインページ' },
  ]
}

export default function LoginPage() {
  return <Login />
}
