This repository is for the assignments given in the fuzzy logic course at Karadeniz Technical University.
#

#### [Assignment-1](https://github.com/rai-shi/Fuzzy-Logic-Lecture-Assignments/tree/master/Assignment-1)
This assignment required the writing of MATLAB codes for some fuzzy membership models. In this context, codes have been written for the following membership functions.
- Bell Shaped Membership Function
- Cauchy Membership Function
- Gaussian Membership Function
- Sigmoid Membership Function
- Sinusoid Membership Function
- Trapezoid Membership Function
- Triangle Membership Function
    - TriangleMembershipFunction.m file contains a function code that can draw three triangles.
    - Triangle.m file contains a function code that can draw only on triangles.
 
#### [Assignment-2](https://github.com/rai-shi/Fuzzy-Logic-Lecture-Assignments/tree/master/Assignment-2)
The following is requested in this assignment,

If the solar radiation level is 75 mW/cm² and the temperature is 25°C, find the power output of this fuzzy rule-based system in watts (W).

Based on this request, graphic codes have been written to first show the input and output sets using the relevant data from our course materials. You can find these codes in [this file](https://github.com/rai-shi/Fuzzy-Logic-Lecture-Assignments/blob/master/Assignment-2/MamdaniFuzzySet.m). 
Then, codes containing all stages of the Mamdani fuzzy modeling have been written. You can find these codes in [this file](https://github.com/rai-shi/Fuzzy-Logic-Lecture-Assignments/blob/master/Assignment-2/MamdaniSolution.m) as well. 
Additionally, there is a report in both English and Turkish for this assignment. The assignment and code content have been explained in detail.

#### [Assignment-3](https://github.com/rai-shi/Fuzzy-Logic-Lecture-Assignments/tree/master/Assignment-3)
In this assignment, the washing time of clothes stained with axunge and mud was to be calculated using fuzzy modeling. Codes have been written using the values provided in the course materials. 

As stated in the comment lines at the beginning of the code, the input and output sets have been defined. 
Then, steps such as fuzzification of the inputs using triangular membership functions, definition of the rules, processing of the rules, calculation of the results, and application of defuzzification steps follow. 
Finally, the results were calculated using both the maximum average method and the centroid method. At the bottom of the code lines, you can find the functions ```draw_triangles``` for drawing the graphs and ```calculateMembership``` for calculating the memberships. 
Additionally, this folder contains images and figures of the graphs for the Mud, Axunge, and Washing Time spaces. Finally, you can also find the Turkish report of the assignment in the folder.

#### [Assignment-4](https://github.com/rai-shi/Fuzzy-Logic-Lecture-Assignments/tree/master/Assignment-4)
In this assignment, we were asked to write an uncontrolled fuzzy system and a controlled fuzzy system with 9 rules and 25 rules using the state equation and given values seen on the first page of the Turkish report. 
In this context, an uncontrolled fuzzy system has been established with the help of the Runge and limiter codes from Prof. Dr. İsmail Hakkı Altaş. 
Then, for the second requirement, a fuzzy controller system with 9 rules has been designed. 
Unfortunately, there are no codes available for the 25-rule version.




