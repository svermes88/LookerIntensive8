view: sql_runner_query {
  derived_table: {
    sql: SELECT
        (COALESCE(SUM(CASE WHEN ((( f_lineitems."L_ORDERSTATUS"  )) = 'F') THEN ( f_lineitems."L_EXTENDEDPRICE"  )*(1-( f_lineitems."L_DISCOUNT"  ))  ELSE NULL END), 0) - COALESCE(SUM(( f_lineitems."L_SUPPLYCOST" )), 0)) / NULLIF(COALESCE(SUM(CASE WHEN ((( f_lineitems."L_ORDERSTATUS"  )) = 'F') THEN ( f_lineitems."L_EXTENDEDPRICE"  )*(1-( f_lineitems."L_DISCOUNT"  ))  ELSE NULL END), 0), 0) AS "f_lineitems.gross_margin_percentage"

      FROM "DATA_MART"."F_LINEITEMS"
      AS f_lineitems
      LEFT JOIN "DATA_MART"."D_DATES"
      AS d_dates ON (f_lineitems."L_SHIPDATEKEY")=(d_dates."DATEKEY")
      WHERE (d_dates."MONTH_NAME" ) = 'Jan' AND (d_dates."YEAR" ) = 1995
      FETCH NEXT 500 ROWS ONLY
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: f_lineitems_gross_margin_percentage {
    type: number
    sql: ${TABLE}."f_lineitems.gross_margin_percentage" ;;
  }

  set: detail {
    fields: [f_lineitems_gross_margin_percentage]
  }
}
