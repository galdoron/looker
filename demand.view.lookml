
- view: demand
  derived_table:
    sql: |
      SELECT *
      FROM TABLE_QUERY(rivery,'table_id  contains "raw_sara_report_prt_"')

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: ad_server
    type: string
    sql: ${TABLE}.ad_server

  - dimension_group: date
    type: time
    timeframes: [date, week,quarter, month]
    sql: ${TABLE}.date

  - dimension: advertiser
    suggestable: true
    suggest_persist_for: 12 hours
    type: string
    sql: ${TABLE}.advertiser

  - dimension: inventory_source
    suggestable: true
    suggest_persist_for: 12 hours
    type: string
    sql: ${TABLE}.inventory_source

#  - dimension: ad_impressions
#    type: number
#    sql: ${TABLE}.ad_impressions

#  - dimension: ad_revenue
#    type: number
#    sql: ${TABLE}.ad_revenue
    
  - measure: ad_impressions
    type: sum
    sql: ${TABLE}.ad_impressions

  - measure: ad_revenue
    type: sum
    sql: ${TABLE}.ad_revenue

#  - dimension_group: email_date
#    type: time
#    sql: ${TABLE}.email_date

#  - dimension: file_name
#    type: string
#    sql: ${TABLE}.file_name

  sets:
    detail:
      - ad_server
      - date_time
      - advertiser
      - inventory_source
      - ad_impressions
      - ad_revenue
      - email_date_time
      - file_name

