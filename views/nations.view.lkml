view: nations {
  sql_table_name: `kasatria-next-gen-test.raw_data.nations`
    ;;

  dimension: capital {
    type: string
    sql: ${TABLE}.capital ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
    primary_key: yes
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.full_name ;;
  }

  dimension: independence {
    type: number
    sql: ${TABLE}.independence ;;
  }

  dimension: national_flower {
    type: string
    sql: ${TABLE}.national_flower ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.population ;;
  }

  measure: count {
    type: count
    drill_fields: [full_name]
  }
}
