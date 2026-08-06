with contas as (

    select *
    from {{ ref('stg_erp__contas') }}

)





, contas_enriquecido as(
     select 
         contas.pk_conta
         , contas.fk_agencia
         , contas.fk_cliente
         , contas.fk_colaborador
         , contas.tipo_conta
         , contas.data_abertura_conta
         , contas.data_ultimo_lancamento
         , contas.saldo_total
         , contas.saldo_disponivel

     from contas
    

)

select * from  contas_enriquecido