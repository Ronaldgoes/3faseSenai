import { buscarProdutos, buscarPorId, cadastrar } from "./almoxarifado_db.js";
import { pool } from "./config.js";
async function main() {
    await buscarPorId(1)

    await buscarProdutos()

    await cadastrar('javaScript', 'ficção', '45', '20', '40')

}

main().catch(err => {
    console.error(err);


}).finally(async () => {
    await pool.end()
});

