connection: "kasatria_looker_test"

# include all the views
include: "/views/**/*.view"

datagroup: kasatria_looker_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kasatria_looker_test_default_datagroup

explore: arena {}

explore: games {
  join: gamescore {
    type: left_outer
    sql_on:${games.game_id} = ${gamescore.game_id}  ;;
    relationship: one_to_many
  }
  join: players {
    type: left_outer
    sql_on:${gamescore.player_id} = ${players.player_id}  ;;
    relationship: many_to_one
  }
  join: arena {
    type: left_outer
    sql_on:${games.arena} = ${arena.arena_id}  ;;
    relationship: many_to_one
  }

  join: starter {
  # // from: players
    type: left_outer
    sql_on:${games.starter} = ${starter.player_id}  ;;
    relationship: one_to_one
  }

  join: winner {
 #   from: players
    type: left_outer
    sql_on:${games.winner} = ${winner.player_id}  ;;
    relationship: one_to_one
  }

}

explore: gamescore {
  join: games {
    type: left_outer
    sql_on: ${gamescore.game_id}  = ${games.game_id} ;;
    relationship: many_to_one
  }

  join: players {
    type: left_outer
    sql_on: ${gamescore.player_id}  = ${players.player_id} ;;
    relationship: many_to_one
  }

}

explore: nationalities {

}

explore: players {

  join: gamescore {
    type: left_outer
    sql_on: ${players.player_id} =  ${gamescore.player_id}  ;;
    relationship: one_to_many
  }

  join: games {
    type: left_outer
    sql_on: ${gamescore.game_id} =  ${games.game_id}  ;;
    relationship: many_to_one
  }

  join: nationalities {
    type: left_outer
    sql_on: ${players.nationality} =  ${nationalities.nationality_id}  ;;
    relationship: one_to_one
  }
}
