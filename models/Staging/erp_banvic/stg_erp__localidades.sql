with
    fonte_localidades as (
        
        SELECT * FROM {{ source('erp', 'localidades') }}

    )


  ,renomeado as (

    SELECT 
        COD_LOCALIDADE as pk_localidade
        ,CAST(CIDADE as string) as cidade
        ,CAST(UF as string) as UF
    FROM fonte_localidades

)

SELECT * FROM renomeado

