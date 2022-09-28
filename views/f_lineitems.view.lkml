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
    sql: ${l_quantity} ;;
    value_format_name: usd
    #I found the total sale price KPI name a little misleading. based on the high-level defitinion I decided to assume to sum the quanitity. Let`s dioscuss`
  }
  measure:  AverageSalePrice {
    label: "Average Sale Price"
    type: average
    sql: ${l_extendedprice} ;;
    value_format_name: usd
  }
  measure:  CummulativeTotalSales {
    label: "Cummulative Total Sales"
    type: running_total
    sql: ${l_extendedprice}*${l_quantity} ;;
    value_format_name: usd
  }
}
