with    
    dim_datas as(
        select * from {{ ref('int_dimensao_data') }}
    )

select * from dim_datas