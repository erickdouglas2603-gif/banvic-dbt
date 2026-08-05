with
    fonte_transacoes as (
        
        SELECT * FROM {{ source('erp', 'transacoes') }}

    )


  ,renomeado as (

        select
            cast(cod_transacao as int) as pk_transacao
            ,cast(num_conta as int) as fk_conta
            ,cast(cod_transacao as int) as numero_transacao
            ,cast(data_transacao as date) as data_transacao
            ,cast(data_transacao as timestamp) as ts_transacao
            ,nome_transacao
            ,case   
                WHEN CAST(valor_transacao as numeric(28,2)) > 0 then 'Crédito'
                WHEN CAST(valor_transacao as numeric(28,2)) < 0 then 'Débito'
                else null
             end as tipo_transacao
            ,CAST(valor_transacao as numeric(28,2)) as valor_transacao
            


        FROM fonte_transacoes

)

SELECT * FROM renomeado