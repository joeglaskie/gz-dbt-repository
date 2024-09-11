{{ config(materialized='table')}}

SELECT date_date,
COUNT(orders_id) AS nb_transactions,
ROUND(SUM(revenue),2) AS total_revenue,
ROUND(SUM(quantity)/COUNT(orders_id),2) AS Average_basket,
ROUND(SUM(operational_margin),2) AS total_operational_margin,
ROUND(SUM(purchase_cost),2) AS total_purchase_cost,
ROUND(SUM(shipping_fee),2) AS total_shipping_fee,
ROUND(SUM(logcost),2) AS total_log_cost,
SUM(quantity) AS total_quantity_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
