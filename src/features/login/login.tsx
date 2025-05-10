import { EyeIcon, EyeOffIcon } from 'lucide-react'
import React, { useState } from 'react'
import { Button } from '../../components/ui/button'
import {
  Card,
  CardContent,
  CardFooter,
  CardHeader,
} from '../../components/ui/card'
import { Input } from '../../components/ui/input'

export function Login() {
  const [showPassword, setShowPassword] = useState(false)

  return (
    <div className="min-h-screen flex items-center justify-center p-4">
      <Card className="w-full max-w-md">
        <CardHeader className="px-6 pt-6 pb-0">
          <h2 className="text-xl font-medium">メールアドレス</h2>
        </CardHeader>
        <CardContent className="px-6 pt-4">
          <div className="space-y-6">
            <div>
              <Input
                type="email"
                placeholder="hogehoge@gmail.com"
                className="h-12 text-base"
              />
            </div>
            <div>
              <h2 className="text-xl font-medium mb-4">パスワード</h2>
              <div className="relative">
                <Input
                  type={showPassword ? 'text' : 'password'}
                  placeholder="***********"
                  className="h-12 text-base pr-10"
                />
                <button
                  type="button"
                  className="absolute right-3 top-1/2 transform -translate-y-1/2"
                  onClick={() => setShowPassword(!showPassword)}
                >
                  {showPassword ? (
                    <EyeOffIcon className="h-5 w-5 text-gray-500" />
                  ) : (
                    <EyeIcon className="h-5 w-5 text-gray-500" />
                  )}
                </button>
              </div>
            </div>
          </div>
        </CardContent>
        <CardFooter className="flex flex-col px-6 pb-6">
          <Button className="w-full h-12 text-base bg-green-500 hover:bg-green-600">
            ログイン
          </Button>
          <div className="mt-4 text-center w-full">
            <a
              href="/signup"
              className="text-base text-gray-700 hover:underline"
            >
              アカウントを作成
            </a>
          </div>
        </CardFooter>
      </Card>
    </div>
  )
}
