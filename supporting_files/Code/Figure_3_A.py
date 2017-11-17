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
tot_count["Young"]=[0]*10;
tot_count["Mid"]=[0]*10;
tot_count["Old"]=[0]*10;


pos_count={};
pos_count["Young"]=[0]*10;
pos_count["Mid"]=[0]*10;
pos_count["Old"]=[0]*10;


for txt in f4:
    txt_min=txt.replace("\n", "");
    ctr=ctr+1;
    if ctr>0 and ctr<10001:
        i = txt.strip().split(",");
        OverSpending = int(i[17]);
        SpatialLoyalty=i[10];
        Age= int(i[12]);
        if (Age<31):
            AgeRange="Young"
        else:
            if (Age<51):
                AgeRange="Mid";
            else:
                AgeRange="Old";
                        
        #print SpatialLoyalty;
        #print OverSpending;
        
        if (is_number(SpatialLoyalty)):
            loy_bin= int(math.floor(float(SpatialLoyalty)*10));
            if loy_bin==10:
                loy_bin=9;
            tot_count[AgeRange][loy_bin] +=1;
            if (OverSpending ==1):
                pos_count[AgeRange][loy_bin] +=1;


for k in range(0,10):
    print "Young"+str(k)+","+str(pos_count["Young"][k])+","+str(tot_count["Young"][k]);

for k in range(0,10):
    print "Female"+str(k)+","+str(pos_count["Mid"][k])+","+str(tot_count["Mid"][k]);

	
for k in range(0,10):
    print "Old"+str(k)+","+str(pos_count["Old"][k])+","+str(tot_count["Old"][k]);

    
print(tot_count);
print(pos_count);

f4.close();
fout.close();
