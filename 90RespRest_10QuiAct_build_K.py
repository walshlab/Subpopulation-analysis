# -*- coding: utf-8 -*-
"""
Created on Sun 11OCT20 23:46:43 2020

This code and data refers to a 4 population analysis:
    - 90% (4500) Responsive and (4500) Resistant
    -10% (500) Quiescent and (500) Activated. 
    
    
"""

#import packages and assign shortcuts
import math
import numpy as np
import matplotlib.pyplot as plt
import scipy.signal
import scipy
import scipy.io as sci
import scipy.signal as signal
import csv
import pandas as pd
import xlsxwriter

sin = np.sin
pi = np.pi
arange = np.arange
zeros = np.zeros
append = np.append
array = np.array
mean = np.mean


#For random samples from N(\mu, \sigma^2), use:
#sigma * np.random.randn(...) + mu


 ## __________________ section 1 __________________
    ## rp0 == 0 == ResPonsive 
    ## rt1 == 1 == ResisTant
    ## qs2 == 2 == Quiescent
    ## ac3 == 3 == Activated 
    
rp0 =  9000 ; # 10000 ;  ## Responsive Cancer Cell ##main
rt1 = 9000 ;  ## Resistant  
qs2 = 1000 ;  ## Quiescent T cell
ac3 = 1000 ;  ## Activated T cell



 ## __________________ section 2 __________________
    ## Creating Array of ones and Zeros with length = rp0 
    ## Identifier will differentiate between the cancer cells T-cells array concatenated. 
zeros = np.zeros(rp0);
#print('Zeros=', zeros , '.\n' , 'zeros is', len(zeros), 'long', '.\n')

ones = np.ones(rt1);
# #print('ones=', ones , '.\n' , 'ones is', len(ones), 'long', '.\n')

     ## need to make one and two 
# twos = np.ones(qs2);
twos = np.full((qs2), 2) ;  #### np.full((3, 5), 7)
#print('Zeros=', zeros , '.\n' , 'zeros is', len(zeros), 'long', '.\n')

threes = np.full((ac3), 3) ;
#print('ones=', ones , '.\n' , 'ones is', len(ones), 'long', '.\n')

identifier = np.concatenate((zeros, ones, twos, threes ), axis=0) #axis 1 = column ;
#print('identifiier=', identifiier , '.\n' , 'identifiier is', len(identifiier), 'long', '.\n')

#### This changes the numbers to characters. 
# identifier = np.where(identifier==0, "Responsive", identifier)
# print('identifier=', identifier )
# identifier = np.where(identifier=='1.0', 'Resistant', identifier)
# identifier = np.where(identifier=='2.0', 'Quiescent', identifier)
# identifier = np.where(identifier=='3.0', 'Activated', identifier)
# #print('identifier=', identifier )




 ## __________________ section 3 __________________
 
    ## _____________ rr _____________
        ## __ rp0 __
mu_rp0_rr = 1 ;     # rp0 mean
sigma_rp0_rr = 0.4225 ;  # rp0 Cells std
rr_rp0 = sigma_rp0_rr * np.random.randn(rp0, 1) + mu_rp0_rr;  ## For main rp0 

#         ## __ rt1 __
mu_rt1_rr = 1;  ## rt1 cells mean 
sigma_rt1_rr = 0.5486;  ## rt1 Cancer Cells std
rr_rt1 = sigma_rt1_rr * np.random.randn(rt1, 1) + mu_rt1_rr;  ##For Sub rt1

        ## __ qs2 __
mu_qs2_rr = 0.83 ;  ## qs2 cells mean 
sigma_qs2_rr = 0.07 ;  ## qs2 Cancer Cells std
rr_qs2 = sigma_qs2_rr * np.random.randn(qs2, 1) + mu_qs2_rr;  ##For Sub qs2

        ## __ ac3 __
