with 

source as (

    select * from {{ source('raw', 'sales') }}

),

renamed as (

    select
    pdt_id AS products_id

    from source

)

select * from renamed
