SELECT m.*,
ROUND((m.margin + s.shipping_fee - s.logcost - s.ship_cost),2) AS operational_margin,
FROM {{ ref('int_orders_margin') }} AS m
LEFT JOIN {{ ref('stg_raw__ship') }} AS s
USING (orders_id)