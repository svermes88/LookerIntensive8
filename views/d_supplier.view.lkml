view: d_supplier {
  sql_table_name: "DATA_MART"."D_SUPPLIER"
    ;;

  dimension: s_acctbal {
    type: number
    label: "Account balance" #to clarify with the mentor
    sql: ${TABLE}."S_ACCTBAL" ;;
  }

  dimension: s_address {
    type: string
    label: "Supplier Address"
    sql: ${TABLE}."S_ADDRESS" ;;
  }

  dimension: s_name {
    type: string
    label: "Supplier Name"
    sql: ${TABLE}."S_NAME" ;;
    drill_fields: [f_lineitems.l_linenumber]
    link: {
      label: "{{value}}"
      url: "https://www.google.com/search?q={{ value | url_code }}"
    }
  }

  dimension: s_nation {
    type: string
    label: "Supplier Nationality"
    sql: ${TABLE}."S_NATION" ;;
  }

  dimension: s_phone {
    type: string
    label: "Supplier Phone number"
    sql: ${TABLE}."S_PHONE" ;;
  }

  dimension: s_region {
    type: string
    label: "Supplier Region"
    sql: ${TABLE}."S_REGION" ;;
  }

  dimension: s_suppkey {
    type: number
    sql: ${TABLE}."S_SUPPKEY" ;;
    primary_key:  yes
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [s_name]
  }

  dimension:  SuppliersByAccountBalance  {
    label: "Suppliers by Account Balance"
    type: tier
    style: integer
    tiers: [1, 3001,5001,7001]
    sql: ${s_acctbal} ;;
  }
}
