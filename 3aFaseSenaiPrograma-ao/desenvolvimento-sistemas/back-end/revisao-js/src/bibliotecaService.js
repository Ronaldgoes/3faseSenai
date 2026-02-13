import { pool } from "./config.js";

export async function buscarPorId(produtoId) {

    const [row] = await pool.query('SELECT * FROM produto WHERE id = ?', [produtoId])
    console.log(row);

    return row[0]
}

export async function buscarProdutos() {

    const [row] = await pool.query("SELECT * FROM  vw_produtos ")

    console.log(row);

    return row

}

export async function cadastrar(produto, categoria, valor_unitario, estoque_minimo, estoque_maximo) {

    const [row] = await pool.query('INSERT INTO produtos (produto categoria, valor_unitario, estoque_minimo, estoque_maximo) VALUES (?,?,?,?,?)', [produto, categoria, valor_unitario, estoque_minimo, estoque_maximo])

    console.log(row);

    return row

}


export async function produtoMaiorSaida() {

}