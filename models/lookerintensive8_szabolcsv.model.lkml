connection: "tpchlooker"

# include all the views
include: "/views/**/*.view"

datagroup: lookerintensive8_szabolcsv_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lookerintensive8_szabolcsv_default_datagroup

explore: d_customer {}

explore: d_dates {}

explore: d_part {}

explore: d_supplier {}

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
    sql_on: $(${f_lineitems.l_custkey}=${d_customer.c_custkey};;
    relationship: many_to_one
  }
  join: d_dates {
    view_label: "Date"
    type: left_outer
    sql_on: ${f_lineitems.l_shipdatekey}=${d_dates.datekey};;
    relationship: many_to_many
    }
}


  #Questions to clarify
  #1. primary key definition to discuss
  #2. git repo do discuss
  #3.  fact table has multiple date columns and the homework did not specify which one to use, how to decide which one is the right one?
  #4. the homework said many to many relationship. will looker able to use many to many just like that?
