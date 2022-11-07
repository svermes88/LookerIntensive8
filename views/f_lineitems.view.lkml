view: f_lineitems {
  sql_table_name: "DATA_MART"."F_LINEITEMS"
    ;;

  dimension: l_availqty {
    type: number
    label: "Available quantity"
    sql: ${TABLE}."L_AVAILQTY" ;;
  }

  dimension: l_clerk {
    type: string
    label: "Clerk"
    sql: ${TABLE}."L_CLERK" ;;
  }

  dimension: l_commitdatekey {
    type: number
    sql: ${TABLE}."L_COMMITDATEKEY" ;;
    hidden: yes
  }

  dimension: l_custkey {
    type: number
    sql: ${TABLE}."L_CUSTKEY" ;;
    hidden: yes
  }

  dimension: l_discount {
    type: number
    label: "Discount Amount"
    sql: ${TABLE}."L_DISCOUNT" ;;
  }

  dimension: l_extendedprice {
    type: number
    label: "Extended price"
    sql: ${TABLE}."L_EXTENDEDPRICE" ;;
    value_format_name: usd
  }

  dimension: l_linenumber {
    type: number
    label: "Line number"
    sql: ${TABLE}."L_LINENUMBER" ;;
  }

  dimension: l_orderdatekey {
    type: number
    hidden: yes
    sql: ${TABLE}."L_ORDERDATEKEY" ;;
    primary_key:  yes
  }

  dimension: l_orderkey {
    type: number
    hidden: yes
    sql: ${TABLE}."L_ORDERKEY" ;;
  }

  dimension: l_orderpriority {
    type: string
    label: "Order priority"
    sql: ${TABLE}."L_ORDERPRIORITY" ;;
  }

  dimension: l_orderstatus {
    type: string
    label: "Order status"
    sql: ${TABLE}."L_ORDERSTATUS" ;;
  }

  dimension: l_partkey {
    type: number
    hidden: yes
    sql: ${TABLE}."L_PARTKEY" ;;
  }

  dimension: l_quantity {
    type: number
    label: "Quantity"
    sql: ${TABLE}."L_QUANTITY" ;;
  }

  dimension: l_receiptdatekey {
    type: number
    hidden: yes
    sql: ${TABLE}."L_RECEIPTDATEKEY" ;;
  }

  dimension: l_returnflag {
    type: string
    label: "Return flag"
    sql: ${TABLE}."L_RETURNFLAG" ;;
  }

  dimension: l_shipdatekey {
    type: number
    hidden: yes
    sql: ${TABLE}."L_SHIPDATEKEY" ;;
  }

  dimension: l_shipinstruct {
    type: string
    label: "Shipping instruction"
    sql: ${TABLE}."L_SHIPINSTRUCT" ;;
  }

  dimension: l_shipmode {
    type: string
    label: "Shipping mode"
    sql: ${TABLE}."L_SHIPMODE" ;;
    drill_fields: [d_supplier.acc_bal_tier, d_supplier.s_region, TotalGrossMargin]
  }

  dimension: l_shippriority {
    type: number
    label: "Shipping priority"
    sql: ${TABLE}."L_SHIPPRIORITY" ;;
  }

  dimension: l_suppkey {
    type: number
    hidden: yes
    sql: ${TABLE}."L_SUPPKEY" ;;
  }

  dimension: l_supplycost {
    type: number
    label: "Shipping cost"
    sql: ${TABLE}."L_SUPPLYCOST" ;;
    value_format_name: usd
  }

  dimension: l_tax {
    type: number
    label: "Tax amount"
    sql: ${TABLE}."L_TAX" ;;
    value_format_name: usd
  }

  dimension: l_totalprice {
    type: number
    label: "Total price"
    sql: ${TABLE}."L_TOTALPRICE" ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure:  TotalSalePrice {
    label: "Total Sale Price"
    type: sum
    sql: ${l_totalprice} ;;
    value_format_name: usd
    }
  measure:  AverageSalePrice {
    label: "Average Sale Price"
    type: average
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }
  measure:  CummulativeTotalSales {
    label: "Cummulative Total Sales"
    type: running_total
    sql: ${l_totalprice} ;;
    value_format_name: usd
  }
  measure:  TotalSalePriceShippedByAir {
    label: "Total Sale Price Shipped By Air"
    type: sum
    sql: ${l_totalprice} ;;
    value_format_name: usd
    filters: [l_shipmode: "AIR"]
  }
  measure:  TotalRussiaSales {
    label: "Total Russia Sales"
    type: sum
    sql: ${l_totalprice} ;;
    value_format_name: usd
    filters: [d_customer.c_nation: "RUSSIA"]
  }
  measure:  TotalGrossRevenue {
    label: "Total Gross Revenue"
    type: sum
    sql: ${l_totalprice} ;;
    value_format_name: usd
    filters: [l_orderstatus: "F"]

  }

  measure:  TotalCost {
    label: "Total Cost"
    type: sum
    sql: ${l_supplycost} ;;
    value_format_name: usd
  }
  measure:  TotalGrossMargin {
    label: "Total Gross Margin"
    type: number
    sql: ${TotalGrossRevenue} - ${TotalCost} ;;
    value_format_name: usd
  }
  measure:  TotalGrossMarginPercentage {
    label: "Total Gross Margin %"
    type: number
    sql: ${TotalGrossMargin} / ${TotalGrossRevenue} ;;
    value_format_name: percent_2
  }
  dimension: is_returned {
    type: yesno
    label: "Item returned"
    description: "Items was returned or not (y/n)"
    sql: ${l_returnflag}= 'R' ;;
    hidden: no
  }
  measure:  ItemsReturned {
    label: "Number of returned items"
    type: sum
    sql: ${l_quantity} ;;
    filters: [is_returned: "yes"]
    value_format_name:  decimal_0
  }

  measure:  ItemsSold {
    label: "Number of items sold"
    type: sum
    sql: ${l_quantity} ;;
    value_format_name:  decimal_0
  }
  measure:  ItemsReturnedPercentage {
    label: "Total Items Returned %"
    type: number
    sql: ${ItemsReturned} / ${ItemsSold}  ;;
    value_format_name: percent_2
  }
  measure:  Customercount {
    label: "Distinct count of custmers"
    type: count_distinct
    sql: ${l_custkey};;
    value_format_name: decimal_0
  }

}
