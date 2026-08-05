with contas as (

    select *
    from {{ ref('stg_erp__contas') }}

)

, agencia as (
    SELECT * 
    FROM {{ ref('stg_erp__agencias') }}
    
)

, clientes as (
    SELECT * 
    FROM {{ ref('stg_erp__clientes') }}
    
)

, colaboradores as (
    SELECT * 
    FROM {{ ref('stg_erp__colaboradores') }}
    
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
         , agencia.nome_agencia
         , agencia.endereco_agencia
         , agencia.tipo_agencia
         , clientes.nome_cliente
         , clientes.email_cliente
         , colaboradores.nome_colaborador
         , colaboradores.email_colaborador
     from contas
     left join agencia on contas.fk_agencia = agencia.pk_agencia
     left join clientes on contas.fk_cliente = clientes.pk_cliente
     left join colaboradores on contas.fk_colaborador = colaboradores.pk_colaborador

)

select * from  contas_enriquecido