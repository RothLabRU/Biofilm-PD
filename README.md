# Biofilm-PD
Data and code to reproduce model by Roychowdhury and Roth describing biofilm response to antibiotics in a flow cell environment

Files:
| MATLAB File   | Explanation   |
| ------------- | ------------- |
| Read_New1.m, Muskerror_New1  |  Error and optimization functions |
| TOBContinuousTreatment.m, Musken_5Comp | Continuous treatment for 5, 20, and 50 micrograms/mL of TOB  |
| TOB4HRCombined.m, Musken_wKs_after4.m  | 4 hour treatment for for 5, 20, and 50 micrograms/mL of TOB  |
| CSTContFINAL.m, CST_OneComp | Continuous treatment for 2.5, 10, and 25 micrograms/mL of TOB  |
| CST4hr_FINAL  | 4 hour treatment for 2.5, 10, and 25 micrograms/mL of CST |
| WithoutPara.m, Musken_woA.m, Musken_woB.m, Musken_woKt.m, Musken_woN.m, Musken_woU.m| How the model would be affected without each parameter |
| ParaSensitivity.m | Parametric sensitivity of the used parameters |

The Excel files contain the data points digitized from Musken that were used to validate the model. 
