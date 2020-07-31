{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: 'dplyr'\n",
      "\n",
      "\n",
      "The following objects are masked from 'package:stats':\n",
      "\n",
      "    filter, lag\n",
      "\n",
      "\n",
      "The following objects are masked from 'package:base':\n",
      "\n",
      "    intersect, setdiff, setequal, union\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(ggplot2)\n",
    "library(dplyr)\n",
    "library(statsr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "load(\"gss.rdata\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table>\n",
       "<caption>A data.frame: 6 × 114</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>caseid</th><th scope=col>year</th><th scope=col>age</th><th scope=col>sex</th><th scope=col>race</th><th scope=col>hispanic</th><th scope=col>uscitzn</th><th scope=col>educ</th><th scope=col>paeduc</th><th scope=col>maeduc</th><th scope=col>...</th><th scope=col>news</th><th scope=col>tvhours</th><th scope=col>racdif1</th><th scope=col>racdif2</th><th scope=col>racdif3</th><th scope=col>racdif4</th><th scope=col>helppoor</th><th scope=col>helpnot</th><th scope=col>helpsick</th><th scope=col>helpblk</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>...</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;fct&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1</td><td>1972</td><td>23</td><td>Female</td><td>White</td><td>NA</td><td>NA</td><td>16</td><td>10</td><td>NA</td><td>...</td><td>Everyday   </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>2</td><td>1972</td><td>70</td><td>Male  </td><td>White</td><td>NA</td><td>NA</td><td>10</td><td> 8</td><td> 8</td><td>...</td><td>Everyday   </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>3</td><td>1972</td><td>48</td><td>Female</td><td>White</td><td>NA</td><td>NA</td><td>12</td><td> 8</td><td> 8</td><td>...</td><td>Everyday   </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>4</td><td>1972</td><td>27</td><td>Female</td><td>White</td><td>NA</td><td>NA</td><td>17</td><td>16</td><td>12</td><td>...</td><td>Once A Week</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>5</td><td>1972</td><td>61</td><td>Female</td><td>White</td><td>NA</td><td>NA</td><td>12</td><td> 8</td><td> 8</td><td>...</td><td>Everyday   </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>6</td><td>1972</td><td>26</td><td>Male  </td><td>White</td><td>NA</td><td>NA</td><td>14</td><td>18</td><td>19</td><td>...</td><td>Everyday   </td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td><td>NA</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 114\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & caseid & year & age & sex & race & hispanic & uscitzn & educ & paeduc & maeduc & ... & news & tvhours & racdif1 & racdif2 & racdif3 & racdif4 & helppoor & helpnot & helpsick & helpblk\\\\\n",
       "  & <int> & <int> & <int> & <fct> & <fct> & <fct> & <fct> & <int> & <int> & <int> & ... & <fct> & <int> & <fct> & <fct> & <fct> & <fct> & <fct> & <fct> & <fct> & <fct>\\\\\n",
       "\\hline\n",
       "\t1 & 1 & 1972 & 23 & Female & White & NA & NA & 16 & 10 & NA & ... & Everyday    & NA & NA & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t2 & 2 & 1972 & 70 & Male   & White & NA & NA & 10 &  8 &  8 & ... & Everyday    & NA & NA & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t3 & 3 & 1972 & 48 & Female & White & NA & NA & 12 &  8 &  8 & ... & Everyday    & NA & NA & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t4 & 4 & 1972 & 27 & Female & White & NA & NA & 17 & 16 & 12 & ... & Once A Week & NA & NA & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t5 & 5 & 1972 & 61 & Female & White & NA & NA & 12 &  8 &  8 & ... & Everyday    & NA & NA & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\t6 & 6 & 1972 & 26 & Male   & White & NA & NA & 14 & 18 & 19 & ... & Everyday    & NA & NA & NA & NA & NA & NA & NA & NA & NA\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 114\n",
       "\n",
       "| <!--/--> | caseid &lt;int&gt; | year &lt;int&gt; | age &lt;int&gt; | sex &lt;fct&gt; | race &lt;fct&gt; | hispanic &lt;fct&gt; | uscitzn &lt;fct&gt; | educ &lt;int&gt; | paeduc &lt;int&gt; | maeduc &lt;int&gt; | ... ... | news &lt;fct&gt; | tvhours &lt;int&gt; | racdif1 &lt;fct&gt; | racdif2 &lt;fct&gt; | racdif3 &lt;fct&gt; | racdif4 &lt;fct&gt; | helppoor &lt;fct&gt; | helpnot &lt;fct&gt; | helpsick &lt;fct&gt; | helpblk &lt;fct&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1 | 1972 | 23 | Female | White | NA | NA | 16 | 10 | NA | ... | Everyday    | NA | NA | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 2 | 2 | 1972 | 70 | Male   | White | NA | NA | 10 |  8 |  8 | ... | Everyday    | NA | NA | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 3 | 3 | 1972 | 48 | Female | White | NA | NA | 12 |  8 |  8 | ... | Everyday    | NA | NA | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 4 | 4 | 1972 | 27 | Female | White | NA | NA | 17 | 16 | 12 | ... | Once A Week | NA | NA | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 5 | 5 | 1972 | 61 | Female | White | NA | NA | 12 |  8 |  8 | ... | Everyday    | NA | NA | NA | NA | NA | NA | NA | NA | NA |\n",
       "| 6 | 6 | 1972 | 26 | Male   | White | NA | NA | 14 | 18 | 19 | ... | Everyday    | NA | NA | NA | NA | NA | NA | NA | NA | NA |\n",
       "\n"
      ],
      "text/plain": [
       "  caseid year age sex    race  hispanic uscitzn educ paeduc maeduc ...\n",
       "1 1      1972 23  Female White NA       NA      16   10     NA     ...\n",
       "2 2      1972 70  Male   White NA       NA      10    8      8     ...\n",
       "3 3      1972 48  Female White NA       NA      12    8      8     ...\n",
       "4 4      1972 27  Female White NA       NA      17   16     12     ...\n",
       "5 5      1972 61  Female White NA       NA      12    8      8     ...\n",
       "6 6      1972 26  Male   White NA       NA      14   18     19     ...\n",
       "  news        tvhours racdif1 racdif2 racdif3 racdif4 helppoor helpnot helpsick\n",
       "1 Everyday    NA      NA      NA      NA      NA      NA       NA      NA      \n",
       "2 Everyday    NA      NA      NA      NA      NA      NA       NA      NA      \n",
       "3 Everyday    NA      NA      NA      NA      NA      NA       NA      NA      \n",
       "4 Once A Week NA      NA      NA      NA      NA      NA       NA      NA      \n",
       "5 Everyday    NA      NA      NA      NA      NA      NA       NA      NA      \n",
       "6 Everyday    NA      NA      NA      NA      NA      NA       NA      NA      \n",
       "  helpblk\n",
       "1 NA     \n",
       "2 NA     \n",
       "3 NA     \n",
       "4 NA     \n",
       "5 NA     \n",
       "6 NA     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "head(gss)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "     caseid           year           age           sex           race      \n",
       " Min.   :    1   Min.   :1972   Min.   :18.0   Male  :25146   White:46350  \n",
       " 1st Qu.:14266   1st Qu.:1983   1st Qu.:31.0   Female:31915   Black: 7926  \n",
       " Median :28531   Median :1993   Median :43.0                  Other: 2785  \n",
       " Mean   :28531   Mean   :1992   Mean   :45.7                               \n",
       " 3rd Qu.:42796   3rd Qu.:2002   3rd Qu.:59.0                               \n",
       " Max.   :57061   Max.   :2012   Max.   :89.0                               \n",
       "                                NA's   :202                                \n",
       "                                 hispanic    \n",
       " Not Hispanic                        :16936  \n",
       " Mexican, Mexican American, Chicano/A: 1204  \n",
       " Puerto Rican                        :  258  \n",
       " Spanish                             :   83  \n",
       " Cuban                               :   77  \n",
       " (Other)                             :  362  \n",
       " NA's                                :38141  \n",
       "                                                                                             uscitzn     \n",
       " A U.S. Citizen                                                                                  :  375  \n",
       " Not A U.S. Citizen                                                                              :  378  \n",
       " A U.S. Citizen Born In Puerto Rico, The U.S. Virgin Islands, Or The Northern Marianas Islands   :    6  \n",
       " Born Outside Of The United States To Parents Who Were U.S Citizens At That Time (If Volunteered):   11  \n",
       " NA's                                                                                            :56291  \n",
       "                                                                                                         \n",
       "                                                                                                         \n",
       "      educ           paeduc          maeduc          speduc     \n",
       " Min.   : 0.00   Min.   : 0.00   Min.   : 0.00   Min.   : 0.00  \n",
       " 1st Qu.:12.00   1st Qu.: 8.00   1st Qu.: 8.00   1st Qu.:12.00  \n",
       " Median :12.00   Median :12.00   Median :12.00   Median :12.00  \n",
       " Mean   :12.75   Mean   :10.55   Mean   :10.71   Mean   :12.78  \n",
       " 3rd Qu.:15.00   3rd Qu.:13.00   3rd Qu.:12.00   3rd Qu.:15.00  \n",
       " Max.   :20.00   Max.   :20.00   Max.   :20.00   Max.   :20.00  \n",
       " NA's   :164     NA's   :16888   NA's   :10132   NA's   :27435  \n",
       "            degree                  vetyears          sei       \n",
       " Lt High School:11822   None            :18093   Min.   :17.10  \n",
       " High School   :29287   Less Than 2 Yrs :  816   1st Qu.:32.40  \n",
       " Junior College: 3070   2 To 4 Years    : 2123   Median :39.00  \n",
       " Bachelor      : 8002   More Than 4 Yrs :  847   Mean   :48.42  \n",
       " Graduate      : 3870   Some,Dk How Long:    5   3rd Qu.:63.50  \n",
       " NA's          : 1010   NA's            :35177   Max.   :97.20  \n",
       "                                                 NA's   :25784  \n",
       "             wrkstat                wrkslf               marital     \n",
       " Working Fulltime:28207   Self-Employed: 6197   Married      :30761  \n",
       " Keeping House   : 9387   Someone Else :47352   Widowed      : 5540  \n",
       " Retired         : 7642   NA's         : 3512   Divorced     : 7070  \n",
       " Working Parttime: 5842                         Separated    : 1984  \n",
       " Unempl, Laid Off: 1873                         Never Married:11686  \n",
       " (Other)         : 4096                         NA's         :   20  \n",
       " NA's            :   14                                              \n",
       "             spwrksta          sibs           childs         agekdbrn    \n",
       " Working Fulltime:16815   Min.   : 0.00   Min.   :0.000   Min.   : 9.00  \n",
       " Keeping House   : 5501   1st Qu.: 2.00   1st Qu.:0.000   1st Qu.:20.00  \n",
       " Retired         : 3561   Median : 3.00   Median :2.000   Median :23.00  \n",
       " Working Parttime: 2743   Mean   : 3.94   Mean   :1.953   Mean   :23.79  \n",
       " Temp Not Working:  598   3rd Qu.: 5.00   3rd Qu.:3.000   3rd Qu.:27.00  \n",
       " (Other)         : 1479   Max.   :68.00   Max.   :8.000   Max.   :65.00  \n",
       " NA's            :26364   NA's   :1679    NA's   :181     NA's   :38942  \n",
       "                 incom16        born                 parborn     \n",
       " Far Below Average   : 3725   Yes :43705   Both In U.S   :39137  \n",
       " Below Average       :10692   No  : 4099   Neither In U.S: 5881  \n",
       " Average             :21941   NA's: 9257   Mother Only   : 1512  \n",
       " Above Average       : 6575                Father Only   : 1047  \n",
       " Far Above Average   :  796                Mother; Fa. Dk:   92  \n",
       " Lived In Institution:   10                (Other)       :   97  \n",
       " NA's                :13322                NA's          : 9295  \n",
       "    granborn                 income06         coninc      \n",
       " Min.   :0.000   $60000 To 74999 :  891   Min.   :   383  \n",
       " 1st Qu.:0.000   Refused         :  860   1st Qu.: 18445  \n",
       " Median :0.000   $40000 To 49999 :  836   Median : 35602  \n",
       " Mean   :1.155   $50000 To 59999 :  734   Mean   : 44503  \n",
       " 3rd Qu.:2.000   $75000 To $89999:  693   3rd Qu.: 59542  \n",
       " Max.   :4.000   (Other)         : 6056   Max.   :180386  \n",
       " NA's   :12065   NA's            :46991   NA's   :5829    \n",
       "             region                    partyid     \n",
       " South Atlantic :10977   Not Str Democrat  :12040  \n",
       " E. Nor. Central:10572   Strong Democrat   : 9117  \n",
       " Middle Atlantic: 8435   Not Str Republican: 9005  \n",
       " Pacific        : 7630   Independent       : 8499  \n",
       " W. Sou. Central: 5363   Ind,Near Dem      : 6743  \n",
       " W. Nor. Central: 4221   (Other)           :11330  \n",
       " (Other)        : 9863   NA's              :  327  \n",
       "                  polviews            relig                    attend     \n",
       " Moderate             :18494   Protestant:33472   Every Week      :11383  \n",
       " Slightly Conservative: 7691   Catholic  :13926   Once A Year     : 7476  \n",
       " Conservative         : 7092   None      : 6113   Sevrl Times A Yr: 7202  \n",
       " Slightly Liberal     : 6181   Jewish    : 1155   2-3X A Month    : 5060  \n",
       " Liberal              : 5582   Other     :  998   More Thn Once Wk: 4370  \n",
       " (Other)              : 2836   (Other)   : 1164   (Other)         :11601  \n",
       " NA's                 : 9185   NA's      :  233   NA's            : 9969  \n",
       "        natspac             natenvir            natheal     \n",
       " Too Little : 3941   Too Little :19259   Too Little :21294  \n",
       " About Right:12655   About Right: 9539   About Right: 8832  \n",
       " Too Much   :14631   Too Much   : 2816   Too Much   : 1955  \n",
       " NA's       :25834   NA's       :25447   NA's       :24980  \n",
       "                                                            \n",
       "                                                            \n",
       "                                                            \n",
       "        natcity             natcrime            natdrug     \n",
       " Too Little :14842   Too Little :21500   Too Little :19555  \n",
       " About Right: 9522   About Right: 8374   About Right: 9218  \n",
       " Too Much   : 4732   Too Much   : 1907   Too Much   : 2642  \n",
       " NA's       :27965   NA's       :25280   NA's       :25646  \n",
       "                                                            \n",
       "                                                            \n",
       "                                                            \n",
       "        nateduc             natrace             natarms     \n",
       " Too Little :20619   Too Little :10458   Too Little : 7427  \n",
       " About Right: 9374   About Right:13744   About Right:13675  \n",
       " Too Much   : 2262   Too Much   : 6107   Too Much   :10325  \n",
       " NA's       :24806   NA's       :26752   NA's       :25634  \n",
       "                                                            \n",
       "                                                            \n",
       "                                                            \n",
       "         nataid             natfare             natroad     \n",
       " Too Little : 1934   Too Little : 6525   Too Little :14701  \n",
       " About Right: 7286   About Right: 9888   About Right:18954  \n",
       " Too Much   :22286   Too Much   :15345   Too Much   : 3840  \n",
       " NA's       :25555   NA's       :25303   NA's       :19566  \n",
       "                                                            \n",
       "                                                            \n",
       "                                                            \n",
       "         natsoc             natmass             natpark     \n",
       " Too Little :21443   Too Little :13636   Too Little :12535  \n",
       " About Right:13582   About Right:18264   About Right:22861  \n",
       " Too Much   : 2335   Too Much   : 3734   Too Much   : 2345  \n",
       " NA's       :19701   NA's       :21427   NA's       :19320  \n",
       "                                                            \n",
       "                                                            \n",
       "                                                            \n",
       "         confinan              conbus              conclerg    \n",
       " A Great Deal: 9015   A Great Deal: 8950   A Great Deal:10649  \n",
       " Only Some   :19659   Only Some   :22628   Only Some   :18958  \n",
       " Hardly Any  : 6379   Hardly Any  : 5597   Hardly Any  : 7755  \n",
       " NA's        :22008   NA's        :19886   NA's        :19699  \n",
       "                                                               \n",
       "                                                               \n",
       "                                                               \n",
       "         coneduc               confed              conlabor    \n",
       " A Great Deal:11692   A Great Deal: 6319   A Great Deal: 4461  \n",
       " Only Some   :21322   Only Some   :19535   Only Some   :20159  \n",
       " Hardly Any  : 5208   Hardly Any  :11783   Hardly Any  :11884  \n",
       " NA's        :18839   NA's        :19424   NA's        :20557  \n",
       "                                                               \n",
       "                                                               \n",
       "                                                               \n",
       "         conpress             conmedic              contv      \n",
       " A Great Deal: 6128   A Great Deal:17931   A Great Deal: 5183  \n",
       " Only Some   :20346   Only Some   :17159   Only Some   :20484  \n",
       " Hardly Any  :11465   Hardly Any  : 3222   Hardly Any  :12482  \n",
       " NA's        :19122   NA's        :18749   NA's        :18912  \n",
       "                                                               \n",
       "                                                               \n",
       "                                                               \n",
       "         conjudge              consci              conlegis    \n",
       " A Great Deal:12091   A Great Deal:15362   A Great Deal: 4899  \n",
       " Only Some   :19460   Only Some   :17796   Only Some   :21756  \n",
       " Hardly Any  : 5551   Hardly Any  : 2613   Hardly Any  :10959  \n",
       " NA's        :19959   NA's        :21290   NA's        :19447  \n",
       "                                                               \n",
       "                                                               \n",
       "                                                               \n",
       "         conarmy                     joblose               jobfind     \n",
       " A Great Deal:14940   Very Likely        :  937   Very Easy    : 4865  \n",
       " Only Some   :17998   Fairly Likely      : 1103   Somewhat Easy: 6120  \n",
       " Hardly Any  : 4709   Not Too Likely     : 4830   Not Easy     : 7687  \n",
       " NA's        :19414   Not Likely         :11897   NA's         :38389  \n",
       "                      Leaving Labor Force:    5                        \n",
       "                      NA's               :38289                        \n",
       "                                                                       \n",
       "               satjob                  richwork           jobinc     \n",
       " Very Satisfied   :19717   Continue Working:15383   Most Impt: 4429  \n",
       " Mod. Satisfied   :15736   Stop Working    : 6565   Second   : 4974  \n",
       " A Little Dissat  : 4109   NA's            :35113   Third    : 6034  \n",
       " Very Dissatisfied: 1715                            Fourth   : 3607  \n",
       " NA's             :15784                            Fifth    : 1528  \n",
       "                                                    NA's     :36489  \n",
       "                                                                     \n",
       "       jobsec           jobhour           jobpromo          jobmeans    \n",
       " Most Impt: 1739   Most Impt:  952   Most Impt: 3810   Most Impt: 9641  \n",
       " Second   : 2781   Second   : 1835   Second   : 7082   Second   : 3899  \n",
       " Third    : 4133   Third    : 2334   Third    : 4824   Third    : 3245  \n",
       " Fourth   : 6516   Fourth   : 4913   Fourth   : 3085   Fourth   : 2450  \n",
       " Fifth    : 5405   Fifth    :10537   Fifth    : 1769   Fifth    : 1333  \n",
       " NA's     :36487   NA's     :36490   NA's     :36491   NA's     :36493  \n",
       "                                                                        \n",
       "           class            rank                  satfin     \n",
       " Lower Class  : 3147   Min.   : 1.00   Satisfied     :15344  \n",
       " Working Class:24458   1st Qu.: 4.00   More Or Less  :23176  \n",
       " Middle Class :24289   Median : 5.00   Not At All Sat:13934  \n",
       " Upper Class  : 1741   Mean   : 4.77   NA's          : 4607  \n",
       " No Class     :    1   3rd Qu.: 6.00                         \n",
       " NA's         : 3425   Max.   :10.00                         \n",
       "                       NA's   :47207                         \n",
       "        finalter                  finrela       unemp        govaid     \n",
       " Better     :19697   Far Below Average: 2891   Yes :10990   Yes : 4325  \n",
       " Worse      :11967   Below Average    :12599   No  :24517   No  : 7760  \n",
       " Stayed Same:20654   Average          :25957   NA's:21554   NA's:44976  \n",
       " NA's       : 4743   Above Average    : 9623                            \n",
       "                     Far Above Average: 1045                            \n",
       "                     NA's             : 4946                            \n",
       "                                                                        \n",
       "  getaid                      union               getahead    \n",
       " Yes :  281   R Belongs          : 4424   Hard Work   :23022  \n",
       " No  : 1179   Spouse Belongs     : 2056   Both Equally: 7834  \n",
       " NA's:55601   R And Spouse Belong:  628   Luck Or Help: 4085  \n",
       "              Neither Belongs    :32270   Other       :   36  \n",
       "              NA's               :17683   NA's        :22084  \n",
       "                                                              \n",
       "                                                              \n",
       "             parsol                           kidssol      abdefect    \n",
       " Much Better    : 4873   Much Better              : 3587   Yes :31428  \n",
       " Somewhat Better: 4539   Somewhat Better          : 4228   No  : 7788  \n",
       " About The Same : 3214   About The Same           : 2762   NA's:17845  \n",
       " Somewhat Worse : 1655   Somewhat Worse           : 1817               \n",
       " Much Worse     :  546   Much Worse               :  614               \n",
       " NA's           :42234   No Children -Volunteered-: 1589               \n",
       "                         NA's                     :42464               \n",
       " abnomore      abhlth       abpoor       abrape      absingle      abany      \n",
       " Yes :17245   Yes :35321   Yes :18471   Yes :31865   Yes :17241   Yes :12887  \n",
       " No  :21848   No  : 4063   No  :20557   No  : 7116   No  :21779   No  :18920  \n",
       " NA's:17968   NA's:17677   NA's:18033   NA's:18080   NA's:18041   NA's:25254  \n",
       "                                                                              \n",
       "                                                                              \n",
       "                                                                              \n",
       "                                                                              \n",
       "               pillok         sexeduc                 divlaw     \n",
       " Strongly Agree   : 5571   Favor  :26501   Easier        : 9155  \n",
       " Agree            : 6459   Oppose : 4170   More Difficult:16382  \n",
       " Disagree         : 4691   Depends:    9   Stay Same     : 7147  \n",
       " Strongly Disagree: 4027   NA's   :26381   NA's          :24377  \n",
       " NA's             :36313                                         \n",
       "                                                                 \n",
       "                                                                 \n",
       "             premarsx                 teensex                  xmarsex     \n",
       " Always Wrong    : 9244   Always Wrong    :15165   Always Wrong    :25929  \n",
       " Almst Always Wrg: 3200   Almst Always Wrg: 3540   Almst Always Wrg: 4581  \n",
       " Sometimes Wrong : 7044   Sometimes Wrong : 2106   Sometimes Wrong : 2652  \n",
       " Not Wrong At All:14060   Not Wrong At All:  891   Not Wrong At All:  857  \n",
       " Other           :    0   Other           :    0   Other           :    0  \n",
       " NA's            :23513   NA's            :35359   NA's            :23042  \n",
       "                                                                           \n",
       "             homosex      suicide1     suicide2     suicide3     suicide4    \n",
       " Always Wrong    :21601   Yes :15924   Yes : 2477   Yes : 2514   Yes : 4579  \n",
       " Almst Always Wrg: 1581   No  :12902   No  :27097   No  :26990   No  :24629  \n",
       " Sometimes Wrong : 2243   NA's:28235   NA's:27487   NA's:27557   NA's:27853  \n",
       " Not Wrong At All: 7282                                                      \n",
       " Other           :   82                                                      \n",
       " NA's            :24272                                                      \n",
       "                                                                             \n",
       "   fear           owngun          pistol         shotgun          rifle      \n",
       " Yes :14010   Yes    :14000   Yes    : 7418   Yes    : 8457   Yes    : 8309  \n",
       " No  :20285   No     :20144   No     :26479   No     :25432   No     :25580  \n",
       " NA's:22766   Refused:  315   Refused:  322   Refused:  322   Refused:  322  \n",
       "              NA's   :22602   NA's   :22842   NA's   :22850   NA's   :22850  \n",
       "                                                                             \n",
       "                                                                             \n",
       "                                                                             \n",
       "                news          tvhours       racdif1      racdif2     \n",
       " Everyday         :17023   Min.   : 0.000   Yes : 9630   Yes : 3434  \n",
       " Few Times A Week : 7654   1st Qu.: 2.000   No  :14456   No  :20987  \n",
       " Once A Week      : 4599   Median : 2.000   NA's:32975   NA's:32640  \n",
       " Less Than Once Wk: 3608   Mean   : 2.971                            \n",
       " Never            : 2805   3rd Qu.: 4.000                            \n",
       " NA's             :21372   Max.   :24.000                            \n",
       "                           NA's   :23206                             \n",
       " racdif3      racdif4                    helppoor    \n",
       " Yes :12005   Yes :12765   Govt Action       : 4806  \n",
       " No  :12454   No  :11062   Agree With Both   :12273  \n",
       " NA's:32602   NA's:33234   People Help Selves: 3087  \n",
       "                           NA's              :36895  \n",
       "                                                     \n",
       "                                                     \n",
       "                                                     \n",
       "               helpnot                    helpsick    \n",
       " Govt Do More      : 4061   Govt Should Help  : 8241  \n",
       " Agree With Both   :10874   Agree With Both   : 8903  \n",
       " Govt Does Too Much: 4137   People Help Selves: 2183  \n",
       " NA's              :37989   NA's              :37734  \n",
       "                                                      \n",
       "                                                      \n",
       "                                                      \n",
       "                 helpblk     \n",
       " Govt Help Blks      : 2688  \n",
       " Agree With Both     : 8540  \n",
       " No Special Treatment: 8656  \n",
       " NA's                :37177  \n",
       "                             \n",
       "                             \n",
       "                             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(gss)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>57061</li><li>114</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 57061\n",
       "\\item 114\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 57061\n",
       "2. 114\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 57061   114"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "dim(gss)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [],
   "source": [
    "#subsettibg sccordinf to research question\n",
    "df <- select(gss,year,region,consci) %>% na.omit() %>%\n",
    "  mutate(negative=grepl(\"Hardly\",consci)) %>%\n",
    "mutate(recent=as.factor(ifelse(year>=2006,\"R\",\"H\"))) \n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "      year                  region              consci       negative      \n",
       " Min.   :1973   E. Nor. Central:6848   A Great Deal:15362   Mode :logical  \n",
       " 1st Qu.:1980   South Atlantic :6760   Only Some   :17796   FALSE:33158    \n",
       " Median :1989   Middle Atlantic:5392   Hardly Any  : 2613   TRUE :2613     \n",
       " Mean   :1990   Pacific        :4863                                       \n",
       " 3rd Qu.:2000   W. Sou. Central:3203                                       \n",
       " Max.   :2012   W. Nor. Central:2624                                       \n",
       "                (Other)        :6081                                       \n",
       " recent   \n",
       " H:30010  \n",
       " R: 5761  \n",
       "          \n",
       "          \n",
       "          \n",
       "          \n",
       "          "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "                 \n",
       "                  FALSE TRUE\n",
       "  New England      1620   83\n",
       "  Middle Atlantic  5016  376\n",
       "  E. Nor. Central  6387  461\n",
       "  W. Nor. Central  2441  183\n",
       "  South Atlantic   6181  579\n",
       "  E. Sou. Central  2008  227\n",
       "  W. Sou. Central  2895  308\n",
       "  Mountain         2030  113\n",
       "  Pacific          4580  283"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df_table <- table(df$region,df$negative)\n",
    "df_table"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "                 \n",
       "                        FALSE        TRUE\n",
       "  New England     0.045288083 0.002320315\n",
       "  Middle Atlantic 0.140225322 0.010511308\n",
       "  E. Nor. Central 0.178552459 0.012887535\n",
       "  W. Nor. Central 0.068239635 0.005115876\n",
       "  South Atlantic  0.172793604 0.016186296\n",
       "  E. Sou. Central 0.056134858 0.006345923\n",
       "  W. Sou. Central 0.080931481 0.008610327\n",
       "  Mountain        0.056749881 0.003158984\n",
       "  Pacific         0.128036678 0.007911437"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#findind the probality for each region with respect to negative\n",
    "prop.table(df_table)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\nrkJggg==",
      "text/plain": [
       "plot without title"
      ]
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#The table do seem to indicate that there is a difference between regions: while the count table shows consistency on the \n",
    "#magnitude of the ‘positive’ view of scientific community across the regions, using the proportion table highlights how they differ\n",
    "\n",
    "#plots\n",
    "g <- ggplot(df, aes(x=region,fill=negative)) +\n",
    "  geom_bar(position = \"fill\")+\n",
    "  xlab(\"Region across\") +ylab(\"proportion for eacch region\")+\n",
    "  scale_fill_discrete(name=\"Opinion\",labels=c(\"Positive\",\"Negative\"))\n",
    "g\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "      year                  region              consci      negative      \n",
       " Min.   :2006   South Atlantic :1242   A Great Deal:2404   Mode :logical  \n",
       " 1st Qu.:2006   E. Nor. Central: 980   Only Some   :2970   FALSE:5374     \n",
       " Median :2008   Pacific        : 856   Hardly Any  : 387   TRUE :387      \n",
       " Mean   :2009   Middle Atlantic: 716                                      \n",
       " 3rd Qu.:2010   W. Sou. Central: 611                                      \n",
       " Max.   :2012   Mountain       : 461                                      \n",
       "                (Other)        : 895                                      \n",
       " recent  \n",
       " H:   0  \n",
       " R:5761  \n",
       "         \n",
       "         \n",
       "         \n",
       "         \n",
       "         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#This study also included a look at the recent data - defined as 2006 and beyond - since it could indicate broader societal changes that would be of interest.\n",
    "#now consider data past 2006\n",
    "since2006 <- filter(df,recent==\"R\")\n",
    "summary(since2006)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "                 \n",
       "                        FALSE        TRUE\n",
       "  New England     0.045288083 0.002320315\n",
       "  Middle Atlantic 0.140225322 0.010511308\n",
       "  E. Nor. Central 0.178552459 0.012887535\n",
       "  W. Nor. Central 0.068239635 0.005115876\n",
       "  South Atlantic  0.172793604 0.016186296\n",
       "  E. Sou. Central 0.056134858 0.006345923\n",
       "  W. Sou. Central 0.080931481 0.008610327\n",
       "  Mountain        0.056749881 0.003158984\n",
       "  Pacific         0.128036678 0.007911437"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "since2006_table <- table(df$region,df$negative)\n",
    "prop.table(since2006_table)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAMAAADKOT/pAAAAP1BMVEUAAAAAv8QzMzNNTU1o\naGh8fHyMjIyampqnp6eysrK9vb3Hx8fQ0NDZ2dnh4eHp6enr6+vw8PDy8vL4dm3///92l2KZ\nAAAACXBIWXMAABJ0AAASdAHeZh94AAAgAElEQVR4nO2diXbqurYFfY+BkJbHu/7/b73uLbkB\nA8qMPU+tMXYAI0rytAo3kOysoCjq5cr+egAU5VCIRFEJCpEoKkEhEkUlKESiqASFSBSVoBCJ\nohIUIlFUgkIkikpQiERRCSqNSNnTmOvb8jNZdhg6aOpwviYdxxOdRH08v+I3qxvJ8eN2q6IL\n8O448uzS379k+VMDj8Iqiq+3fC6rW+RwsA1tufXnqQzg9PX4MJcrCCx5/bVIy6+scjwOzbrK\nV0/yNfVEJ0qRgsEtjaQZwd1xvGfn/v45e39q4FFY9aO6RnP9FjkcbENbav2Trwjg0QoCS17b\nFSnLfqbNvo/BhEhQr3byayK1I8mzm/uk9SOo9kJdhXunx0YVhPWR5ZVBl49o6V3CAm1cP+XO\n6LuoN8Xp4XGuH0NKbBrKr4g09+AnmBAJ6tVOflmk4vvuO/LaERz7PcfXs+/yUVe9jR/Z+mOl\nWKQbDQ/9G8hxvMd7tbYvUvnjPc8O5Xp/lDcfzZLy7rFN4nwod9Tfzf2vY5a9XdtjmIHzUx52\n528/RXdwE3cQ3ivfqnpwCcs/6ifaJwdMteTcDOq1Tn7KI/r87Xt4ruq0O0Ia2kXddSs5Gu54\nFDNjHI8kaDwaSbsG5b9rf/5yyK7THr/6t/ZTNTVHa/jd2PCd1dvnLft+OKx+ZSfZDas3DLan\nDWl2UcWDLd/UztO4pvNsuqQbWpBu33Gf1TU86Xupkor0Xo/y+62++RiW1FHkwRH1uTkTGYv0\nNRx1L222dmfxmQ3gto9hswSYcslxdCD/VCff4YuGNXirHwTtwu76lYyHOxnFzBhHszRsPBpJ\nMB+76V9LMe0xz5qJeq2H1PQwtMrbtapfMOyQl8MaHf4OKzsmB6sXDDYL7kdR1XUa74biuJbm\nWbikTy9Idwjs3HbwWZ4upqmkIlVHzecsb24O9ZLPMoS8Ohp+r4f8Xh9W/FQtr/WmiPZHZSDX\n4lqmeiniZ8KThnPdstq1/dS7/fJVTSfdZokw5RC+i+tpOJp5rpND1UcZ+2Hoo+80bBd0F6xk\n2GJmFJMxDsP6akhB4/FIhvP3n/Zt/FQKNe2x3CLN0dJHO7vjNXyvW+b1ZP7qZ9eNsC7VHuLz\np28Yb9GFTMKLDcHP4NVNddIvxTWdZ5MlfY7j7usfl3ZPdHzydHFaSUWqtsW1fWdt1qEZZn5u\njzfalm/1Nr0Ga1xX+35YPt1v6qGDro5Nyxp2raZOO0E+e5EiTD+o1zoZ77faTq/VG3ncru8u\nWMmwxcwoJmPsuytN/Zo0Hqfe320iXuixnIzN3DlkP8Na9K0u1W6snF7VFnvrZ9eNsIpLc9mu\nuUA93qILmSyIFLw6Xv/bcQXzbLqkmDwZBXZql6Y6sksr0qBKuw7te+ypGe7P1/sx2OJF0Lqu\nQ7sBm7eL2Tl++GhbdtXDhqQiTDCaVzo5VW+/lwHVrcEpi9sF3QUrGbaYGcVkjIHS53Hj8UiC\n+fhVt36vdlnTHqtl9XWwZu60azG0Omb1S6ud0bBrvBFWFXm9PevW4y26kMmCSIfRDmjS0yiu\nyTybWbJ4t3nc7L7THdklvthQxDed74dq0Ufeb9mZ997o/rhR++Cad0cq2XQ7jZMqJjG+0skl\n7w2LXnfMZgcTjmtEmhnFokj56WvSeH4kzc88735Me6xmTXVB4a0+NOxeO7T6LFe73E7lJvtq\nWtwJq6vvY+3eZD/5iEgT8NisG3HdXTIvUvmG9JPyyE4jUjXdPsq3rvPn5RWRqhPt78VXJRJp\nvpPqc/xqWryPXjcyZlGkYlR3RVpsPD+S5ue5VOBr5iisqWvbfnj3jtf+rToQO2XXt5njhUnz\n4f61uWgUP3Mzk/sivYUXGy6/IlK1S0p4ZPfLIrVH6NWhXXNg0TybP3FoV9+8t985yIMP81Ie\n2i12UtfPWz9n2qZ1p2G7oLtgJSek+4d2i43nR9L8rCZG8yY77bFodkaf7ac+7XYIWpWnfeWp\nSvkv+FxoOazgMsZoZSfk+yKNry2El78v+fFmXM+KVAWV8Mjul0Vq53jenyR/1Tdv7Zle/FZW\nbspmE85eB2huD02Tt+bmpzo+b8/7P/qkIsxkkj7XSdCibnVqJkrdadgu6C5YySnp9hhHIsVD\nHo0knJXlsN6aKTgz9ub06BDubqNW39mxXKmf7BBd6VsK67OX+rN69XiLLmSyIFLw6rby7vDy\n0l5uWYxrSaRq5n3dEqncdSc8svttkarrkV/1G079WXVzvbhch/ynv1gafpkyOzcXOX+K0WTq\nHvw0z/3UZ+E/+XD5+3M4HI8wk0n6XCfNRedzfwHvo76w33Qatgu6C1YybDEzinsiRY3HI4mu\nTFcfMn0VxVyPVZUPu8lavyBudWh5wbc6boR1LBMoN+vlXPcYbdFiMZNwsMHP4NVtfTdfEbqW\nJ9an23HNi3TMTtfwI5FIpHbGHfKER3a/LVJzibTaTh/d2Wf1jth8ANdc7gk2T/ix2/wcL9+T\nDkHL4APZ4Lw2/vSuGMGe6qT9GDTvj9ebD/ne23nQtwu7G1YyGu50FPdEmvtAth/JITyhLx8d\nopfE3xl8b86thh6iVs1nfKfoNcthXY5d7DVxWNkJOVi9cLDhzyCqUcftMd5yXPMiNSmdR08G\ngTXMdEd2vy1SFVH71ZaP6hO87/bo9+OQ5c1XPw7hO2D4VZj5OV60X+O8nPPuMnX9/ZLTdxBa\n/H2SMeypTr7rL+YEb/6fwVeEhnZRd/1KxsOdjOKuSNGQRyNpAuxe8Nl/R23aY31K152NtC8I\nW13refURH+4shlXGfqp/jaI9GepXdkIOVi8cbPgzjKoba31p/a3boy7GNS9S8X3oNs+4XT/j\nrlnCI7vf/cW+8Xz4zbom/5ow5V0fKY/sDESqT5GqjzPu/cIBRQVVnsB932+1uvYvUneKlPI3\nwCj3mp5AvgpMCZvAJYd2X/XvWn7eb0hRXR0mJ5AvlvAshqJ8C5EoKkEhEkUlKESiqASFSBSV\noBCJohIUIlFUgkIkikpQiERRCSqFSP+3tta3hAHjVsPtFSLB2B8jwaRNXYgEY3+MBJM2dSES\njP0xEkza1IVIMPbHSDBpUxciwdgfI8GkTV2IBGN/jASTNnUhEoz9MRJM2tSFSDD2x0gwaVMX\nIsHYHyPBpE1diARjf4wEkzZ1IRKM/TESTNrUhUgw9sdIMGlTFyLB2B8jwaRNXYgEY3+MBJM2\ndSESjP0xEkza1IVIMPbHSDBpUxciwdgfI8GkTV2IBGN/jASTNnUhEoz9MRJM2tSFSDD2x0gw\naVMXIsHYHyPBpE1diARjf4wEkzZ1IRKM/TESTNrUhUgw9sdIMGlTFyLB2B8jwaRNXYgEY3+M\nBJM2dSESjP0xEkza1IVIMPbHSDBpUxciwdgfI8GkTV1rRMqHe2WFt02lDwoGjJsNt1crRBqc\nydsfef+grvRBwYBxs+H26r5IeYFIMLbFSO/By/XQoR0iwdgEI7UFCepFkf6pamj531cKBowV\njI1W2j3SS0HBgLGC4blHqguRYOgYiCQMG4YvA5GEYcPwZSCSMGwYvozdi1T9vPfNhq2EDcOX\nsWOR7hUiwdAxEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIwbBi+DEQShg3D\nl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBsGL4MRBKGDcOX\ngUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxEEoYNw5eB\nSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIwbBi+DEQShg3Dl4FI\nwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBsGL4MRBKGDcOXgUjC\nsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKw\nYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh\n+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4\nMhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgy\nEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi/DWKShXgoKBowVjI0WeyQY+2IY75EQCYaOgUjC\nsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKw\nYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh\n+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4\nMhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgy\nEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQ\nSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJ\nGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkY\nNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2\nDF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYM\nXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZexWpLys4G79IA8WIhIMJWOvIuX9j2BBHjVB\nJBg6hotIE7EQCYaS4SRS7BEiwRAyTERqHvanSP9UNTR+KSgYMFYwNlrPiRQvY48EQ8dw2iON\n7iESDB3DQ6TxVYe6EAmGjuEkEod2MP6M4SZSsG9CJBg6xl5F6r/ZEBoVfbEBkWAIGbsV6X4h\nEgwdA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwb\nhi8DkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuG\nLwORhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4Yv\nA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8D\nkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwOR\nhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GE\nYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRh\nw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD\n8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPw\nZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfhrFIQ70UFAwYKxgbLfZIMPbFMN4jIRIMHQOR\nhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GE\nYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRh\nw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD\n8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPw\nZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/Bl\n7ESkc5419QADkWDoGPsQ6ZxliARjy4x9iJRnH48zEAmGjrFCpM9jlh3HEzneNzy0p1hTI95T\nfESCoWPcF+nYHFMdLjem9m+LdMqujzMQCYaOcVekY3b8Lorv8ubxqfx8jUS65MfLfMMbhUgw\ndIx7In11Ah2zr3rPc8rqOV3tg7Lscsryc/uouLxl2VvzXLf86Zoc2nGxAcamGfdEOmXfzZ2v\n7FRN6FKWLL92ItUXpc/No2v9oHmuW/50IRKMfTHuiTRM3Uad47XcN52DRx9Z3jw6V/uu9rlu\n+dPFB7Iw9sV4VKSf8hAuO/SHdv3yojhUj9rnLtErnyhEgrEvxqMihfduPUos0vV8yLLD+aFr\nd4gEQ8e4J1J/jvTdnCPVs1wu0qX9hlD+yLU7RIKhY9wTKbhq99ketF2qRVN1wkO7bvnTNXrt\nW32p8HLM3h5gIBIMHeOeSMPnSIeivoxQXI/Z+5xI4cWGbvnTtfDNBq7awdgo465Il0PwzYZS\npOoAq5gTKbz8/fCkHxciwdgX465IRfExfNeuPLQ7dh+6Ts6Kgg9kH5704+LQDsa+GCtECud3\n6u/ULXYUP+RiA4yNM/YhEpe/YWycsRORnilEgqFjIJIwbBi+jMdEklUoUmkvX1qFsXEGIgnD\nhuHL2IFIzxYiwdAxEEkYNgxfxj5E6g7p8kd+xwmRYOgYOxApzzLOkWBsnHFHpP+/VU9KsqZC\nYT4Cjx7583aIBEPHuCfSDYJKpIK/awdj84x9iHR85MuqXSESDB1jHyLl7JFgbJuxD5F+jmf+\nQCSMLTP2IRJX7WBsnIFIK4OCAeMWYx8iPVWIBEPHQKSVQcGAcYuxE5H4DVkY22bsQ6SZv9mQ\n58MX7/L2QbgMkWAoGWlEWr4SkEU3q+vuXxHK+x/DbbQMkWAoGYlEuqXLM+c7d/+uHSLB2BTD\nQaR8ZlmBSDCUjOQidYd47W3za+LVTddi1adBDx3a9adI/bJ/qhpe/lJQMGCsYNyph0XKpret\nT22LLGi/XHcvNkz2SDl7JBh/yEi0R+ovNkQiFYFI4c3DIk0vf4+kQSQYf8tIemgXiNSdzkxF\nWvVNn7sNEAnGphi/JlKr0mBQe1i37tLDQyJxaAfjzxm/KFJ8jvSaSPWh3fF9WaS8QCQYf8j4\nLZEmFxumPx4Q6cY3G8JvNPDNBhh/xUgt0vTyd9Fc/u5bPXP5+8j/jwRj24w0IiWv+Q9kr/w+\nEoyNMvYh0ilrLnx3/zP0qkIkGDrGPkQq3o4/1aHdkf+xD8Y2GfsQKYtqJQORYOgYiLQyKBgw\nbjH2IdJThUgwdIx7Im3gb38/W4gEQ8fYiUj8zQYY22bcE+k/y/W3f7PhfiESDB1jHyJNf7Fv\nRSESDB1jHyJNf9V8RSESDB0DkYRhw/Bl7EMkDu1gbJyxD5G42ABj44x9iMTlbxgbZ+xEpGcK\nkWDoGPsQif9DFsbGGWlEWvcXvh/YzYya8n/Iwtg4I5FI/d/eWmnGvRo15/+QhbFxRqo90r2/\nafKaSPzXlzA2zkguUvDHT4LHj/4BcESCsS9GKpHGf5G4+2Or0eP1fwCcq3Yw9sX4TZFe+APg\niARjX4xkInV/DbI9AAv+GGT/OLi5d5gWPfdzzLI3LjbA2DIjnUjNEVsWLxkbtPbvFocNfhrt\nfh6RqCpEgqFj/LZI8TnSUyK9Zefqx8OfySISDB0joUjTiwvj22L6Y4VI9THgNcuX2iISjL9n\npBRp6fL3E38AfCLSY7+KVBciwdAx0oi0QofHCpFg7IvxWyLdPXi7XYgEY1+MX9sjPfg1hPGr\nI9Lw85FCJBg6xq+J9FrFIj3+54qrQiQYOgYiCcOG4cvYgUjPFiLB0DEQSRg2DF/GPZE28re/\nnylEgqFj3BHprwqRYOyLgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPw\nZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/Bl\nIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUg\nkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCS\nMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIw\nbBi+DEQShg3Dl2Es0lAvBQUDxgrGRos9Eox9MYz3SIgEQ8dAJGHYMHwZiCQMG4YvA5GEYcPw\nZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/Bl\nIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUg\nkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCS\nMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIw\nbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBs\nGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwY\nvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIwbBi+\nDEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GUgkjBsGL4M\nRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxE\nEoYNw5eBSMKwYfgyditSXtb4fh4uRCQYQsZeRcr7H8H9PGqCSDB0DEQShg3Dl+EgUrcg9giR\nYAgZViL1p0j/VDU891JQMGCsYGy0HhYpny5jjwRDx3DZI+WTO4gEQ8gwEWnuHiLB0DE8RMpn\nliESDCHDQqTgMnhwtIdIMHSMvYo0fJuhvVqXB8uaQiQYOsZuRbpfiARDx0AkYdgwfBmIJAwb\nhi8DkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuG\nLwORhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4Yv\nA5GEYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8D\nkYRhw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwOR\nhGHD8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GE\nYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRh\nw/BlIJIwbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD\n8GUgkjBsGL4MRBKGDcOXgUjCsGH4MhBJGDYMXwYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPw\nZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/Bl\nIJIwbBi+DGORhnopKBgwVjA2WuyRYOyLYbxHQiQYOgYiCcOG4ctAJGHYMHwZiCQMG4YvA5GE\nYcPwZSCSMGwYvgxEEoYNw5eBSMKwYfgyEEkYNgxfBiIJw4bhy0AkYdgwfBmIJAwbhi8DkYRh\nw/BlIJIwbBi+DEQShg0jZvznldrYuiCSMGwYMQORfr0Q6d/AQKRfL0T6NzAQ6dcLkf4NDET6\n9UKkfwMDkX69EGnrjBQSINKvFyJtnYFIMQORhGE7MRApZiCSMGwnBiLFDEQShu3EQKSYgUjC\nsJ0YiBQzEEkYthMDkWIGIgnDdmIgUsxAJGHYTgxEihmIJAzbiYFIMQORhGE7MRApZiCSMOyt\nMLYiQQrGVjJFJGHYW2FsRYIUjK1kikjCsLfC2IoEKRhbyRSRhGFvhbEVCVIwtpIpIgnD3gpj\nKxKkYGwlU0QShr0VxlYkSMHYSqaIJAx7K4ytSJCCsZVMEUkY9lYmTopxbIWRIo8UDEQShr2V\niZNiHFthpMgjBQORVgblNHG2si4pGCnySMFApJVBbWXiwIgZKbZtCgYirQxqKxMHRsxIsW1T\nMBBpZVBbmTgwYkaKbZuCgUgrg9rKxIERM1Js2xQMRFoZ1FYmDoyYkWLbpmAg0sqgtjJxYMSM\nFNs2BQORVga1lYkDI2ak2LYpGIi0MqitTBwYMSPFtk3BQKSVQW1l4sCIGVvZtoiESLtmbGXb\nIhIi7ZqxlW2LSIi0a8ZWti0iIdKuGVvZtoiESLtmbGXbIhIi7ZqxlW2LSIi0a8ZWti0iIdKu\nGVvZtv8KkVIEBQPGLQYiCcOG4ctAJGHYMHwZiCQMG4YvA5GEYcPwZSCSMGwYvgxEEoYNw5eB\nSMKwYfgyEEkYNgxfBihOHVUAAAhtSURBVCIJw4bhy0AkYdgwfBmIJAwbhi8DkYRhw/BlIJIw\nbBi+DEQShg3Dl4FIwrBh+DIQSRg2DF8GIgnDhuHLQCRh2DB8GYgkDBuGLwORhGHD8GXsVqS8\nrPH9cBkiwVAy9ipS3v8Y7ofLCkSCoWQgkjBsGL4MRBKGDcOX4SnSP1X91tgoajeVdo90p9a3\nhAHjVsPtFSLB2B/jF0R4tRAJxv4YvyDCq4VIMPbH+AURXi1EgrE/xi+I8Gqt/2ZDHt5f+GZD\nqqBgwLjZcHuV9rt2qYKCAeNmw+0VIsHYHyPBpE1diARjf4wEkzZ1IRKM/TESTNrUhUgw9sdI\nMGlTFyLB2B8jwaRNXYgEY3+MBJM2dSESjP0xEkza1IVIMPbHSDBpUxciwdgfI8GkTV2IBGN/\njASTNnUhEoz9MRJM2tSFSDD2x0gwaVMXIsHYHyPBpE1diARjf4wEkzZ1IRKM/TESTNrUhUgw\n9sdIMGlTFyLB2B8jwaRNXYgEY3+MBJM2dSESjP0xEkza1IVIMPbHSDBpUxciwdgfI8GkTV2I\nBGN/jASTNnUhEoz9MRJM2tSFSDD2x0gwaVMXIsHYHyPBpE1diARjf4wEkzZ1pRBpdaX4v/1g\nwNhiIRIMK8ZfFSLBsGL8VSESDCvGX5VUJIpyLUSiqASFSBSVoBCJohIUIlFUgkIkikpQCUTK\no5u5Bm0tvTQfHnWs6aJph+Er4x7yFYOK/mf2fO6mu5evpSwvKsarGvdb3FqTJeBCn0ur0ra5\nDbrT0zCqe+OZdD7X03xnef3suh42VClEmp0jYYM7z+TRTXR3TqS8m9+RgqPO7g0qz8Onu8Z5\nEc+SfLzgJiVgTadIHg34gTUpZvq4MYxwVaa4254s9jQK9VYit8Y5Q3wJsqVKske6s6n/RKQ7\ngxptyGDXk0ew/LZIk+4XZ8jTIt3ft8ZNwr1oGOmDmNlnEGmx0orU7K2HKTx+W8yLdnfeHmV0\nr8m7m+5OPm0z6q8/UOleX/SYnhK9OJ+ZVkWxBMhDxlpKvDZFcLdbqz6Ah9ck7GPU99wwZlem\nGAXyOKZfizEkbBk8F69vMeks3Lhhn1Hmu6g050j5cNO/9Q7vs6M9TT+/u7vtfOk2VVEEDoTc\nvrvwX78l8/FQ8m6HEjQIxhzdDQERLH+Y0hvczqmAM4AfWZP+1GaYtDN9B9siL4bZ3vcZjGsV\nZjqUfBB/OApcGHS/DfIYPO5sZjiT6bSP+g2RBjnaBnmwGafhTUUq8mmwS9Mv6mEk0kxfASS8\nOxapf24i0j1KN5xobg0iPbUmxfjdf6bvYFu070a9SMOzsxvh7toEQ1kWaZzPzJaLouvWMmwd\n3h1nvfVKdNWue/8J3vYCkaKm0/j7g5hFkcLDmyJ4bTht48WxTzcV6I668hG36A7Q1lNGoy76\n0c+J9MCazKV2axjdEeJkZR7DzAwlDGtZpElfkwqXBX3Nrfk+KtXl71Cc7p1rnUjdnuiWSGFv\nozfsKPV8/HCNAsGQ47nX74xWU+ZEmk7qYGavXZPVBgzDLvLRykRp3seM1qZ/8bCVFkWa9jWp\nyZgR6UWRgmm2TqQiYCxsyfsijafnnEiDQ6spxbAbKvo1WRTpgTW5acCoyaxI0XHmKky/JBxK\nvkak8Za7LdI42X+5SNHcH+ZIdDuKexApOhhpF4zaTJn5BDWdlZNTgmEk8ViHqRGfjUSjWUHp\nGg/nSN0VrolIq9ekWz5J79YwYkaf8YT/EKa/XheLNDPomS0XVzwnZt44b714i5X2mw39lczw\niZmLDd275XA3nH8tJW6TFzFzeMPN8+gUvX1VcNQUnKqHG7BjBpcGiu7a6zD5+pm+itJ13Y+q\nG0k+DHgq0s016VYljDc++xkPI5yV8RPRqtzDFBEmftPLx5CwZdg8TmuoYNloWJGN+dxrN1l/\n+F273WREUXfrb0Ta1U6bou7XH+2R9rTTpqj7xa9RUFSCQiSKSlCIRFEJCpEoKkEhEkUlKESi\nqASFSOsqa+v0/QpjfvlHPvfc3R6XcNRfFBtjXWV9PW/S0syvli+LtNgjIm2p2Bjrqp2113N2\neJUxu3xOpNd7pGSFSOuqn+j1netblr1dq4fveXb4aBafsuOlWnSpnrzUyy6nLD/Xy47ZafTS\n/tlqp1OcTgHsZo8l6vDVuzfXGfUHhUjrKt4/5NXkr+6c62Ovj+r5ckZneTnVr/WT1b3yZ3X3\n3C471Yz+pf2ztUjncwC71WOD70Sa64z6i0KkdRWdsbxn9bSv/bkU31l9seB4LY7N8mPR3KuX\nfVTPVsuux2rmhy/tnu32PT3sVo/vPar6N9cZ9ReFSOuqm9RvP+WDQ51aebBW7ijevtrnyycu\n1T7jUOrQ3KvEaOZ7uywLXzo824nUw271OKACcNQZ9RdF8OuqnqFf1ft/Mczxckl5PHUYZvCg\nxfK98MgsFqmH3eoxftlcF9RfFMGvq2aGnpt5PUzrovg5ZPl3GpF62K0eEWmbRfDrqp2hh+y9\n6A60uvpo5nF9jHWMj7a6V44P7Qbi+NL3R3yxbtrj8qFd8CJKXgS/rtoZ+lOfC52rs/vPypo8\n+y6XNRcbqmsA7/H5f/fK9+ZSRBa+dCpSD7vVY4ufudgQvIiSF8Gvq26Gvlfv/u0l6J/uivV7\nLVJ1HbqIr0h3rxwufw8vDUVq5Olht3pcvvwdvohSF8Gvq36G1oda1cegx/pk5pxn+Xv9/OXY\nfDIafkbav/Jy6j6Q7V86PNtftO5gN3usPpD9nPtANnoRJS6CT1PiGcznRVsrREpTMpHqz2fP\n2ZuoO2plIVKakonUnEhll/stKWUhUprSHdp9HNqzImpLhUgUlaAQiaISFCJRVIJCJIpKUIhE\nUQkKkSgqQSESRSUoRKKoBPU/9uD2Ts/0Kx0AAAAASUVORK5CYII=",
      "text/plain": [
       "plot without title"
      ]
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Similar to the ‘DF’ data, the recent data shows a clear preference for ‘positive’ message, with some variations between regions.\n",
    "\n",
    "#Now by plotting\n",
    "\n",
    "h <- ggplot(since2006) + aes(x=region,fill=negative) + geom_bar(position = \"fill\") + \n",
    "  labs(x=\"Respondent's Region\",y=\"Proportion\",title=\"Impact of Region of Residence on Positive View of Scientific Community\") +\n",
    "  scale_fill_discrete(name=\"Opinion\",labels=c(\"Positive\",\"Negative\"))\n",
    "h\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAMAAADKOT/pAAAAQlBMVEUAAAAAv8QaGhozMzNN\nTU1oaGh8fHyMjIyampqnp6eysrK9vb3Hx8fQ0NDZ2dnh4eHp6enr6+vw8PDy8vL4dm3///+J\nMuS0AAAACXBIWXMAABJ0AAASdAHeZh94AAAgAElEQVR4nO2di3biypJENX0FNnYbe5jL///q\noHelSioEJHZ2eMdax8YgQhmVuZGQaZ/qjBB6WNVPF4CQggAJIQcBEkIOAiSEHARICDkIkBBy\nECAh5CBAQshBgISQgwAJIQd5gVTdbXR6XX+kqnbTDjrtDifXOu7YidnH/cGLGirZv5e3Og8L\neLWOuvoab39V9V2Fm8U6nz9e66W1KjmnxXZu61v/fbkswMvH7WWuK1kwZ/08SOvPbNZxP202\nqN485Ft0x06+E6SkuLVKugqu1vFWHcbbh+rtrsLNYrU/tZrNesk5LbZzW9v6s96wALcqWTBn\nRQapqj7zzY77ZCAc9OhOngZSX0ldFY9J2ytojkKD0qPTbVUli/Ve1Q1BX+/m3qsOK25zfV4O\nRsdz24qXm+vcXoOfqZfPU0Ba+uEzGQgHPbqTJ4N0Pl59Rd5awX48cnzc+ypvdjXS+F5tP1ey\nIBU23I0vIPv5Ee9RxQfp8uWtrnaX3O+Xb+/dPZeb+34lDrvLgfrY3f7YV9XrqT+HmXw+L6fd\n9evneTi5sTtIb11eqkbji1n93j7QPzjZNPccuqIe28nn5Yy+fj1OjzU7Hc6Qpu3M7oaQs3Ln\nVSzUOK8k2XhWSZ/g8t9pfP+yq075Hj/Gl/aXZjRnCY8dDceq7c9rdbx5scaw2dpN8aZiR7dp\nNYelssVeXtQO+XLlc5bfM5SWrO6443GtTumbvgfkDNJbW+Xxtf32Pt3TLkWdnFEfuncic5A+\nprPutbb1B4u/1WTc72NqS2JzuWc/O5G/ayfH9ElTgtf2h2S7dHdjSFtuVsVCjbMpTTeeVZLM\n4zD+LRT5HuuqG9RTW1K3h2mruk/VPmE6IK8v1uz0dwo7d07iJcVWyW2zVK1e5ochu1xrc5be\nM65esrrTgh36Hfy9vF30kDNIzVnzoaq7b7v2nr+XRaibs+G3tuS39rTis9ny1LbCHI8uC3I6\nny6r+nW2j6RvGg7tls2h7bM97F+e1e1kaIuxuZRwPJ9eprOZ+3aya/ZxWfbdtI9xp+l2ye6S\nkOkWC1VkNU5lfXROycbzSqb375/9y/jLBah8j5eOdGdL7/1024Rv7ZZ1O8wf43QVFuurOUL8\n/Rw3tB1dWZP0YkPyNXl2pwH6teXK5yy7Z1zH+e7bL1/9kWh/59vFuZxBanpx6l9ZuwxdmfWh\nP9/ot3xte3pKErfqXw8vD4+tnnYwaN9t2ZqdmtHpB+TvCJKxGYt6bCfz41a/01PzQm63G3eX\nhEy3WKgiq3Hc3YXUj2zj+aqPN7slXtnjZRi72dlVn1OKcauv5jB2Ga+mY6/jdBUW6/zVXbbr\nLlDPO7qyJisgJc+2+cvLlcxZfs85e9As2Et/r8+ZnTdIEyp9hv419qUr9/PjbZ90/Jxs3WrX\nN7B7uVic8d17v+Wg0WxaKWOTVPPITl6al9+vyWpI8FLZ7ZLdJSHTLRaqyGpMkD7MN55Xkszj\nR7v1W3PIyvfY3NdeB+tmp08xbbWv2qc2B6Pp0FhYrGbJ2362W887urImKyDtZgegbE+z5crm\nbOGe1Zvdz93h2+vMzv1iw9l+G3jfNXe912NnF157ze35Rv0Pp3o4U6nyPs1X6pwt4yM7+apH\nwszz9tViMWldM6eFKlZBql8+so2XK+m+1vXwJd9jMzXNBYXX9tRweO601d9L7EufLi376La4\nsliDjvuWvew4eQtImfGcrMJyXb1nGaTLC9Kn35ndd4HUjNv75aXr8PfrEZCaN9rH1Wc5gbS8\nk+b3+M1YvM2eNyNmFaTzTFdBWt14uZLu6+GCwMfCWVinU7/99Opt0782J2Iv1el14Xwh23y6\nfeouGtlHimtyHaTX9GLD11NAag5Jbmd2TwepP0NvTu26E4vu0fqOU7v221v/mYM6+WWe56nd\n6k5afb6OM9Nv2u403S7ZXRIyc7p+are68XIl3ddmMLoX2XyP5+5g9Lf/rU/fh2Sry9u+y1uV\ny3/J74XWFyu5jDELmzlfB2l+bSG9/P1V74vLdS9IzUK5ndk9HaR+xuvxTfJH++21f6dnX8ou\nrexauHgdoPu+6zZ57b59Nufn/fv+93GljE02pPftJNmi3eqlG5R2p+l2ye6SkLlTucYZSLbk\nWSXpVF7Keu1GcKH27u3RLj3cmq2O1f4S6rPamSt9a4v1d4T6b/PseUdX1mQFpOTZverh9PKr\nv9yyulxrIDWT91EC6XLodjuzez5IzfXIj/YFp/1ddXe9+JKh/hwvlqYfpqwO3UXOz/NsmIYf\nPrvHPtt34Z/1dPn773Q6bmyyIb1vJ91F58N4Ae+9vbDf7TTdLtldEjLdYqGKayCZjeeVmCvT\nzS+ZPs7npT02uvw4DGv7BLvVrvdLPtVRWKz9ZQUubf06tHs0HT2vrklabPI1eXavY/cRodPl\njfVLebmWQdpXL6f0VyIGpH7idrXbmd3zQeoukTZ9eh/efTaviN0v4LrLPUl70l+7Lc/45TVp\nl2yZ/EI2eV9rf3t3npndtZP+16D1eL7e/ZLvrZ+Dcbt0d1NIU25exTWQln4hO1ayS9/QX37a\nmafYzwy+de+tpj2Yrbrf8b2Y56wv1td+WPbWcQqbOSfx0mLTr8lSzXbcn+OtL9cySN0qHWYP\nJgvWeXqd2T0fpGaJ+o+2vDe/wTv2Z7/vu6ruPvqxS18B04/CLM/4uf8Y59ehHi5Tt58veTkm\ni2Y/TzI3u2snx/aDOcmL/9/kI0LTdmZ3Y0hbblbFVZBMybNKugUcnvB3/Ixavsf2Ld3wbqR/\nQrrVqZ2rd3u6s7pYl2V/af8ZRf9maAybOSfx0mLTr+lSDbW2l9ZfhyPq6nItg3Q+7ob2zLcb\nJ+5UuZ3ZPfsf9s3n4Zk6uX9MGGnr3e/MTgKk9i1S8+uMa//gAKFElzdwx+tbbZQCSMNbJM9/\nAYbUlb+BfMzOz2rR/ltO7T7af2v59/qGCA3aZW8gH9I3vodBSFeAhJCDAAkhBwESQg4CJIQc\nBEgIOQiQEHIQICHkIEBCyEE+IB0fUSSXUMUQ6apNHAFS3GKIdNUmjgApbjFEumoTR4AUtxgi\nXbWJI0CKWwyRrtrEESDFLYZIV23iCJDiFkOkqzZxBEhxiyHSVZs4AqS4xRDpqk0cAVLcYoh0\n1SaOACluMUS6ahNHTwTpT6+FRwqL+2faJn/mn4VbucuflU1sacuPpMXc77O+MH/WflzwSSOt\nFny1FlvM3UYLC1NaGWO4Usu0u+Wi/rSPFlcmjp4J0paVzRa3BFK/qH+WzBOXviur+//zZ+3h\nP3Ze7vdZXJi87lKg1GV1R7fUMiJwl9HSwpReYpbvXpiY4svVNZs4kgTpyryst24G0v0+iwtz\nN0jXD41batl0rF7dxCwMIGXyAak9NE9TN38l/3Psj91/uiN1d8z+86d/aHAZHl7YbPQZ7ppZ\n/FkBKdlksTnGov1psnnEZ1qYaU36urcGSl0WdmQLKGZKV+Zuo3O2MLOaj/2L37iS6WND7NTF\n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\nAABJRU5ErkJggg==",
      "text/plain": [
       "plot without title"
      ]
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#combining both these plots\n",
    "i <- ggplot(df) + aes(x=recent,fill=negative) + geom_bar(position = \"fill\") + facet_grid(.~region) +\n",
    "  labs(x=\"Historical versus Recent\",y=\"Proportion\",title=\"Impact of Region of Residence on Positive View of Scientific Community\") +\n",
    "  scale_fill_discrete(name=\"Opinion\",labels=c(\"Positive\",\"Negative\"))\n",
    "\n",
    "i"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t35771 obs. of  5 variables:\n",
      " $ year    : int  1973 1973 1973 1973 1973 1973 1973 1973 1973 1973 ...\n",
      " $ region  : Factor w/ 9 levels \"New England\",..: 3 3 3 3 3 2 2 2 2 3 ...\n",
      " $ consci  : Factor w/ 3 levels \"A Great Deal\",..: 2 1 1 2 1 1 2 1 2 1 ...\n",
      " $ negative: logi  FALSE FALSE FALSE FALSE FALSE FALSE ...\n",
      " $ recent  : Factor w/ 2 levels \"H\",\"R\": 1 1 1 1 1 1 1 1 1 1 ...\n",
      " - attr(*, \"na.action\")= 'omit' Named int  1 2 3 4 5 6 7 8 9 10 ...\n",
      "  ..- attr(*, \"names\")= chr  \"1\" \"2\" \"3\" \"4\" ...\n"
     ]
    }
   ],
   "source": [
    "# now step 4 : Statistical Infernce:\n",
    "\n",
    "#In this section, we perform statistical inference on the results. This is done through a series of well-defined steps:\n",
    "  \n",
    "#1.Define hypothesis\n",
    "#2.Choose statistical method\n",
    "#3.Check for conditions\n",
    "#4.Perform the inference tests\n",
    "#5.Interpret the results\n",
    "#Null Hypothesis :respondent's confidence in scientific community and their region of residence are independent variables.\n",
    "#Alternative Hypothesis :  confidence in the scientific community does vary by region of residence.\n",
    "str(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t5761 obs. of  5 variables:\n",
      " $ year    : int  2006 2006 2006 2006 2006 2006 2006 2006 2006 2006 ...\n",
      " $ region  : Factor w/ 9 levels \"New England\",..: 2 2 2 2 2 2 2 2 2 2 ...\n",
      " $ consci  : Factor w/ 3 levels \"A Great Deal\",..: 2 1 2 1 2 2 1 2 1 2 ...\n",
      " $ negative: logi  FALSE FALSE FALSE FALSE FALSE FALSE ...\n",
      " $ recent  : Factor w/ 2 levels \"H\",\"R\": 2 2 2 2 2 2 2 2 2 2 ...\n",
      " - attr(*, \"na.action\")= 'omit' Named int  1 2 3 4 5 6 7 8 9 10 ...\n",
      "  ..- attr(*, \"names\")= chr  \"1\" \"2\" \"3\" \"4\" ...\n"
     ]
    }
   ],
   "source": [
    "str(since2006)\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "                 \n",
       "                  FALSE TRUE\n",
       "  New England      1620   83\n",
       "  Middle Atlantic  5016  376\n",
       "  E. Nor. Central  6387  461\n",
       "  W. Nor. Central  2441  183\n",
       "  South Atlantic   6181  579\n",
       "  E. Sou. Central  2008  227\n",
       "  W. Sou. Central  2895  308\n",
       "  Mountain         2030  113\n",
       "  Pacific          4580  283"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#CHECKING FOR TWO CONDTIONS\n",
    "study_table1 <- table(df$region,df$negative)\n",
    "study_table1\n",
    "sum(study_table1<=5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "                 \n",
       "                  FALSE TRUE\n",
       "  New England       235    9\n",
       "  Middle Atlantic   671   45\n",
       "  E. Nor. Central   915   65\n",
       "  W. Nor. Central   318   21\n",
       "  South Atlantic   1146   96\n",
       "  E. Sou. Central   283   29\n",
       "  W. Sou. Central   549   62\n",
       "  Mountain          444   17\n",
       "  Pacific           813   43"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "study_table2 <- table(since2006$region,since2006$negative)\n",
    "study_table2\n",
    "sum(study_table2<=5)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tPearson's Chi-squared test\n",
       "\n",
       "data:  df$region and df$negative\n",
       "X-squared = 116.36, df = 8, p-value < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#At this point, we can conclude both conditions have been met.\n",
    "#chi square test\n",
    "c_df <-chisq.test(df$region,df$negative)\n",
    "c_df"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tPearson's Chi-squared test\n",
       "\n",
       "data:  since2006$region and since2006$negative\n",
       "X-squared = 31.427, df = 8, p-value = 0.0001179\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "c_since2006 <- chisq.test(since2006$region,since2006$negative)\n",
    "c_since2006"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "metadata": {},
   "outputs": [],
   "source": [
    "#The high X-squared statistic in both cases - alltime and since2006 - with 8 degrees of freedom leads to very low p-values. Since the p-values are below alpha (0.05), we can conclude that there is sufficient evidence to reject H0 (null hypothesis).\n",
    "\n",
    "#In the context of the research question, it mean that there is evidence that the confidence in scientific community varies by region.\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "3.6.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
