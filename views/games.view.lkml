view: games {
  sql_table_name: `satu.games`
    ;;
  drill_fields: [game_id]

  dimension: game_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Game_ID ;;
  }

  dimension: arena {
    type: string
    sql: ${TABLE}.Arena ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.Date ;;
  }

  dimension: starter {
    type: string
    sql: ${TABLE}.Starter ;;
  }

  dimension: time_elapsed {
    type: number
    sql: ${TABLE}.Time_Elapsed ;;
  }

  dimension: winner {
    type: string
    sql: ${TABLE}.Winner ;;
  }

  measure: count {
    type: count
    drill_fields: [game_id, gamescore.count]
  }
}
