select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select SaleID
from EMEKA_MARKET_DATA.RAW_SALES_DATA.fact_sales
where SaleID is null



      
    ) dbt_internal_test