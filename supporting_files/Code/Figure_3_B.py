from scipy.stats import cumfreq
import math;
import numpy as np;
import pylab as plt;
from scipy import stats;
#import statsmodels.api as sm # recommended import according to the docs


def is_number(s):
    try:
        float(s)
        return True
    except ValueError:
        return False




f4 = open("derived_features_validated.csv", "r");

fout = open("dev.csv", "w");
k=0;
ctr=-1;

tot_count={};
tot_count["Male"]=[0]*10;
tot_count["Female"]=[0]*10;

pos_count={};
pos_count["Male"]=[0]*10;
pos_count["Female"]=[0]*10;

neg_count={};
neg_count["Male"]=[0]*10;
neg_count["Female"]=[0]*10;


for txt in f4:
    txt_min=txt.replace("\n", "");
    ctr=ctr+1;
    if ctr>0 and ctr<10001:
        i = txt.strip().split(",");
        OverSpending = int(i[17]);
        SpatialLoyalty=i[10];
        Gender= i[13];
        #print SpatialLoyalty;
        #print OverSpending;
        
        if (is_number(SpatialLoyalty)):
            loy_bin= int(math.floor(float(SpatialLoyalty)*10));
            #print loy_bin;
            if loy_bin==10:
                loy_bin=9;
            tot_count[Gender][loy_bin] +=1;
            if (OverSpending ==1):
                pos_count[Gender][loy_bin] +=1;
        
            if (OverSpending ==0):
                neg_count[Gender][loy_bin] +=1;

for k in range(0,10):
    print "Male"+str(k)+","+str(pos_count["Male"][k])+","+str(tot_count["Male"][k]);

for k in range(0,10):
    print "Female"+str(k)+","+str(pos_count["Female"][k])+","+str(tot_count["Female"][k]);

    
print(tot_count);
print(pos_count);
print(neg_count);

f4.close();
fout.close();
