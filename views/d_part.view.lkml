view: d_part {
  sql_table_name: "DATA_MART"."D_PART"
    ;;

  dimension: p_brand {
    type: string
    label: "Brand name"
    sql: ${TABLE}."P_BRAND" ;;
  }

  dimension: p_mfgr {
    type: string
    label: "Manufacturer name"
    sql: ${TABLE}."P_MFGR" ;;
  }

  dimension: p_name {
    type: string
    label: "Part name"
    sql: ${TABLE}."P_NAME" ;;
  }

  dimension: p_partkey {
    type: number
    sql: ${TABLE}."P_PARTKEY" ;;
    primary_key:  yes
    hidden: yes
  }

  dimension: p_size {
    type: number
    label: "Part size"
    sql: ${TABLE}."P_SIZE" ;;
  }

  dimension: p_type {
    type: string
    label: "Part type"
    sql: ${TABLE}."P_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: [p_name]
  }
}
