with

    soma_transacoes_2018 as (

        select
            extract(year from data_transacao) as ano
            ,sum(valor_transacao) as total
        from {{ ref('int_fato_transacoes') }}
        group by 1

    )

select *
from soma_transacoes_2018
where ano = 2018