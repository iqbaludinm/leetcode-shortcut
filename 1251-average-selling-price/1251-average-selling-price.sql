# Write your MySQL query statement below
SELECT
    P.product_id,
    ROUND(SUM((U.units * P.price)) / SUM(U.units), 2) AS average_price
FROM 
    Prices P
JOIN
    UnitsSold U
ON 
    P.product_id = U.product_id
WHERE
    U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY
    P.product_id;

