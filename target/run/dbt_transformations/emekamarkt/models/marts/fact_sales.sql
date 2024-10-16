-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into EMEKA_MARKET_DATA.RAW_SALES_DATA.fact_sales as DBT_INTERNAL_DEST
        using EMEKA_MARKET_DATA.RAW_SALES_DATA.fact_sales__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.SaleID = DBT_INTERNAL_DEST.SaleID
            )

    
    when matched then update set
        "SALEID" = DBT_INTERNAL_SOURCE."SALEID","QUANTITY" = DBT_INTERNAL_SOURCE."QUANTITY","SALEDATE" = DBT_INTERNAL_SOURCE."SALEDATE","LOCATIONID" = DBT_INTERNAL_SOURCE."LOCATIONID","CUSTOMERID" = DBT_INTERNAL_SOURCE."CUSTOMERID","PRODUCTID" = DBT_INTERNAL_SOURCE."PRODUCTID","PROMOTIONID" = DBT_INTERNAL_SOURCE."PROMOTIONID","SHIPPINGID" = DBT_INTERNAL_SOURCE."SHIPPINGID","REVIEWID" = DBT_INTERNAL_SOURCE."REVIEWID","TOTAL_REVENUE" = DBT_INTERNAL_SOURCE."TOTAL_REVENUE","TOTAL_COST" = DBT_INTERNAL_SOURCE."TOTAL_COST","TOTAL_PROFIT" = DBT_INTERNAL_SOURCE."TOTAL_PROFIT"
    

    when not matched then insert
        ("SALEID", "QUANTITY", "SALEDATE", "LOCATIONID", "CUSTOMERID", "PRODUCTID", "PROMOTIONID", "SHIPPINGID", "REVIEWID", "TOTAL_REVENUE", "TOTAL_COST", "TOTAL_PROFIT")
    values
        ("SALEID", "QUANTITY", "SALEDATE", "LOCATIONID", "CUSTOMERID", "PRODUCTID", "PROMOTIONID", "SHIPPINGID", "REVIEWID", "TOTAL_REVENUE", "TOTAL_COST", "TOTAL_PROFIT")

;
    commit;