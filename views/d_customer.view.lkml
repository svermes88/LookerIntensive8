view: d_customer {
  sql_table_name: "DATA_MART"."D_CUSTOMER"
    ;;

  dimension: c_address {
    type: string
    label: "Customer Address"
    sql: ${TABLE}."C_ADDRESS" ;;
  }

  dimension: c_custkey {
    type: number
    sql: ${TABLE}."C_CUSTKEY" ;;
    hidden: yes
    primary_key:  yes
  }

  dimension: c_mktsegment {
    type: number
    label: "Market Segment"
    sql: ${TABLE}."C_MKTSEGMENT" ;;
  }

  dimension: c_name {
    type: string
    label: "Customer Name"
    sql: ${TABLE}."C_NAME" ;;
  }

  dimension: c_nation {
    type: string
    label: "Customer Nationality"
    sql: ${TABLE}."C_NATION" ;;
  }

  dimension: c_phone {
    type: string
    label: "Customer Phone number"
    sql: ${TABLE}."C_PHONE" ;;
  }

  dimension: c_region {
    type: string
    label: "Customer Region"
    sql: ${TABLE}."C_REGION" ;;
  }

  measure: count {
    type: count
    drill_fields: [c_name]
  }
}
