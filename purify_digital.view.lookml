
- view: purify_digital
  derived_table:
    sql: |
      select 
           concat('$',
           string(case 
              when float(REGEXP_EXTRACT(inventory_source, r'([0123456789.]+)')) is null then float(round(ad_revenue/ad_impressions*1000,2))
              else float(REGEXP_EXTRACT(inventory_source, r'([0123456789.]+)')) end)) as CPM,
          'Purify Digital' as AdvertiserName,
          date(date) as date,
          sum(ad_impressions) as Impressions,
          round(sum(ad_revenue),2) as Cost
      from TABLE_QUERY(rivery,'table_id  contains (concat("raw_sara_report_prt_",string(year(date(date_add(CURRENT_DATE(),-1,"day")))),string(month(date(date_add(CURRENT_DATE(),-1,"day"))))))')
        where upper(inventory_source) contains ('PURIFY') and upper(inventory_source) contains ('DIGITAL')
      group by CPM,AdvertiserName,date
      order by CPM,AdvertiserName,date

  fields:
  - measure: count
    type: count
    drill_fields: detail*

  - dimension: cpm
    type: string
    sql: ${TABLE}.CPM

  - dimension: advertiser_name
    type: string
    sql: ${TABLE}.AdvertiserName

  - dimension: date
    timeframes: [date, week,quarter, month]  
    type: time
    sql: ${TABLE}.date

  - measure: impressions
    type: sum
    sql: ${TABLE}.Impressions

  - measure: cost
    type: sum
    sql: ${TABLE}.Cost

  sets:
    detail:
      - cpm
      - advertiser_name
      - date
      - impressions
      - cost

