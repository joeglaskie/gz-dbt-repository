SELECT *,
(quantity * purchase_price) AS purchase_cost,
ROUND((revenue - (quantity * purchase_price)),2) AS margin
FROM {{ ref('stg_raw__sales') }} AS s
LEFT JOIN {{ ref('stg_raw__product') }} AS p
USING (products_id)