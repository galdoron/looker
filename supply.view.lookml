
- view: supply
  derived_table:
    sql: |
      select DAY, partner, inventory, impressions, revenues, media_margin, shortpartnername, GROUP, fee, OWNER, manager, ad_server, gross_margin, ad_server_fees, platform_fees FROM TABLE_QUERY(rivery,'table_id  contains "raw_sara_platform_prt_"')

  fields:
  - dimension_group: day
    type: time
    timeframes: [date, week,quarter, month]    
    sql: ${TABLE}.DAY

  - dimension: owner
    type: string
    suggestable: true
    suggest_persist_for: 12 hours    
    sql: ${TABLE}.OWNER

  - dimension: shortpartnername
    type: string
    suggestable: true
    suggest_persist_for: 12 hours    
    sql: ${TABLE}.shortpartnername

  - dimension: partner
    type: string
    suggestable: true
    suggest_persist_for: 12 hours    
    sql: ${TABLE}.partner


  - dimension: group
    suggestable: true
    suggest_persist_for: 12 hours  
    type: string
    sql: ${TABLE}.GROUP

  - dimension: manager
    suggestable: true
    suggest_persist_for: 12 hours  
    type: string
    sql: ${TABLE}.manager

  - dimension: ad_server
    suggestable: true
    suggest_persist_for: 12 hours  
    type: string
    sql: ${TABLE}.ad_server

  - Measure: inventory
    type: sum
    sql: ${TABLE}.inventory

  - Measure: impressions
    type: sum
    sql: ${TABLE}.impressions

  - Measure: revenues
    type: sum
    sql: ${TABLE}.revenues

  - Measure: media_margin
    type: sum
    sql: ${TABLE}.media_margin

  - Measure: fee
    type: sum
    sql: ${TABLE}.fee

  - Measure: gross_margin
    type: sum
    sql: ${TABLE}.gross_margin

  - Measure: ad_server_fees
    type: sum
    sql: ${TABLE}.ad_server_fees

  - Measure: platform_fees
    type: sum
    sql: ${TABLE}.platform_fees

#  - dimension: inventory
#    type: string
#    sql: ${TABLE}.inventory

#  - dimension: impressions
#    type: number
#    sql: ${TABLE}.impressions
#
#  - dimension: revenues
#    type: number
#    sql: ${TABLE}.revenues
#
#  - dimension: media_margin
#    type: number
#    sql: ${TABLE}.media_margin
#
#  - dimension: shortpartnername
#    type: string
#    sql: ${TABLE}.shortpartnername
#
#  - dimension: group
#    type: string
#    sql: ${TABLE}.GROUP
#
#  - dimension: fee
#    type: number
#    sql: ${TABLE}.fee

#  - dimension: gross_margin
#    type: number
#    sql: ${TABLE}.gross_margin

#  - dimension: ad_server_fees
#    type: number
#    sql: ${TABLE}.ad_server_fees

#  - dimension: platform_fees
#    type: number
#    sql: ${TABLE}.platform_fees
  sets:
    detail:
      - day_time
      - inventory
      - impressions
      - revenues
      - media_margin
      - shortpartnername
      - group
      - fee
      - owner
      - manager
      - ad_server
      - gross_margin
      - ad_server_fees
      - platform_fees

