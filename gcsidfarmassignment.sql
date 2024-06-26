SELECT
  v.Vehicle_id,
  o.Product_Name,
  SUM(o.Quantity) AS Total_Quantity
FROM
  Vehicles v
  JOIN Routes r ON v.Vehicle_id = r.Vehicle_id
  JOIN Customers c ON r.Route_id = c.Route_id
  JOIN Orders o ON c.Customer_id = o.Customer_id
  -- TODO: Need to implement the filter feature of delivery date between start date and end date.
WHERE
  o.Order_status = 'confirmed'
  AND o.Delivery_date -- TODO: Between Start Date and End Date
GROUP BY
  v.Vehicle_id,
  o.Product_Name;
