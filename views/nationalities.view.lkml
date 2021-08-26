view: nationalities {
  sql_table_name: `satu.nationalities`  ;;
  dimension: nationality_id {
    description: "Nationality Code"
    type: string
    sql: ${TABLE}.Nationality_ID ;;
  }

  dimension: country {
    description: "Country Name"
    type: string
    sql: ${TABLE}.Country ;;
  }

  dimension: imgurl {
    description: "Image of Country Flag"
    type: string
    sql: ${TABLE}.ImgUrl ;;
  }

  dimension: flag {
    type: string
    sql: ${TABLE}.ImgUrl;;
    html: <img style="width: 48px;height: 27px;" src="{{value}}" /> ;;
  }
}