mu_ac3_rr = 0.9;  ## rt1 cells mean 
sigma_ac3_rr = 0.07;  ## rt1 Cancer Cells std
rr_ac3 = sigma_ac3_rr * np.random.randn(ac3, 1) + mu_ac3_rr;  ##For Sub ac3


rrfinal = np.vstack ((rr_rp0, rr_rt1, rr_qs2, rr_ac3)) ;

# rrfinal = np.vstack ((rr_rp0, rr_qs2, rr_ac3)) ;

# rrfinal = np.column_stack ((rr_rp0, rr_qs2, rr_ac3)) ;
# rrfinal = np.concatenate ((rr_rp0, rr_qs2, rr_ac3), axis=0) ;


# print ("rrfinal", str(rrfinal), '.\n')
# print ('rrfinal lenght=', len(rrfinal)) 
# print ('.\n')



    ## _____________ nt1 __________________
        ## __ rp0 __
mu_rp0_nt1 = 489 ;  # rp0 mean
sigma_rp0_nt1 = 52 ; # rp0 Cells std
nt1_rp0 = sigma_rp0_nt1 * np.random.randn(rp0, 1) + mu_rp0_nt1;  ## For main rp0

        ## __ rt1 __
mu_rt1_nt1 = 377 ;  ## rt1 cells mean 
sigma_rt1_nt1 = 53 ;  ## rt1 Cancer Cells std
nt1_rt1 = sigma_rt1_nt1 * np.random.randn(rt1, 1) + mu_rt1_nt1;  ##For Sub rt1


        ## __ qs2 __
mu_qs2_nt1 = 249.8 ;  ## cells mean 
sigma_qs2_nt1 = 32.32 ;  ## Cancer Cells std
nt1_qs2 = sigma_qs2_nt1 * np.random.randn(qs2, 1) + mu_qs2_nt1;  ##For Sub qs2

        ## __ ac3 __
mu_ac3_nt1 = 282.28 ;  ## cells mean 
sigma_ac3_nt1 = 26.51 ;  ## Cancer Cells std
nt1_ac3 = sigma_ac3_nt1 * np.random.randn(ac3, 1) + mu_ac3_nt1;  ##For Sub ac3


nt1final = np.vstack ((nt1_rp0, nt1_rt1, nt1_qs2, nt1_ac3)) ;
# nt1final = np.vstack ((nt1_rp0, nt1_qs2, nt1_ac3)) ;
# print ("nt1final", str(nt1final), '.\n')
# print ('nt1final lenght=', len(nt1final)) 
# print ('.\n')



    ## __________ ft1 _____
        ## __ rp0 __
mu_rp0_ft1 = 368 ;  # rp0 mean
sigma_rp0_ft1 = 36 ; # rp0 Cells std
ft1_rp0 = sigma_rp0_ft1 * np.random.randn(rp0, 1) + mu_rp0_ft1;  ## For main rp0

        ## __ rt1 __
mu_rt1_ft1 = 399 ;  ## rt1 cells mean 
sigma_rt1_ft1 = 31 ;  ## rt1 Cancer Cells std
ft1_rt1 = sigma_rt1_ft1 * np.random.randn(rt1, 1) + mu_rt1_ft1;  ##For Sub rt1

        ## __ qs2 __
mu_qs2_ft1 = 93.5 ;  ## cells mean 
sigma_qs2_ft1 = 27.43 ;  ## Cancer Cells std
ft1_qs2 = sigma_qs2_ft1 * np.random.randn(qs2, 1) + mu_qs2_ft1;  ##For Sub qs2

        ## __ ac3 __
mu_ac3_ft1 = 79.61 ;  ## cells mean 
sigma_ac3_ft1 = 28.63 ;  ## Cancer Cells std
ft1_ac3 = sigma_ac3_ft1 * np.random.randn(ac3, 1) + mu_ac3_ft1;  ##For Sub ac3


