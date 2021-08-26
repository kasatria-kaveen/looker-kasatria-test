view: arena {
  sql_table_name: `satu.arena`
    ;;
  drill_fields: [arena_id]

  dimension: arena_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Arena_ID ;;
  }

  dimension: arena_name {
    type: string
    sql: ${TABLE}.Arena_Name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.Country ;;
  }

  measure: count {
    type: count
    drill_fields: [arena_id, arena_name]
  }
}
