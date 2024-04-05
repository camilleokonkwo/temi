proc import datafile = "/home/u63083100/sasuser.v94/Thesisdata/Maternal Data.xlsx"
out= Maternal_data
dbms= XLSX Replace; 
sheet= sheet1; 
run;

proc import datafile = "/home/u63083100/sasuser.v94/Thesisdata/racism data.xlsx"
out= racism_data
dbms= XLSX Replace; 
sheet= sheet1; 
run;

data racism_data; set racism_data; 

data maternal_data; set Maternal_data; 

proc sort data = racism_data; by Place; 
proc sort data = maternal_data; by Place; 
run; 

data Q3; 
merge racism_data (in = a) maternal_data (in = b); 
by Place; 
if a and b;
run; 

/* this is where I got stuck*/

proc ttest data=Q3;

class Place; /* defines the grouping variable */

var Place; /* variable whose means will be compared */

run;







/*PLEASE IGNORE*/

* Assuming you have a dataset 'your_dataset' with variables: Maternal_Health, Structural_Racism, Gun_Violence, and other control variables;

* Create an interaction term;
data your_dataset;
    set your_dataset;
    Interaction_Term = Structural_Racism * Gun_Violence;
run;

* Fit the regression model;
proc reg data=your_dataset;
    model Maternal_Health = Structural_Racism Gun_Violence Interaction_Term Control_Variable_1 Control_Variable_2;
run;

