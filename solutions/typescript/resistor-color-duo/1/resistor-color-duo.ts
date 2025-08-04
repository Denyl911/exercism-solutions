export function decodedValue(arr: string[]): number {
  let res = '';
  for (let i = 0; i < 2; i++) {
    res += colorCode(arr[i])
  }
  return Number(res);
}

const colorCode = (color: string): number => {
  return COLORS.indexOf(color)
}

export const COLORS =
  [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white',
  ]
