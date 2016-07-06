
- view: supply
  derived_table:
    sql: |
      select DAY, partner, inventory, impressions, revenues, media_margin, shortpartnername, GROUP, fee, OWNER, manager, ad_server, gross_margin, ad_server_fees, platform_fees 
      FROM 
      (
      TABLE_QUERY(rivery,'table_id contains "raw_sara_platform_prt_" and REGEXP_REPLACE(regexp_extract(table_id,"[^_]([0-9]+_[0-9]+)"),"_","") <= 
      concat(string(year(DATE_ADD(timestamp({% parameter end_date %}),0,"day"))),SUBSTR(string(date(DATE_ADD(timestamp({% parameter end_date %}),0,"day"))),6,2),SUBSTR(string(date(DATE_ADD(timestamp({% parameter end_date %}),0,"day"))),9,2))
      and REGEXP_REPLACE(regexp_extract(table_id,"[^_]([0-9]+_[0-9]+)"),"_","") >= 
      concat(string(year(DATE_ADD(timestamp({% parameter start_date %}),0,"day"))),SUBSTR(string(date(DATE_ADD(timestamp(timestamp({% parameter start_date %})),0,"day"))),6,2),SUBSTR(string(date(DATE_ADD(timestamp({% parameter start_date %}),0,"day"))),9,2))')
      )

  fields:

  # FILTERS
  - filter: start_date
    label: 'FILTER Start Date'
    suggestions: [2014-12-01, 2014-12-02]
     
  - filter: end_date
    label: 'FILTER End Date'
    suggestions: [2014-12-01, 2014-12-02]
     
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

  - dimension: LOB
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

  - measure: inventory
    type: sum
    sql: ${TABLE}.inventory

  - measure: impressions
    type: sum
    sql: ${TABLE}.impressions

  - measure: revenues
    type: sum
    sql: ${TABLE}.revenues

  - measure: media_margin
    type: sum
    sql: ${TABLE}.media_margin

  - measure: fee
    type: sum
    sql: ${TABLE}.fee

  - measure: gross_margin
    type: sum
    sql: ${TABLE}.gross_margin

  - measure: ad_server_fees
    type: sum
    sql: ${TABLE}.ad_server_fees

  - measure: platform_fees
    type: sum
    sql: ${TABLE}.platform_fees


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

