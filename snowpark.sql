# The Snowpark package is required for Python Worksheets. 
# You can add more packages by selecting them using the Packages control and then importing them.

import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col

def main(session: snowpark.Session): 
    # Your code goes here, inside the "main" handler.
    tableName1='DA_DSM_SCANALYTICS_PROD.INTEGRATED.GLBL_MERCH_POS_CHNL_MCCF_SC_V'
    tableName2='NGP_DA_PROD.POS.POS_CHNL_MCCF_SC_TREND_AGG'

    merchdf=session.table(tableName1)
    chanldf=session.table(tableName2)
    merch_attr_list= 'SEASON_YEAR_DESCRIPTION','FIELDS_OF_PLAY_NAME'
    ,'CONSUMER_CONSTRUCT_SEGMENT_NAME'
    ,'CONSUMER_CONSTRUCT_DIMENSION_NAME'
    ,'BRAND_NAME'
    ,'FRANCHISE'
    ,'SUB_FRANCHISE'
    ,'CATEGORY'
    ,'MODEL_GROUPS'
    ,'PRODUCT_PLANNING_DIVISION_NAME'
    ,'FAMILY'
    ,'SUB_FAMILY'
    ,'EXPRESS_LANE'
    ,'PRODUCT_PLANNING_AGE_GENDER_NAME'
    ,'PRODUCT_PLANNING_STRUCTURE_NAME'
    merch_kpi_list='TOTAL_NET_SALES_AMT_TY'
    ,'TOTAL_NET_SALES_AMT_LY'
    ,'TOTAL_NET_SALES_UNITS_TY'
    ,'TOTAL_NET_SALES_UNITS_LY'
    ,COUNT(DISTINCT PRODUCT_CODE) TOTAL_PRODUCTS

    #df3=df22.select('CONSUMER_CONSTRUCT_GLOBAL_CONSUMER_OFFENSE_NAME').distinct()
    merchdf_agg=merchdf.select().group_by(merch_attr_list)
    .agg({'TOTAL_NET_SALES_AMT_TY': 'sum', 
          'TOTAL_NET_SALES_AMT_LY': 'sum', 
          'TOTAL_NET_SALES_UNITS_TY': 'sum', 
          'TOTAL_NET_SALES_UNITS_LY': 'sum', 
          'ID': 'count'})
        .reset_index()
        .rename(columns={'ID': 'count'})
    [[merch_kpi_list]].sum()
    # Return value will appear in the Results tab.
    return dataframe
