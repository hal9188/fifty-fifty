import { zodResolver } from '@hookform/resolvers/zod'
import { EyeIcon, EyeOffIcon } from 'lucide-react'
import { useState } from 'react'
import { useForm } from 'react-hook-form'
import { z } from 'zod'
import { Button } from '../../components/ui/button'
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from '../../components/ui/form'
import { Input } from '../../components/ui/input'

const formSchema = z.object({
  username: z.string().min(1, 'ユーザー名を入力してください'),
  email: z.string().email('有効なメールアドレスを入力してください'),
  password: z.string().min(8, 'パスワードは8文字以上で入力してください'),
})

type FormValues = z.infer<typeof formSchema>

export function Signup() {
  const [showPassword, setShowPassword] = useState(false)

  const form = useForm<FormValues>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      username: '',
      email: '',
      password: '',
    },
  })

  function onSubmit(values: FormValues) {
    console.log(values)
  }
  const ShowPasswordIcon = showPassword ? EyeOffIcon : EyeIcon

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
        <FormField
          control={form.control}
          name="username"
          render={({ field }) => (
            <FormItem>
              <FormLabel>ユーザー名</FormLabel>
              <FormControl>
                <Input type="text" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>メールアドレス</FormLabel>
              <FormControl>
                <Input type="email" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="password"
          render={({ field }) => (
            <FormItem>
              <FormLabel>パスワード</FormLabel>
              <div className="relative">
                <FormControl>
                  <Input
                    type={showPassword ? 'text' : 'password'}
                    className="pr-12"
                    {...field}
                  />
                </FormControl>
                <button
                  type="button"
                  className="absolute h-full w-11 right-0 top-0 transform flex justify-center content-center flex-wrap"
                  onClick={() => setShowPassword((state) => !state)}
                >
                  <ShowPasswordIcon className="h-5 w-5 text-gray-500" />
                </button>
              </div>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit">登録</Button>
        <Button variant="ghost" asChild>
          <a href="/login">ログイン</a>
        </Button>
      </form>
    </Form>
  )
}
