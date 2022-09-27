view: d_dates {
  sql_table_name: "DATA_MART"."D_DATES"
    ;;

  dimension_group: date_val {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE_VAL" ;;
  }

  dimension: datekey {
    type: number
    sql: ${TABLE}."DATEKEY" ;;
    primary_key:  yes
    hidden: yes
  }

  dimension: day_of_week {
    type: number
    label: "Day of the week (numeric)"
    sql: ${TABLE}."DAY_OF_WEEK" ;;
  }

  dimension: dayname_of_week {
    type: string
    label: "Day of the week"
    sql: ${TABLE}."DAYNAME_OF_WEEK" ;;
  }

  dimension: month_name {
    type: string
    label: "Month"
    sql: ${TABLE}."MONTH_NAME" ;;
  }

  dimension: month_num {
    type: number
    label: "Month (numeric)"
    sql: ${TABLE}."MONTH_NUM" ;;
  }

  dimension: quarter {
    type: number
    label: "Quarter"
    sql: ${TABLE}."QUARTER" ;;
  }

  dimension: year {
    type: number
    label: "Year"
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [month_name]
  }
}
