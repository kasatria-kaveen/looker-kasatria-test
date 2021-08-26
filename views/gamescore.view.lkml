view: gamescore {
  sql_table_name: `satu.gamescore`
    ;;

  dimension: gamescore_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Gamescore_ID ;;
  }

  dimension: game_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Game_ID ;;
  }

  dimension: player_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.Player_ID ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.Score ;;
  }

  measure: games {
    type: count
    label: "Games Played"
    drill_fields: [players.name, games.game_id, games.winner]
  }

  measure: points {
    type: sum
    label: "Points"
    sql: ${TABLE}.score ;;
    drill_fields: [user_details*]
  }

  measure: wins {
    type: count
    label: "Wins"
    filters: [score: ">0"]
  }

  set: user_details {
    fields: [games.date, games.arena_name, games.time_elapsed, starter.first_name, winner.first_name]
  }

}