ft1final = np.vstack ((ft1_rp0, ft1_rt1, ft1_qs2, ft1_ac3)) ;
# ft1final = np.vstack ((ft1_rp0, ft1_qs2, ft1_ac3)) ;
# print ("ft1final", str(ft1final), '.\n')
# print ('ft1final lenght=', len(ft1final)) 
# print ('.\n')



    ## __________ nt2 _____
        ## __ rp0 __
mu_rp0_nt2 = 2743 ;  # rp0 mean
sigma_rp0_nt2 =135 ; # rp0 Cells std
nt2_rp0 = sigma_rp0_nt2 * np.random.randn(rp0, 1) + mu_rp0_nt2;  ## For main rp0

        ## __ rt1 __
mu_rt1_nt2 = 2518 ;  ## rt1 cells mean 
sigma_rt1_nt2 = 144 ;  ## rt1 Cancer Cells std
nt2_rt1 = sigma_rt1_nt2 * np.random.randn(rt1, 1) + mu_rt1_nt2;  ##For Sub rt1

        ## __ qs2 __
mu_qs2_nt2 = 2052.41 ;  ## cells mean 
sigma_qs2_nt2 = 169.88 ;  ## Cancer Cells std
nt2_qs2 = sigma_qs2_nt2 * np.random.randn(qs2, 1) + mu_qs2_nt2;  ##For Sub qs2

        ## __ ac3 __
mu_ac3_nt2 = 2100.52 ;  ## cells mean 
sigma_ac3_nt2 = 274.44 ;  ## Cancer Cells std
nt2_ac3 = sigma_ac3_nt2 * np.random.randn(ac3, 1) + mu_ac3_nt2;  ##For Sub ac3


nt2final = np.vstack ((nt2_rp0, nt2_rt1, nt2_qs2, nt2_ac3)) ;
# nt2final = np.vstack ((nt2_rp0, nt2_qs2, nt2_ac3)) ;
# print ("nt2final", str(nt2final), '.\n')
# print ('nt2final lenght=', len(nt2final)) 
# print ('.\n')



    ## __________ ft2 _____
        ## __ rp0 __
mu_rp0_ft2 = 2545 ;  # rp0 mean
sigma_rp0_ft2 = 96 ; # rp0 Cells std
ft2_rp0 = sigma_rp0_ft2 * np.random.randn(rp0, 1) + mu_rp0_ft2;  ## For main rp0

        ## __ rt1 __
mu_rt1_ft2 = 2493 ;  ## rt1 cells mean 
sigma_rt1_ft2 = 77 ;  ## rt1 Cancer Cells std
ft2_rt1 = sigma_rt1_ft2 * np.random.randn(rt1, 1) + mu_rt1_ft2;  ##For Sub rt1

        ## __ qs2 __
mu_qs2_ft2 = 1979.38 ;  ## cells mean 
sigma_qs2_ft2 = 237.18 ;  ## Cancer Cells std
ft2_qs2 = sigma_qs2_ft2 * np.random.randn(qs2, 1) + mu_qs2_ft2;  ##For Sub qs2

        ## __ ac3 __
mu_ac3_ft2 = 2136.02 ;  ## cells mean 
sigma_ac3_ft2 = 172.56 ;  ## Cancer Cells std
ft2_ac3 = sigma_ac3_ft2 * np.random.randn(ac3, 1) + mu_ac3_ft2;  ##For Sub ac3


ft2final = np.vstack ((ft2_rp0, ft2_rt1, ft2_qs2, ft2_ac3)) ;
# ft2final = np.vstack ((ft2_rp0, ft2_qs2, ft2_ac3)) ;
# print ("ft2final", str(ft2final), '.\n')
# print ('ft2final lenght=', len(ft2final)) 
# print ('.\n')



    ## __________ na1 _____
        ## __ rp0 __
mu_rp0_na1 = 69.2 ;  # rp0 mean
sigma_rp0_na1 = 2.9 ; # rp0 Cells std
na1_rp0 = sigma_rp0_na1 * np.random.randn(rp0, 1) + mu_rp0_na1;  ## For main rp0

        ## __ rtt1 __
