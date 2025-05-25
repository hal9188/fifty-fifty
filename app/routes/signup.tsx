import React from 'react'
import { Signup } from '../../src/features/signup/signup'

export function meta() {
  return [
    { title: '新規アカウント作成' },
    { name: 'description', content: '新規アカウント作成ページ' },
  ]
}

export default function SignupPage() {
  return <Signup />
}
