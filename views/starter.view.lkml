view: starter {
  sql_table_name: `satu.players`
  ;;
  dimension: player_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Player_ID ;;
  }

  dimension: first_name {
    type: string
    label: "Starter"
    sql: ${TABLE}.First_Name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.Last_Name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
    label: "Starter"
    drill_fields: [player_id, name,nationalities.country, nationalities.flag]
  }

  dimension: nationality {
    type: string
    sql: ${TABLE}.Nationality ;;
  }

  measure: count {
    type: count
    drill_fields: [player_id, first_name, last_name, name, gamescore.count]
  }


}
