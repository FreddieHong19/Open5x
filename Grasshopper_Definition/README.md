To start using grasshopper first a Pursa 3D model need to be uploaded into the script.
To do this double click the component called 'Simulation' and inside right-click the component 'Prusa i3 Profile_PATH' and upload the file 'Prusa_5axis_profile_v2' 
Once complete this should show up in the simulation.

*5-axis slicing is a computation heavy and it is advised that you save the files before slicing

Please note that the current version is the developing version. and more stable versions are aimed to be relased very soon.
3 Different toolpath generator will be relased focusing at 1) Supportless 3D printing 2) Conformal Surface finish 3) Curve based conformal patterning.
There will be video guides for each toolpath generators

This grasshopper uses two library below:

https://www.food4rhino.com/en/app/heteroptera : To find a centroid of a 3D geometry

https://docs.microsoft.com/en-us/dotnet/api/system.linq?view=net-6.0 : To collect max/min values in list


Update
-----

2022-03-22: 
2022_03_22_open5x_supportless_surface_Lite 
*light version of slicing, shorter computation. Limited to single perimeter and no_infill.
Testes on 
supportless_Sample_2
supportless_sample_3_spiral
