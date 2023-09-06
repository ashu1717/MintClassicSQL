# MintClassicSQL
A Coursera Project on SQL Analysis

# Project Scenario
Mint Classics Company, a retailer of classic model cars and other vehicles, is looking at closing one of its storage facilities.

To support a data-based business decision, they are looking for suggestions and recommendations for reorganizing or reducing inventory, while still maintaining timely service to their customers. For example, they would like to be able to ship a product to a customer within 24 hours of the order being placed.

# Project Objectives
* Explore products currently in inventory.

* Determine important factors that may influence inventory reorganization/reduction.

* Provide analytic insights and data-driven recommendations.

# Goal
* The goal is to find answers to the following question in order to address the need for inventory reduction and closing up of warehouses

* Where are items stored, and if they were rearranged, could a warehouse be eliminated?

* How are inventory numbers related to sales figures? Do the inventory counts seem appropriate for each item?

* Are we storing items that are not moving? Are any items candidates for being dropped from the product line?
*** 
# The following data is produced using SQL queries:
I. Total quantity of items in each warehouse


| warehouseCode        | warehouseName         | total_products  |
| ------------- |:-------------:| -----:|
a| North | 131688
b|East|219183
c|West|124880
d|South| 79380

According to the table above, Warehouses A and C have similar quantity levels of 131,688 and 124,880, respectively.

While Warehouse B has the most quantity at 219,183, Warehouse D has the least quantity at 79,380.

The **solution for eliminating** one warehouse is to remove warehouse D and distribute its warehouse items across the other three warehouses

These are some of the issues to consider when considering eliminating warehouses:

* The capacity of the other warehouses to store additional items
* The cost of moving items from one warehouse to another
* The types of items stored in Warehouse D and whether they can be appropriately stored in the other warehouses
* The impact on delivery times to customers
* Geographic Impact of closing one warehouse on delivery.

II. Total quantity ordered and current quantity in stock for each product in Warehouse d
  ![image](https://github.com/ashu1717/MintClassicSQL/assets/57885219/01ffaad3-8e1e-408e-a384-12a69307ded0)

According to the data above, we can observe that the quantity that the customer ordered is almost always significantly less than the quantity in stock.

For example, some products, such as the "1957 Chevy Pickup" have only sold 54 units, but there are still almost 6,000 units in stock. There is 10 times more inventory than the company can sell.
On the one hand, the data concludes that the company has more stocks than it can sell, so we can see the issue of **overstocking** or that the product is not selling well. On the other hand, there are products that need supplies.

One solution to **overstocking** is to reduce the inventory of specific products.

III. Total quantity ordered and current quantity in stock for each product in all the Warehouses
![image](https://github.com/ashu1717/MintClassicSQL/assets/57885219/723216bf-50d1-48be-a292-05219470b001)

As we can see, the issue of **overstocking** is common to all the warehouses.

Not only that, the column "totalQuantityOrdered" for the above table only covered the ordered unit, so there is no information on its status (e.g., if it actually shipped, was canceled, or for any other reason).

IV. Number of orders not shipped for all reasons vs canceled only.
|productCode	|productName	|totalOrdersNotShipped_AllReasons|	totalOrders_Cancelled
| :-------------: |:-------------:| :-----: | :--------: |
S18_3029	|1999 Yamaha Speed Boat	|205	|99
S72_3212	|Pont Yacht	|188	|61
S700_3167	|F/A 18 Hornet 1/72	|175	|66
S700_3962	|The Queen Mary	|170	|63
S700_3505	|The Titanic	|170	|54
S700_2610	|The USS Constitution Ship	|167	|78
S700_2466	|America West Airlines B757-200	|155	|33
S72_1253	|Boeing X-32A JSF	|153	|61
S24_3949	|Corsair F4U ( Bird Cage)	|153	|48
S24_1785	|1928 British Royal Navy Airplane	|152	|81
S24_3816	|1940 Ford Delivery Sedan	|152	|101
S18_1662	|1980s Black Hawk Helicopter	|142	|92
S18_3685	|1948 Porsche Type 356 Roadster	|142	|31
S18_3856	|1941 Chevrolet Special Deluxe Cabriolet	|141	|68
S50_1341	|1930 Buick Marquette Phaeton	|139	|83
S700_2047	|HMS Bounty	|134	|73
S18_2581	|P-51-D Mustang	|132	|24
S18_1589	|1965 Aston Martin DB5	|132	|24
S24_3420	|1937 Horch 930V Limousine	|131	|78
S24_4278	|1900s Vintage Tri-Plane	|129	|27
S700_1938	|The Mayflower	|127	|73
S32_4289	|1928 Ford Phaeton Deluxe	|126	|64
S24_2011	|18th century schooner	|124	|81
S700_4002	|American Airlines: MD-11S	|119	|35
S18_3259	|Collectable Wooden Train	|119	|71
S700_1138	|The Schooner Bluenose	|116	|79
S10_4757	|1972 Alfa Romeo GTA	|113	|64
S24_3151	|1912 Ford Model T Delivery Wagon	|110	|50
....


V. Fast-moving product lines vs slow-moving Product Lines

![image](https://github.com/ashu1717/MintClassicSQL/assets/57885219/1c32956a-4627-45dc-b499-5544d9039702)

From the above table, we can see that **Ships** and **Trucks and buses** product lines are selling faster than the rest.
Another thing to notice is the huge amount of quantity in stock as compared to the orders is very high and doing a **5% reduction** on most of the inventory will save a lot of space and eventually help out in eliminating the **warehouse d** and distributing its products across the warehouses.







