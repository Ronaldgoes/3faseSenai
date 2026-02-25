import React from 'react'
import style from './Card.module.css'

const Card = ({ nome, idade, cidade }) => {
    return (

        <div className={style.card}>
            <h3>Nome: {nome}</h3>
            <p>Idade: {idade}</p>
            <p>Cidade: {cidade}</p>


        </div>
    )


}

export default Card