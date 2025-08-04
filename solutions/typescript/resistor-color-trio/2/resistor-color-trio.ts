export function decodedResistorValue(arr: string[]): string {
  const vals: string = `${colorCode(arr[0])}${colorCode(arr[1])}`;
  const nzero: number = colorCode(arr[2]);
  if (nzero > 0) {
    let zeros = '0';
    zeros = zeros.repeat(nzero);
    return addUnits(Number(vals+zeros));
  }
  return addUnits(Number(vals));
}

const colorCode = (color: string): number => {
  return COLORS.indexOf(color);
}

const addUnits = (val: number): string => {
  const giga = 1000000000;
  const mega = 1000000;
  const kilo = 1000;
  if (val > giga) {
    return `${val / giga} gigaohms`;
  }
if (val > mega) {
    return `${val / mega} megaohms`;
  }
  if (val > kilo) {
    return `${val / kilo} kiloohms`;
  }
  return `${val} ohms`;
}
const COLORS =
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

