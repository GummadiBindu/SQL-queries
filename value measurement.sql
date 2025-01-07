Skip to main content
Skip to editor
Skip to results
Site
Worksheets
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
184
185
186
187
188
189
190
191
192
193
194
195
196
197
198
199
200
201
202
203
204
205
206
207
208
209
210
211
212
213
214
215
216
217
218
219
/* planning groups data load*/
(sum(pre1.total_gross_sales_amt)-sum(pre2.total_gross_sales_amt)) as total_gross_sales_amt_compare
from DEMAND_PLATFORM_PROD.BCL.PRESEASON_NDDC_AP_EQ_PUBLISHED_PLAN_V_V1 pre1
left join DEMAND_PLATFORM_PROD.BCL.NDDC_PRODUCT_PUBLISHED_PLAN_V_V1 pre2
on pre1.style_nm=pre2.style_nm
and pre1.season_year_nm=pre2.season_year_nm
and pre1.division_cd=pre2.division_cd
where pre1.season_year_nm='SU2023'
group by 1,2,3,4;

/* specific snapshot relevant to buy plan*/
select season_year_nm,style_nm,max(snapshot_dt) as max_dt,min(snapshot_dt) as min_dt,
sum(adjusted_demand_amt) as adjusted_demand_amt,
sum(total_gross_sales_amt) as total_gross_sales_amt,
sum(full_price_gross_sales_amt) as full_price_gross_sales_amt
 from DEMAND_PLATFORM_PROD.BCL.NDDC_PRODUCT_PUBLISHED_PLAN_V_V1
where style_nm in ('DA5455',
'DA5456',
'DA5457',
'DH5088',
'DH5089',
'DV2412',
'FD0828')
and season_year_nm='SP2023'
and snapshot_dt='2022-11-17'
and is_launch = 'N'
and IS_BASE_INLINE = 'Y'
group by 1,2;

/* PSSP actuals*/

select NPR_SEASON_YEAR_CD,MANAGEMENT_GEO_NM,consumer_sales_channel_cd,
style_nbr,
sum(GROSS_SALES_AMT) as GROSS_SALES_AMT,
sum(GROSS_SALES_AMT_USD) as GROSS_SALES_AMT_USD,
sum(NET_SALES_AMT) as NET_SALES_AMT,
sum(NET_SALES_AMT_USD) as NET_SALES_AMT_USD,
sum(TOTAL_DEMAND_AMT) as TOTAL_DEMAND_AMT,
sum(TOTAL_DEMAND_AMT_USD) as TOTAL_DEMAND_AMT_USD

from DEMAND_PLANNING_PROD.BCL.DP_DIRECT_CONSUMER_SALES_GTIN_DAILY_V
where consumer_sales_channel_cd='DTC'
and MANAGEMENT_GEO_CD='69'
and NPR_SEASON_YEAR_CD in ('SP2023') 
and style_nbr in ('DA5455',
'DA5456',
'DA5457',
'DH5088',
'DH5089',
'DV2412',
'FD0828')
group by 1,2,3,4;
desc table DEMAND_PLANNING_PROD.BCL.DP_DIRECT_CONSUMER_SALES_GTIN_DAILY_V;


desc table DEMAND_PLANNING_PROD.BCL.DP_DIRECT_CONSUMER_SALES_GTIN_DAILY_V;

/* all snapshots - that's not the way to do*/
select season_year_nm,style_nm,max(snapshot_dt) as max_dt,min(snapshot_dt) as min_dt,
sum(adjusted_demand_amt) as adjusted_demand_amt,
sum(total_gross_sales_amt) as total_gross_sales_amt,
sum(full_price_gross_sales_amt) as full_price_gross_sales_amt
 from DEMAND_PLATFORM_PROD.BCL.NDDC_PRODUCT_PUBLISHED_PLAN_V_V1
where /*style_nm in ('DA5455',
Re-run your query. Query results are cached for 24 hours.
Query Details
Query duration
8.4s
Rows
10
Query ID
01afff61-0707-074f-0007-8d098a93a4af
Databases
Worksheets
Search

Sorted by Viewed descending