mu_rt1_na1 = 74.2 ;  ## rt1 cells mean 
sigma_rt1_na1 = 3 ;  ## rt1 Cancer Cells std
na1_rt1 = sigma_rt1_na1 * np.random.randn(rt1, 1) + mu_rt1_na1;  ##For Sub rtt1

        ## __ qs2 __
mu_qs2_na1 = 79.14 ;  ## cells mean 
sigma_qs2_na1 = 3.29 ;  ## Cancer Cells std
na1_qs2 = sigma_qs2_na1 * np.random.randn(qs2, 1) + mu_qs2_na1;  ##For Sub qs2

        ## __ ac3 __
mu_ac3_na1 = 83.36 ;  ## cells mean 
sigma_ac3_na1 = 3.05 ;  ## Cancer Cells std
na1_ac3 = sigma_ac3_na1 * np.random.randn(ac3, 1) + mu_ac3_na1;  ##For Sub ac3


na1final = np.vstack ((na1_rp0, na1_rt1, na1_qs2, na1_ac3)) ;
# na1final = np.vstack ((na1_rp0, na1_qs2, na1_ac3)) ;
# print ("na1final", str(na1final), '.\n')
# print ('na1final lenght=', len(na1final)) 
# print ('.\n')



    ## __________ fa1 _____
        ## __ rp0 __
mu_rp0_fa1 = 68.9 ;  # rp0 mean
sigma_rp0_fa1 = 4.2 ; # rp0 Cells std
fa1_rp0 = sigma_rp0_fa1 * np.random.randn(rp0, 1) + mu_rp0_fa1;  ## For main rp0

        ## __ rt1 __
mu_rt1_fa1 = 73.7 ;  ## rt1 cells mean 
sigma_rt1_fa1 = 2.6 ;  ## rt1 Cancer Cells std
fa1_rt1 = sigma_rt1_fa1 * np.random.randn(rt1, 1) + mu_rt1_fa1;  ##For Sub rt1

        ## __ qs2 __
mu_qs2_fa1 = 88.01 ;  ## cells mean 
sigma_qs2_fa1 = 4.27 ;  ## Cancer Cells std
fa1_qs2 = sigma_qs2_fa1 * np.random.randn(qs2, 1) + mu_qs2_fa1;  ##For Sub qs2

        ## __ ac3 __
mu_ac3_fa1 = 91.64 ;  ## cells mean 
sigma_ac3_fa1 = 2.69 ;  ## Cancer Cells std
fa1_ac3 = sigma_ac3_fa1 * np.random.randn(ac3, 1) + mu_ac3_fa1;  ##For Sub ac3


fa1final = np.vstack ((fa1_rp0, fa1_rt1, fa1_qs2, fa1_ac3)) ;
# fa1final = np.vstack ((fa1_rp0, fa1_qs2, fa1_ac3)) ;
# print ("fa1final", str(fa1final), '.\n')
# print ('fa1final lenght=', len(fa1final)) 
# print ('.\n')


  ## __________________ section 4 __________________

result = np.column_stack((identifier, rrfinal, nt1final, ft1final, nt2final, ft2final, na1final, fa1final))  
  # printing result 
#print ("resultant array", str(result)) 

# Adding row to numpy array 
# result2 = np.vstack ((ini_array, row_to_be_added) ) 
  
# # printing result 
# print ("resultant array", str(result)) 


  ## __________________ section 5 __________________

#File path example format:: C:/Users/Jing Li/Desktop/test.xlsx
    #Must be the name of a NEW file
    
result_excel = pd.DataFrame(result);

result_excel.to_excel(excel_writer = "C:/Users/Elizabeth/Documents/Eliza-Kev Python codes/90RespRest_10QuiAct_xlsx.xlsx");


#print ("result_excel", str(result_excel));
  ## __________________ End of program __________________


