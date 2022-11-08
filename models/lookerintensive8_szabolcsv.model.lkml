connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: lookerintensive8_szabolcsv_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lookerintensive8_szabolcsv_default_datagroup

#explore: d_customer {}

#explore: d_dates {}

#explore: d_part {}

#explore: d_supplier {}

explore: f_lineitems {
  label: "Order Analysis"
  view_label: "Order items"
  join: d_part {
    view_label: "Parts"
    type: left_outer
    sql_on: ${f_lineitems.l_partkey}=${d_part.p_partkey} ;;
    relationship: many_to_one
  }
  join: d_supplier {
    view_label: "Supplier"
    type: left_outer
    sql_on: ${f_lineitems.l_suppkey}=${d_supplier.s_suppkey};;
    relationship: many_to_one
  }
  join: d_customer {
    view_label: "Customer"
    type: left_outer
    sql_on: ${f_lineitems.l_custkey}=${d_customer.c_custkey};;
    #foreign_key: d_customer.c_custkey
    relationship: many_to_one
  }
  join: d_dates {
    view_label: "Date"
    type: left_outer
    sql_on: ${f_lineitems.l_shipdatekey}=${d_dates.datekey};;
    relationship: many_to_one
    }
}
