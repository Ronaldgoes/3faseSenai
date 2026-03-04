// test("Soma de dois mais dois", () => {
//     expect(2 + 2).toBe(4)
// });

// const pc = {
//     memoria_ram: '32GB',
//     placa_video: 'Rtx 5060',
//     ssd: '1000GB'
// }

// describe('Meu pc', () =>{
//     test('Memoria ram tem 32gb?', () => {
//         expect(pc.memoria_ram).toBe('32GB')
//     })

//     test('Placa de video', () => {
//         expect(pc.placa_video).toBe('Rtx 5060')
//     })

//      test('ssd', () => {
//         expect(pc.ssd).toBe('1000GB')
//     })
// })



const pc1 = {
    memoria_ram: '32GB',
    placa_video: 'Rtx 5060',
    ssd: '1000GB'
}

const pc2 = {
    memoria_ram: '64GB',
    placa_video: 'Rtx 4060',
    ssd: '1000G'
}

describe('Meus PCs', () => {
  test('Possuem a mesma config', () => {
    expect(pc1).toEqual(pc2);
  });
  test('Não tem a mesma config', () => {
    expect(pc1).not.toBe(pc2);
  });
});