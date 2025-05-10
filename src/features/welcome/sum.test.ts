import { expect, test } from 'vitest'
import { sum } from './sum'

test('引数に渡した値の合計値を返却する', () => {
  expect(sum(1, 2)).toBe(3)
})
