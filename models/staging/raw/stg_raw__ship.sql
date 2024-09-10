with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select * except(shipping_fee_1),
    CAST(ship_cost, FLOAT64)

    from source

)

select * from renamed
