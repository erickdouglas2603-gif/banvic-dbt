with
    fonte_contas as (
        
        SELECT * FROM {{ source('erp', 'contas') }}

    )


  ,renomeado as (

        select
            cast(num_conta as int) as pk_conta
            ,cast(cod_cliente as int) as fk_cliente
            ,cast(cod_agencia as int) as fk_agencia
            ,cast(cod_colaborador as int) as fk_colaborador
            ,tipo_conta
            ,cast(data_abertura as date) as data_abertura_conta
            ,cast(data_ultimo_lancamento as date) as data_ultimo_lancamento
            ,saldo_total
            ,saldo_disponivel
            


        FROM fonte_contas

)

SELECT * FROM renomeado