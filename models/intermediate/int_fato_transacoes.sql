with

    transacoes as (
        select
            pk_transacao,
            fk_conta,
            numero_transacao,
            data_transacao,
            ts_transacao,
            nome_transacao,
            tipo_transacao,
            valor_transacao

        from{{ ref("stg_erp__transacoes") }}

    )
    
    ,contas as (
        
            select pk_conta, fk_cliente, fk_agencia, fk_colaborador
            from {{ ref("int_dimensao_contas") }}
        
    )
    
    , datas as (
        select 
            pk_data
            , data_evento 
        from {{ ref("int_dimensao_data") }})
    
    
    ,joined as (
        select
            transacoes.pk_transacao,
            transacoes.fk_conta,
            datas.pk_data as fk_data,
            contas.fk_cliente,
            contas.fk_agencia,
            contas.fk_colaborador,
            transacoes.numero_transacao,
            transacoes.data_transacao,
            transacoes.ts_transacao,
            transacoes.nome_transacao,
            transacoes.tipo_transacao,
            transacoes.valor_transacao

        from transacoes
        left join contas on transacoes.fk_conta = contas.pk_conta
        left join datas on transacoes.data_transacao = datas.data_evento
    )

select *
from joined
